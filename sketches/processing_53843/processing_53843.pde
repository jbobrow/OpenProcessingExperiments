
 //http://www.scribd.com/doc/34666818/Getting-Started-with-Processing
 
  size(250, 250);
  background (0);
  smooth();
  
  //class/bug
  bug = new JitterBug(width/2, height/2, 20);
 
 //setup of  "JitterBug" bug
void draw() {
  bug.move();
  bug.display();
  fill(0,0,0,5);
}
 

class JitterBug {
  float x;
  float y;
  int diameter;
  float speed = 10;
   
  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
 //decides the path pattern and speed of circle
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
    
 //characteristics of the moving entity; colour, stroke, shape
  void display() {
    noStroke();
    fill(random(255), random(255), random(255), 25);
    ellipse(x, y, mouseX/4, mouseY/4); //ellipse activates by mouse hover
  }
}
