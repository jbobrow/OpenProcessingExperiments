
//http://mathworld.wolfram.com/Daisy.html


//archimedes spiral: r = a*theta

float theta, r, a, angleIncrement, cX, cY, circleDiameter, hueIncrement;

color thisColor;

void setup() {

  size(500, 500);
  background(255);

  theta = 0;
  a = 10;
  angleIncrement = PI/6;
  cX = 0;
  cY = 0;
  circleDiameter = 5;
  
  //amount to increment hueLocation per orbit
  hueIncrement = 2*PI/3; 


  colorMode(HSB, 360, 100, 100);

  

  //frameRate(3);
}



void draw() {
  background(0);
  

  a = map(mouseX, 0, width, 3, 25);
  angleIncrement = map(mouseY, 0, height, PI/6, PI/60);
  

  //println("a = " + a + " angleIncrement = " + angleIncrement/PI);



  drawDaisyNoColor(0);

}




void drawDaisyNoColor( float angleOffset) {

  //angle increment should increase with theta?
  noStroke();
  theta = 0;

  circleDiameter = 1;

  r = a * (theta);
  cX = r * cos(theta+angleOffset);
  cY = r*sin(theta+angleOffset);

  //fill determined by angle?

  float hueLocation = 0;





  pushMatrix();
  translate(width/2, height/2);

  while (cX < width/2*.85) {

    //choose color, which is based on theta
    switch ((floor((theta + hueLocation)/(2*PI/3)))%3) {
    case 0:
      //blue
     // thisColor = color(199, 61, 64);
      thisColor = color(143, 98, 99);
      break;
    case 1:
      //yellow
      thisColor = color(58, 94, 84);
      break;
    case 2:
      //red-orange
      thisColor = color(15, 95, 95);
      break;
    }
    
    fill(thisColor);


    //draw the ellipse
    ellipse(cX, cY, circleDiameter, circleDiameter);
    
    
    //increment theta
    theta += angleIncrement;
    
    //calculate the next radius
    //r = a*theta (archimedes spiral)
    r = a * (theta);
    
    
    //convert r to x&y cartesian coordinates
    cX = r * cos(theta+angleOffset);
    cY = r*sin(theta+angleOffset);
    
    //diameter of circles increases with theta
    circleDiameter = theta;
    
    
    //if the angle is equivalent to 0...
    if(cos(theta) > 0.9){
      
      //increment hueLocation
      hueLocation +=hueIncrement;
      
     // println("hueLocation = " + hueLocation + " theta = " + theta);
    }
  }

  popMatrix();
}


void keyPressed(){
 if (key == 'q'){
  hueIncrement +=PI/12;
 } 
 else if (key == 'w'){
  hueIncrement -=PI/12; 
 }
 // if (key =='a'){
  //saveFrame("daisy-###.jpg");
  
// } 
}
