

BoundBall[] balls = new BoundBall[10];

void setup(){
  size(500, 500);
  smooth();
  background(0);
  noStroke();
  fill(255, 0, 0, 10);
  for(int i= 0; i < balls.length; i++)balls[i] = new BoundBall(140+20*i, 140+20*i, 30-i*2, 1+i, 2+i);
}

void draw(){
  for(int i = 0; i < balls.length; i++){
    balls[i].ball();
    balls[i].checkEdges();
  } 
}


void mousePressed(){
  background(0);
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
      xdirection *= -1;
    }
    if(bY > 400 || bY < 100){
      ydirection *= -1;
    }
  }
}
      
    
    
    
    
    


