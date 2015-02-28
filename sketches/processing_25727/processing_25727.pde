
Cyclops one;
Cyclops two;
Cyclops three;
 
void setup(){
  one= new Cyclops(100,50,150);
  two= new Cyclops(50,70,80);
  three= new Cyclops(20,100,60);
  size(500,200);
  smooth();
}
void draw(){
  background(mouseX,10,mouseY);
  one.move();
  one.display();
  two.move();
  two.display();
  three.move();
  three.display();
  
}
 
class Cyclops{
  //variables
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
   Cyclops(int tempXpos, int tempYpos, color tempC){
    // constructor
    c=tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed =3;
  }
  
   void display() {
     ellipseMode( CENTER); 
 
 
 //background (0);
 
  
 
  stroke(0);
  strokeWeight(1);
  fill(255,255, ypos);
  ellipse(xpos,ypos,150,150); //face
   
  noStroke();
  fill(xpos,10 ,ypos);
  ellipse(xpos,ypos+50,50,30); //mouth
 
 
 //eye
  stroke(0);
  fill(255);
  ellipse(xpos,ypos-20,60,40); 
  fill(0);
  noStroke();
  ellipse(xpos,ypos-20,9,9);
  
  
}

 
  void move() { 
    xpos = xpos +xspeed;
    if (xpos>width) {
      xpos = 2;
    }
  }
}

