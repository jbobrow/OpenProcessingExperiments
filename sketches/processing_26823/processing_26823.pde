
//jasmine hoyle 
//project 3
//classes

Circle myCircle;
void setup() { 
  size(200,200);
  
// Initialize Circle object 
myCircle = new Circle();
}

void draw() { 
  background(20,30,30); 
  smooth();
  // Operate Circle object. 
  myCircle.move(); 
  myCircle.display();
}

class Circle {

color c; 
color c2;
float xpos; 
float ypos; 
float xspeed;

Circle() { 
  c = color(40,30,255); 
  c2 = color (255,20,20);
  xpos = width/2; 
  ypos = height/2; 
  xspeed = 1;
}


void display() {
// draw the circle 
fill(c); 
ellipse(xpos,ypos,100,100);
fill (c2);
ellipse(xpos, ypos,20,20);
}



void move() {

xpos = xpos + xspeed; 
if (xpos > width) {
xpos = 0;
}

}

}

