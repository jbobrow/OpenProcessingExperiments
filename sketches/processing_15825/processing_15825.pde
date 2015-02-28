
class Ball{
float x;
float y;
float xspeed;
float yspeed;

Ball(float x_, float y_, float xspeed_, float yspeed_){
  x = x_;
  y = y_;
  xspeed = xspeed_;
  yspeed = yspeed_;
}

void move(){  
  x = x + xspeed;
  if((x > width) || (x < 0)){
  xspeed = xspeed *-1;

  }
  
  
  y = y + yspeed;
  if((y > height) || (y < 0)){
  yspeed = yspeed * -1;
  }
}
  
  
 void display(){
  ellipseMode(CENTER);
  stroke(200);
  fill(y/2,255,255,y);
  ellipse(x,y,30,30);
}
}


