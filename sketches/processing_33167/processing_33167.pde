
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 3-6: Interactive Zoog?


float circleY;
float circleX;
float velY = 5;
float velX = 10;



void setup() {
  size(500, 500);
  smooth();
  frameRate(30);  

  //  colorMode(RGB, 255);
}

void draw() {
  background(188, 190, 192); //draw rect  
  
  fill(255, 217, 0);
  noStroke();

  circleX +=velX;
  circleY +=velY;
  



  if (circleX<100) {
    fill(random(0, 255), random(0, 255), random(0, 197), random(50, 100));
  }
  else if((circleX>100)&&(circleX<200)){
    fill(random(0, 100), random(0, 100), random(0, 10), random(50, 100));
  }
  else{
    fill(random(0, 255), random(0, 255), random(0, 255), random(50, 100));    
  }

  ellipse(circleX, circleY, 20, 20);

  if ((circleY<0)||(circleY>height)) {
    velY=velY*-1;
  }
  if ((circleX<0)||(circleX>width)) {
    velX=velX*-1;
  }
  
  

  
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  // Draw Zoog's body
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);

  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60); 

  // Draw Zoog's eyes
  // The eye color is determined by the mouse location.
  fill(mouseX,0,mouseY); 
  ellipse(mouseX-19,mouseY-30,16,32); 
  ellipse(mouseX+19,mouseY-30,16,32); 

  // Draw Zoog's legs
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60); 
  
  
}


