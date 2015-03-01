
Mover m1 = new Mover(100, 100, 10); 
Mover m2 = new Mover(200, 200, 15); 
void setup()
{ 
  size(640, 480); 
}


void draw(){ 
  fill(random(255), random(255), random(255), 10);
  rect(0, 0, 640, 480); 
  ellipse(mouseX, mouseY, 20, 20);
  if(mousePressed)
  {
  fill(mouseY, random(255), random(255));
  rect(mouseX+random(-25, 25), mouseY+random(-25, 25), random(5, 10), random(5, 10));
  }
  m1.display();  
  m2.display();
}


class Mover {   
  int x; 
  int y; 
  int speed; 
  int xspeed=10;
  int yspeed=5;
  int xpos=350;
  int ypos=250;
  Mover(int _x, int _y, int _speed) {
    x = _x;
    y = _y;
    xpos = xpos+xspeed;
    ypos = ypos+yspeed;
    speed = _speed;
  }

  void display() {
    if(x<0 || x>width){ 
      speed = -1*speed; 
    }
    x = x+speed; 
    stroke(100, 50, 0); 
    fill(100, 100, 255); 
    ellipse(x,y,13.75,13.75); 
    fill(random(255), random(255), random(255));
    ellipse(x-20,y,13.75,13.75);
    filter(DILATE);
  }
  

}

