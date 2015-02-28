
class Bullet{
  float x,y,vy,r;
  Bullet(float bx,float by,float bvy,float br){
    x=bx;
    y=by;
    vy=bvy;
    r=br;
  }
  
  void update(){
    x+=0;
    y+=vy;
    r+=0;
    
    if(y<0){
      y=height+100;
      vy=0;
      r=0;
    }
  }
  
  void display(){
    fill(40,50,255,100);
    ellipse(x,y,r,r);
  }
}

