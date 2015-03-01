

BoundBall b1;

float rectSize = 50; 
int i = 1;


void setup(){
  size(500, 500);
  background(255);
  rectMode(CENTER);
  b1 = new BoundBall(width/2, height/2, 20, 1, 2);
}

void draw(){
  textAlign(CENTER);
  textSize(100);
  text("rect", 250, 180);
  rect(width/2, height/2, rectSize += i, rectSize += i);
  if(rectSize >= 480 || rectSize <= 0){
    i *= -1;
    stroke(random(255), random(255), random(255));
  }
  
  b1.ball();
  b1.checkEdges();

}
    
class BoundBall{
  
  float bX, bY;
  float bRad;
  float bXspeed, bYspeed;
  float xdirection = 1;
  float ydirection = 1;
  
  BoundBall(float x, float y, float rad, float xspeed, float yspeed){
    bX = x;
    bY = y;
    bRad = rad;
    bXspeed = xspeed;
    bYspeed = yspeed;
  }
  
  void ball(){
    
    bX += bXspeed * xdirection;
    bY += bYspeed * ydirection;
    fill(random(255), random(255), random(255), 30);
    ellipse(bX, bY, bRad, bRad);
    
  }
  
  void checkEdges(){
    if(bX > 400 || bX < 100){
      background(255);
      xdirection *= -1;
    }
    if(bY > 400 || bY < 100){
      background(255);
      ydirection *= -1;
    }
  }
}
      
    
    
    
    
    


