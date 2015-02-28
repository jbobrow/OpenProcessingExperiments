
import seltar.motion.*;
Direction d;

void setup(){
  size(960,540);
  smooth();
  d = new Direction(random(width),random(height));
}

void draw(){
  background(0,100,0);
  d.display();
}

class Direction{
  Motion m;
  Direction(float X, float Y)
    {
      m = new Motion(X,Y);
    }
  
  void move(){
    m.followTo(mouseX,mouseY);
    m.wrap(0,0,width,height);
    m.move();
  }
  
  void display(){
    move();
    stroke(128);
    noFill();
    strokeWeight(20);
    ellipse(m.getX(),m.getY(),11,11);
    strokeWeight(3);
    drawVector(50);
  }
  
  //
  void drawVector(float scayl){
    stroke(200);
    float arrowsize = 20;
    
    pushMatrix();
      translate(m.getX(),m.getY());
      rotate(m.v.getDirection());
      float len = m.v.getVelocity()*scayl;
    
      // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
      line(0,0,len,0);
      line(len,0,len-arrowsize,+arrowsize/2);
      line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
    //testestest
  }
}


