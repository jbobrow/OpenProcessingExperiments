

BoundBall b1;

void setup(){
  size(500, 500);
  smooth();
  background(0);
  fill(255, 0, 0, 10);
  b1 = new BoundBall(width/2, height/2, 30, 1, 2);
}

void draw(){
  noStroke();
  b1.ball();
  b1.checkEdges();
  b1.changeColor();
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
    
    ellipse(bX, bY, bRad, bRad);
    
  }
  
  void checkEdges(){
    if(bX > width-bRad || bX < bRad){
      xdirection *= -1;
    }
    if(bY > height-bRad || bY < bRad){
      ydirection *= -1;
    }
  }
  
  void changeColor(){
    if(mousePressed == true){
      fill(random(255), random(255), random(255), 20);
    }
  }
}
      
    
    
    
    
    


