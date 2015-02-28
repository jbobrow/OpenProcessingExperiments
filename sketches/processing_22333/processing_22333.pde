

//Rotate the triangle so they always point to the cursor
//By Brian Pittman
float x = 300;
float y = 300;

float y1 = 300;
float y2 = 150;
float y3 = 100;
float y4 = -300;

void setup() {
  size (600, 600);
  fill(200, 45, 86);
  strokeWeight(10);
  smooth();
}
  

void draw() {
background(57, 14, 178);

float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
//option for speed
float diameter = speed * 0.0;


//Ellipse location
ellipse(300, 300, mouseX, mouseY);
//atan(y,x) function used to calculate the angle from any point to the coordinate (0,0).
//It has two parameters.This information is acquired from the "Processing"(Programming handbook)

//Top triangle
  float angle = atan2(mouseY-y1, mouseX-x);
  pushMatrix();
  translate(x, y1);

  rotate(angle); 
  triangle(-20, -100, 20, 0, -20, 100);//Size of triangle
  
   
  popMatrix();
  pushMatrix();
  
  //Bottom triangle
 float angle2 = atan2(mouseY-(y2), mouseX-x);
 translate(x, y2);
 rotate(angle2);
 triangle(-20, -80, 20, 0, -20, 80);
 //Free triangle
 translate(x, y3);
 rotate(angle);
 triangle(-20, -80, 20, 0, -20, 80);
 
 translate(x, y4);
 rotate(angle);
 triangle(-20, -80, 20, 0, -20, 80);
 popMatrix();
 
}

