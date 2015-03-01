
/* @pjs preload="turq.jpg"; */ 

float red, blue, green;
float noiseVal;
float time = millis()*0.001;
float sine = sin(time);
PImage bg; 
PFont main;

void setup() {
  //P3D is in 3d
  size(700, 700,P3D);
  bg = loadImage("turq.jpg");

  
}

void draw() {
  background(bg);
  smooth();
  
  
  //main = loadFont("232MKSD-RoundedLight-36.vlw");
  //textFont(main, 36);
  textSize(38);
  text("TIME TRAVEL RACER 5000", 170, 370);

  
  stroke(191, 236, 255);
  strokeWeight(1);
  noFill();
  rect(150, 327, 521, 60);
  
  rect(150, 400, 215, 270);
  //
  textSize(14);
  text("PRESET DESTINATIONS", 165, 425);
  text("65,000,000 B.C.", 175, 450);
  text("3000 B.C.", 175, 475);
  
  fill(191, 236, 255);
  rect(150, 485, 215, 20);
  
  fill(0,0,0);
  text("1150 B.C.", 175, 500);
  fill(191, 236, 255);
  stroke(191, 236, 255);
  noFill();
  
  text("December 25, 0", 175, 525);
  text("September 4, 476", 175, 550);
  text("January 5, 1066", 175, 575);
  text("July 4, 1776", 175, 600);
  text("October 24, 1929", 175, 625);
  text("November 22, 1963", 175, 650);
  
  text("ENTER MONTH:", 400, 425);
  rect(402, 440, 243, 25);  
  text("ENTER DAY:", 400, 495);
  rect(402, 510, 243, 25);
  text("ENTER YEAR:", 400, 565);
  rect(402, 580, 243, 25);
  
  text("PRESS AND HOLD ENTER", 480, 645);
  
  
  rect(380, 400, 291, 270);
  
  
  rect(width/22, height/22, 300, 270);
  rect((width/22)*12 - 3, height/22, 300, 270);
  ellipse(72, 365, 75, 75);
  ellipse(72, 455, 75, 75);
  ellipse(72, 545, 75, 75);
  ellipse(72, 635, 75, 75);
  
  //horizontal line
//  line(72, 335, 72, 395);

  //PERLIN NOISE!!!
  for(int x=width-329; x < 668; x++) {
    //y is connecting noise to the framecount
    noiseVal = noise(x, frameCount*0.02);
    //defining the color - green
    stroke((noiseVal*163), (noiseVal*235), (noiseVal*255));     
    //changing the height and width of line and adding the perlin noise effect
    line(x, map(noiseVal, 0, 1, 1, 295), x, 300); 
    }

  
  

  pushMatrix();
  
  if(keyPressed) {
    
    fill(191, 236, 255);
    textSize(24);
    text("PROCESSING...", 125, 250);
    
    //ATTRACTOR!!!
    float a = 2 + sin(millis()*0.001);
    float b = -3;
    float c = -1.2;
    float d = -2;
    translate(width/4 - 10, height/4 - 10);
    scale(53, 53);
    float numPoints = 10000;
    float x0 = 0; 
    float x1 = 0;
    float y0 = 0; 
    float y1 = 0;
  
    for(int i=0; i < numPoints; i++) {
      //makes it green!
      red=map(noise(i,i+191), 0, 1, 160, 160);
      green=map(noise(i+25, i+25), 0, 1, 230, 230);
      blue=map(noise(i+255, i+255), 0, 1, 255, 255);
      x1=sin(a*y0)-cos(b*x0);
      y1=sin(c*x0)-cos(d*y0);
      stroke(red, green, blue);
      //line(x1, y1, x1+
      point(x1, y1);
      x0=x1;
      y0=y1;
    } 
  }
  popMatrix();
  pushMatrix();
  
      //rotate first circle
  noStroke();
  fill(191, 236, 255);
  rectMode(CENTER);
  float time = millis()*0.001;
  float sine = sin(time);
  float angle = atan2(frameCount*10, 25);
  //rotate around center of ellipse
  translate(72, 365);
  rotate(sine);
  rotate(angle);
  rect(0, -23, 1, 46);

  //rect(72, 425, 1, 60);
  //rect(72, 515, 1, 60);
  //rect(72, 605, 1, 60);
  //rect(0, 0, 200, 200);
  //change back to 0,0  

 popMatrix();
 pushMatrix();
 
 //rotate second circle
 //rectMode(CENTER);
 float time2 = millis()*0.004;
 float sine2 = sin(time2);
 float angle2 = atan2(frameCount, -5);
   
 translate(72, 455);
 rotate(sine2);
 rotate(angle2);
 rect(0, -23, 1, 46);
   
 //translate BACK to 0,0
 translate(0, 0);
 rectMode(CORNER);
    

popMatrix();
pushMatrix();

 //rotate third circle
 //rectMode(CENTER);
 float time3 = millis()*0.001;
 float sine3 = sin(time3);
 float angle3 = atan2(frameCount, -5);
   
 translate(72, 545);
 rotate(sine3);
 rotate(angle3);
 rect(0, 0, 1, 46);
   
 //translate BACK to 0,0
 translate(0, 0);
 rectMode(CORNER);
  
popMatrix();  

 //rotate third circle
 //rectMode(CENTER);
 float time4 = millis()*0.006;
 float sine4 = sin(time4);
 float angle4 = atan2(frameCount, -5);
   
 translate(72, 635);
 rotate(sine4);
 rotate(angle4);
 rect(0, 0, 1, 46);
   
 //translate BACK to 0,0
 translate(0, 0);
 rectMode(CORNER);
  
}


