
// arrays to hold ellipse coordinate data
float[] px, py, cx, cy, cx2, cy2;

float thex, they;
float theAngle, angle2;
float radius;
// lower freq for slower, higher for faster
float frequency = 10;
float frequency2 = 10;
float x, x2;

// global variable-points in ellipse
int pts = 4;

//PFont myFont;

// some environmental control
boolean canhasPause = false;
boolean palletteBackground = false;

// required by pallette funcs
int paletteSelector = int(random(10));

color[] thisColor = new color[5];

color theBackGroundColor;

color controlPtCol = colorFromPalette();
color anchorPtCol = colorFromPalette();

void setup(){
  size(400, 400);
  //size(1680,1050);
  smooth();
  
  // init thex and they coordinates
   thex = width/2  + cos(radians(theAngle))*(radius/2);
    they = height/2 + sin(radians(theAngle))*(radius/2);
  //background(int(random(255)));
  
  //sort out some colors
  paletteSelector = int(random(10));
  
  theBackGroundColor = colorFromPalette(); 
  stroke(colorFromPalette());
  // get a pallette background color if the user presses 'b' or 'B'  
      if (palletteBackground) {background(theBackGroundColor); }
      else { background(255);}
 
  rectMode(CENTER);
  setEllipse(pts, 65, 65);
  radius = width-10;
  frameRate(10);
  
  //myFont = createFont("verdana", 12);
  //textFont(myFont);
}

void draw(){
  smooth();
  drawEllipse();
  
    if (frameCount % 2 == 0){
  setEllipse(int(random(3, 12)), random(-100, 150), random(-100, 150));
  }
  else {
    setEllipse(int(random(thex-thex/2, thex)), random(-they/2, they/2), random(-100, 150));
  }
  
  theAngle += frequency;
  x+=1;
  
    thex = width/2  + cos(radians(theAngle))*(radius/2);
    they = height/2 + sin(radians(theAngle))*(radius/2);
   println("thex: " +thex+ " , they: " + they + " theAngle: " + theAngle);
  
}


// draw ellipse with anchor/control points
void drawEllipse(){
  
  float radius = 100;
  float angle = 0;
  
  
  strokeWeight(1);
  stroke(colorFromPalette(), 20);
  noFill();
  // create ellipse
  for (int i=0; i<pts; i++){
    if (i==pts-1) {
     //bezier(px[i], py[i], cx[i], cy[i], cx2[i], cy2[i],  px[0], py[0]);
      bezier(thex, they, cx[i], cy[i], cx2[i], cy2[i],  px[0], py[0]);
    }
    else{
     //bezier(px[i], py[i], cx[i], cy[i], cx2[i], cy2[i],  px[i+1], py[i+1]);
      bezier(thex, they, cx[i], cy[i], cx2[i], cy2[i],  px[i+1], py[i+1]);
    }
  }
  strokeWeight(1);
  stroke(colorFromPalette(), 20);
  //stroke(int(random(255)), 140, 140, 20);



  //
  rectMode(CENTER);

  // control handles and tangent lines
  for ( int i=0; i< pts; i++){
    if (i==pts-1){  // last loop iteration-close path
      line(px[0], py[0], cx2[i], cy2[i]);
    }
    if (i>0){
      line(px[i], py[i], cx2[i-1], cy2[i-1]);
    }
    line(px[i], py[i], cx[i], cy[i]);
  }

  for ( int i=0; i< pts; i++){
    fill(colorFromPalette(), 5);
    noStroke();
    //control handles
    ellipse(cx[i], cy[i], 4, 4);
    ellipse(cx2[i], cy2[i], 4, 4);

    fill(colorFromPalette());
    stroke(colorFromPalette(), 2);
    //anchor points
    //rect(px[i], py[i], 5, 5);
  }
}

// fill up arrays with ellipse coordinate data
void setEllipse(int points, float radius, float controlRadius){
  pts = points;
  px = new float[points];
  py = new float[points];
  cx = new float[points];
  cy = new float[points];
  cx2 = new float[points];
  cy2 = new float[points];
  float angle = 360.0/points;
  float controlAngle1 = angle/3.0;
  float controlAngle2 = controlAngle1*2.0;
  for ( int i=0; i<points; i++){
    px[i] = width/2+cos(radians(angle))*radius;
    py[i] = height/2+sin(radians(angle))*radius;
    cx[i] = width/2+cos(radians(angle+controlAngle1))* 
      controlRadius/cos(radians(controlAngle1));
    cy[i] = height/2+sin(radians(angle+controlAngle1))* 
      controlRadius/cos(radians(controlAngle1));
    cx2[i] = width/2+cos(radians(angle+controlAngle2))* 
      controlRadius/cos(radians(controlAngle1));
    cy2[i] = height/2+sin(radians(angle+controlAngle2))* 
      controlRadius/cos(radians(controlAngle1));

    //increment angle so trig functions keep chugging along
    angle+=360.0/points;
    
      //

    
  }
}


void mousePressed(){
  canhasPause = !canhasPause;
  if (canhasPause)
    noLoop();
  else
    loop();
}


void keyPressed(){

  println("keypressed = " + key);
   
  if (key == 'q' || key == 'Q') {
    setup();
  } 

  if (key == 's' || key == 'S') {
    save("liner" + frameCount + ".png");
     println("Saving file.");
    //pikcha.save( "mBoverlay" + frameCount + ".png" );
     // println("Saving overlay.");
  } 

 
}



