
int x =276;
int y =370;

float easing = 0.02;
float speed = 2.5; //random
int diameter = 100; //random
float bodyx; //random
float bodyy; //random

 
void setup() {
size(650,550);
smooth(); //smooths lines
frameRate (5);

}
 
void draw() {
  
   float r = random (0, 255);
  float g = random (0, 255);
  float b = random (0, 255);
  background(r, g, b);
int targetX=mouseX;
x+= (targetX-x)*easing;
  x += random(-3, 3);
  y += random(-2, 2);

 
if (mousePressed) {
  y=400;
} else {
  y=370;
}

 myDrawRobot(100);
  myDrawRobot(400);

  
}


void myDrawRobot (int x) {
//body
noStroke();
fill(147,20,0);
rect(x-99,y-270,200,250);
fill(232,31,0);
rect(x-84,y-225,170,170);
fill(147,20,0);
rect(x-73,y-215,150,150);
fill(153);
ellipse(x-56, y-170, 15, 15);
fill(153);
ellipse(x-56, y-150, 15, 15);
fill(153);
ellipse(x-56, y-130, 15, 15);

fill(147,20,0); 
arc(x, y, 150, 150, radians(0), radians(180));

fill(0); 
ellipse(x, y-20, 45, 45);
fill(153); 
ellipse(x+139, y-20, 5, 5);

fill(0); 
ellipse(x+86,  y-20, 45, 45);
fill(153); 
ellipse(x+73,  y-20, 5, 5);

fill(0); 
ellipse(x+66,  y-20, 45, 45);
fill(153); 
ellipse(x+47,  y-20, 5, 5);

fill(0); 
ellipse(x+46,  y-20, 45, 45);
fill(153); 
ellipse(x+33,  y-20, 5, 5);

fill(0); 
ellipse(x+26,  y-20, 45, 45);
fill(153); 
ellipse(x+13, y-20, 5, 5); 

fill(0); 
ellipse(x+9,  y-20, 45, 45);
fill(153); 
ellipse(x-7,  y-20, 5, 5); 

fill(0); 
ellipse(x-14,  y-20, 45, 45);
fill(153); 
ellipse(x-27,  y-20, 5, 5); 

fill(0); 
ellipse(x-34,  y-20, 45, 45);
fill(153); 
ellipse(x-47,  y-20, 5, 5); 

fill(0); 
ellipse(x-54,  y-20, 45, 45);
fill(153); 
ellipse(x-67,  y-20, 5, 5); 

fill(0); 
ellipse(x-74,  y-20, 45, 45);
fill(153); 
ellipse(x-87,  y-20, 5, 5); 

fill(0); 
ellipse(x-94,  y-20, 45, 45);
fill(153); 
ellipse(x-107,  y-20, 5, 5); 

fill(0); 
ellipse(x-94,  y-20, 45, 45);
fill(153); 
ellipse(x-127,  y-20, 5, 5); 

//head
noStroke();
fill(147,20,0);
arc(x, y-270, 200, 200, radians(180), radians(360));

fill(0); 
ellipse(x, y-20, 45, 45);
fill(153); 
ellipse(x+139, y-260, 5, 5);

fill(0); 
ellipse(x+86,  y-260, 45, 45);
fill(153); 
ellipse(x+73,  y-260, 5, 5);

fill(0); 
ellipse(x+66,  y-260, 45, 45);
fill(153); 
ellipse(x+47, y-260, 5, 5);

fill(0); 
ellipse(x+46,  y-260, 45, 45);
fill(153); 
ellipse(x+33,  y-260, 5, 5);

fill(0); 
ellipse(x+26,  y-260, 45, 45);
fill(153); 
ellipse(x+13, y-260, 5, 5); 

fill(0); 
ellipse(x+9,  y-260, 45, 45);
fill(153); 
ellipse(x-7,  y-260, 5, 5); 

fill(0); 
ellipse(x-14,  y-260, 45, 45);
fill(153); 
ellipse(x-27,  y-260, 5, 5); 

fill(0); 
ellipse(x-34,  y-260, 45, 45);
fill(153); 
ellipse(x-47,  y-260, 5, 5); 

fill(0); 
ellipse(x-54,  y-260, 45, 45);
fill(153); 
ellipse(x-67,  y-260, 5, 5); 

fill(0); 
ellipse(x-74,  y-260, 45, 45);
fill(153); 
ellipse(x-87,  y-260, 5, 5); 

fill(0); 
ellipse(x-94,  y-260, 45, 45);
fill(153); 
ellipse(x-107,  y-260, 5, 5); 

fill(0); 
ellipse(x-94,  y-260, 45, 45);
fill(153); 
ellipse(x-127,  y-260, 5, 5); 

//eyes
fill(255);
ellipse(x+46, y-315, 50, 50);
fill(0);
ellipse(x+46, y-315, 45, 45);
fill(255); 
ellipse(x+52, y-320, 14, 14); 

fill(255);
ellipse(x-40, y-315, 50, 50);
fill(0);
ellipse(x-40, y-315, 45, 45);
fill(255); 
ellipse(x-28, y-320, 14, 14); 

}

