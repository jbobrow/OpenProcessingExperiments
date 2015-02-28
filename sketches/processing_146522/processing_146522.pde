
/*Tarea 4
Referencias de codigo de Chris Martin*/
Particle p[] = new Particle[10];
 
void setup() {
  size( 400, 400);    
  background(126);    
   

  for (int i=0;i<p.length;i++) {
    
    p[i]=new Particle();
  }
  
  noFill();
}
 
void draw() {
 
   
 
  for (int i=0;i<p.length;i++) {
    p[i].move();
  }
}
 

class Particle {
 
  float xPos=0; 
  float yPos=0;
  float d=0;
 

  public Particle() {

    xPos = random(width);
    yPos = random(height);
    d=random(5, 10);
  }
 
  public void  move() {
    stroke(0,0,0,30);         
   
 
    
    if (dist(mouseX, mouseY, xPos, yPos) <3*d || mousePressed) {
 
     
      float xDist = mouseX-xPos;
      float yDist = mouseY-yPos;
 
      
      float xMove = map(xDist, 0, 100, 0, 10);
      float yMove = map(yDist, 0, 100, 0, 10);
 
     
      xPos+=xMove;
      yPos+=yMove;
    }
    else {
     
      xPos+=random(-1, 1.4);
      yPos+=random(-2, 2);
    }
    
    ellipse(xPos, yPos, d, d);
  }
}
