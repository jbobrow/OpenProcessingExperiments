
Square mySquare1; 
Square mySquare2;

void setup() { 
  size(200,200);
  mySquare1 = new Square(color(255,0,0),0,100,4); 
  mySquare2 = new Square(color(0,0,255),0,10,1);
}

void draw() {	
  background(0);
  mySquare1.move(); 
  mySquare1.display(); 
  mySquare2.move(); 
  mySquare2.display();
} 
class Square {
  color c; 
  float xpos; 
  float ypos; 
  float xspeed;
  
  Square(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC; 
    xpos = tempXpos; 
    ypos = tempYpos;
    xspeed = tempXspeed*1.5;
  }
  void display() { 
    stroke(0); 
    fill(c); 
    rectMode(CENTER); 
    rect(xpos,ypos,20,20);
  }
  void move() { 
    xpos = xpos + xspeed; 
    if (xpos > width) {
      xpos = 0;
    }
  }
}


