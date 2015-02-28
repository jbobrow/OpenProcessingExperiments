

Kid a;

void setup(){
  // Set the size of the window
  size(200,200);
  smooth();
  
  a = new Kid ();
}


void draw() {
background(250, 224, 25);

a.displayFace();
a.move(); 
}
class Kid {
  float x =width/2;
  float y = height/2;
 
 void move() {
  x = mouseX; 
  y = mouseY;  
 
  }
 
   void displayFace() {
  stroke(0);
  fill(245, 218, 175);
  ellipse(x,y,100,100);
  // characters eyes
  fill(255);
  ellipse(x-20,y,30,40);
  ellipse(x+20,y,30,40);

  //characters pupils
  fill(8, 133, 255);
  ellipse(x-10, y, 10, 20);
  ellipse(x+10, y, 10, 20);
 
 //characters smile
 fill(255);
  ellipse(x+2,y+30, 16, 20);
 

  
}
}


