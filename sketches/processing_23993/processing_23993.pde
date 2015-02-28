
int y = 80;
int x = 50;
int w = 60;
int h = 60;
int eyeSize = 16;
int speed = 1;
int spacing =10;
int len = 20;


void setup() {
  // Set the size of the window
  
  size(200,200);
  smooth();
  frameRate(30);
}

void draw() {
  // Change the x location of Zoog by speed
  x = x + speed;
  
  if( (x > width)||(x<0)) {
   speed = speed * -1;
  } 
 
  background(255);// Draw a black background
  
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Draw Zoog's body
  stroke(0);
  fill(225,0,255);
  rect(x+10,y,30,100);
  
  // Draw Zoog's head
  stroke(0);
  fill(225);
  ellipse(x+15,y-30,80,80);
  
  // Draw Zoog's eyes
  fill(x,0,y);
  ellipse(x,y-40,12,28);
  ellipse(x+30,y-40,12,28);
  
  // Draw Zoog's legs
  stroke(0);
  line(x,y,x,y+len);
  x = x + spacing;
  line(x,y,x,y+len);
  
  // Draw Zoog's arms with a for loop
  for (int i =y+2; i < y + h; i+=35) {
    stroke(0);
    line(x-w/2,i,x+w/3,i);
  }  

  
 // Draw zoog's mouth
 stroke(0);
 fill(225,0,0);
 ellipse(x+13,y-10,10,20);
 
 // Draw zoog's ears
 stroke(0);
 fill(225);
 ellipse(x-30,y-25,10,20);
 ellipse(x+60,y-25,10,20);
 
 // Draw Zoog's feet
 stroke(0);
 fill(255,200,200);
 ellipse(x-5,y+60,12,12);
 ellipse(x+15,y+60,12,12);
 
 // Draw Zoog's hat
 stroke(0);
 fill(255,200,200);
 rect(x+16,y-70,35,15);
 
 // Draw Zoog's eye pearls
 stroke(0);
 fill(0);
 ellipse(x-5,y-40,10,10);
 ellipse(x+30,y-40,10,10);
 
 // Draw Zoog's face
 stroke(255,200,200);
 fill(255,200,200);
 ellipse(x-3,y-10,18,18);
 ellipse(x+30,y-10,18,18);
 
}




  

  

