
float i = 0;

class Exhaust  {
  float x = 0, y = 0, vx, vy, xpos, ypos;
  
  Exhaust(int direction,float x_,float y_)  {
    if(direction == 0)  {
      vx = random(-i,i); vy = -1;  }
    if(direction == 1)  {
      vx = 1; vy = random(-i,i);   }
    if(direction == 2)  {
      vx = random(-i,i); vy = 1;   }
    if(direction == 3)  {
      vx = -1; vy = random(-i,i);  }
    xpos = x_;
    ypos = y_; 
  }
  
  void display()  {
    x = x + vx;
    y = y + vy;
    pushMatrix();
    translate(200+width/2 + xpos,height/2 + ypos);
    fill(255);
    ellipse(x,y,4,4);
    popMatrix(); 
  }
   
}

