
  /*
  Kaito Gengo
  Visualize 60 Secs
  this program counts up to 60 seconds,
  and every circle represents as 10 seconds
  by clicking the window will change the fram rate.
  */
  
  int origin, x1, y1, x2, y2; //sent intergers for the triangle
  int add;
  
  //timecontrole
  int startTime;
  
  //color
  float hue, sat, bright, alpha; // HSB color + alpha
  int originCol = 360;
  boolean hueCol = true;
  
  //angle
  float angle_degrees;
  
  //boolean for line stroke
  boolean lineS = true;
  float lineHeight = - 50;
  
  //counting valuables
  int count = 1;
  int countTime = 0;
  int countMouseClick = 0;
  int stepElip = -5;
  
  //scale size
  int scalS;
  
void setup(){
  size (750, 750);
  startTime = millis();
  frameRate(10);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
 
  //original triangle shape
  origin = 0;
  x1 = 0;
  y1 = -50;
  x2 = -30;
  y2 = -40;
  
  //original color
  hue = 0;
  sat = 50;
  bright = 100;
  alpha = 100 ;
}


//change the frameRate when mouse is pressed
void mousePressed(){
  countMouseClick++;
  if(countMouseClick == 1 ){
    frameRate(100);
  } else if(countMouseClick == 2){
    frameRate(1);
  } else {
    frameRate(10);
    countMouseClick = 0;
  }
  println("mouse = " + countMouseClick);
}


void draw(){
  //text on the bottom left
  textSize(15);
  fill(0, 0, 100, 100);
  text("Visualize 60 Secs", 25, 700);
  text("Click to change the speed", 25, 725);
    
  //set the origin as the middle of the canvas
  translate(width/2, height/2); 

  //scale up objects every 10 seconds
  if(countTime >= 0 && countTime < 100){
    scalS = 1;
  } else if(countTime >= 100 && countTime < 200){
    scalS = 2;
  } else if (countTime >= 200 && countTime < 300){
    scalS = 3;
  } else if (countTime >= 300 && countTime < 400){
    scalS = 4;
  } else if (countTime >= 400 && countTime < 500){
    scalS = 5;
  } else if (countTime >= 500 && countTime < 600){
    scalS = 6;
  } 
  countTime++;
  
  //ellipse that moves up
  if(countTime % 10 == 0){
  ellipse(origin, origin + stepElip, 1, 1);
  stepElip = stepElip - 5;
  }
  if(countTime % 100 == 0){
  ellipse(origin, origin + stepElip + 5, 5, 5);
  }
  
  //rotation
  angle_degrees = angle_degrees + 3.6;
  float angle_radians = radians(angle_degrees);
  rotate(angle_radians);
  
  //line stroke
  if (lineHeight <= - 50){
    lineS = false;
  } else if (lineHeight >= 25){
    lineS = true;
  }
  if(lineS == false){
    lineHeight = lineHeight + 0.5;
  } else {
    lineHeight = lineHeight - 0.5;
  }
  stroke(hue, sat, bright, alpha / 5);
  line(origin, origin, origin, lineHeight * scalS);
  
  //ellipse
  fill(hue, sat, bright, alpha);
  ellipse(origin, y1 * scalS, 2, 2);
  
  //triangle object
  scale(scalS);
  noStroke();
  fill(hue, sat, bright, alpha / 100); // corlor of the triangle
  triangle(origin, origin, x1, y1, x2, y2);
  
  //change the color of the triangle
  //when hue reaches to 360 the number decrease.
  if(hue >= 360){
   hueCol = false;
  } else if (hue <= 0){
   hueCol = true;
  }
  if(hueCol == false){
    hue = hue - 0.5;  
  } else {
    hue = hue + 0.5;
  }
  
  //reset the background every 60 second
  //and counts the time from 0
  if(countTime == 600){
    noStroke();
    fill(0, 0 , 0, 85);
    rectMode(CENTER);
    rect(origin, origin, width, height);
    //reset the countTime
    countTime = 0;
    count++;
    resetMatrix();
    stepElip = -5; // reset the ellipse that moves up
  }
  startTime = millis();
}


