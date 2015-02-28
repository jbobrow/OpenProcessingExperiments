
class Particle
 
{
 
  float xpos, ypos;
  float xspeed, yspeed;
  int ewidth;
  int eheight;
  float speedfactor;
  float dampfactor;
  color col;
  float a, speed;
 
  Particle(float x, float y,int ew, int eh, float sf, float df,color c){
    xpos=x;
    ypos=y;
    xspeed=0;
    yspeed=0;
    ewidth=ew;
    eheight=eh;
    speedfactor=sf;
    dampfactor=df;
    col=c;
    speed=random(.5,2.5);
  }
 
  void moveSelf(){
    xpos += random(-1,1);
    ypos += random(-1,1);
  }
 
   void angle(float x, float y, float xx, float yy){
    a = degrees(atan2(yy-y,xx-x));
  }
  
  void move(float x_, float y_){
    if(x_ == -2 && y_ == -2){
    } else if (x_ == -1 && y_ == -1){
      angle(xpos,ypos,wanderer.getX(),wanderer.getY());
      float x1 = xpos+cos(radians(a))*speed;
      float y1 = ypos+sin(radians(a))*speed;
      xpos = x1;
      ypos = y1;
    } else{
      xpos=x_;
      ypos=y_;
    }
    
  }
}

