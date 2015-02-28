
//Processing http://processing.org/learning/topics/reach1.html


float x = 420;
float y = 300;
float x2 = 420;
float y2 = 300;
float segLength = 100;

void setup() {
  size(800, 600);
  smooth(); 
  strokeWeight(20);
  stroke(0, 100);
  // noLoop(); //
}

void draw() {
  background(#FFFFFF);
  //for Arms
  strokeWeight(20);
  float dx = mouseX - x;
  float dy = mouseY - y;
  float angle1 = atan2(dy, dx);  

  float tx = mouseX - cos(angle1) * segLength;
  float ty = mouseY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  float angle2 = atan2(dy, dx);  
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;

  segment(x, y, angle1); 
  segment(x2, y2, angle2); 

  //for Definition of clean code
  x = 400;
  y = 200;
  // line(0, y, width, y); //line(x1,y1,x2,y2)

  //Body
  strokeWeight(5);
 //Back Helmet
triangle(x+15,y-90, x-40, y-20, x+80, y-20);

  //Head 
  rect(x-7, y-80, 50, 60);

  //Head Eyes
  rect(x-2, y-50, 10, 7);//left
  rect(x+28, y-50, 10, 7);//right

//Nose
  rect(x+15, y-50, 5, 20);


  //Helmet
  ellipse(x+15, y-90, 75, 80);

  //Helmet Eyes
  ellipse(x-10, y-90, 50, 50);//Left
  ellipse(x-15, y-90, 5, 5);//Left eye

  ellipse(x+40, y-90, 50, 50);//right
  ellipse(x+45, y-90, 5, 5);//right eye

  //Neck
  rect(x+15, y-20, 5, 80);
 
  //Body  
  rect(x-10, y, 60, 80);

  //torso axel
  rect(x+10, y+80, 20, 20);

  //lowerbody
  rect(x-10, y+100, 60, 25);

  //Left Leg
  triangle(x+5, y+130, x-10, y+130, x-15, y+160);
  //Left knee
  rect(x-18, y+160, 10, 10);
  //Below Left Knee
  triangle(x-15, y+170, x, y+215, x-20, y+215);


  //Rightt Leg
  triangle(x+30, y+130, x+50, y+130, x+40, y+160);
  //Right knee
  rect(x+35, y+160, 10, 10);
  //Below Right Knee
  triangle(x+40, y+170, x+30, y+215, x+50, y+215);

  //Left Arm
  rect(x-90, y, 70, 10);
  //left elbow
  rect(x-110, y, 10, 10);
  //left forarm
  rect(x-110, y+20, 10, 60);
  //left hand
  rect(x-110, y+85, 15, 20);
  //left thumb
  rect(x-90, y+90, 10, 7);


  //Right Arm
  rect(x+60, y, 70, 10);
  //Right elbow
  rect(x+140, y, 10, 10);
  //Right forarm
  rect(x+140, y-70, 10, 60);
  //Right Hand
  rect(x+135, y-95, 15, 20);
  //Right thumb
  rect(x+125, y-85, 10, 7);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}


