
class Ball{

  float x;
  float y;
  float w;
  float speed;
  float ChangeFill;
  
  Ball(float tempX, float tempY, float tempW,float tempChangeFill) {
    x = tempX;
    y = tempY;
    w = tempW;
    ChangeFill = tempChangeFill;
    speed = 0;
  }
  
  void display(){
  noStroke();
  float w = dist(10,20,0,mouseY/4);
  w = w + 0.01;
  if (w > 30)
  w = constrain(w,10,50);
  fill(random(100),random(100),random(100),100);
  ellipseMode(CENTER);
  ellipse(x,y,w,w);
 
 
}

  void bounce(){
    ChangeFill = ChangeFill + speed;
    y = y + speed;
    
    speed = speed + gravity;
  
   if((y > height)|| (y ==0)){
   speed =speed *-0.95;
  }
}

}



