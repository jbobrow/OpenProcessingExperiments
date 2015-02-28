
class Particle{
  int type;
  float x,y,vx,vy;
  boolean pressed = false;
  boolean inner = false;
  
  Particle(int type){
    x=random(width);
    y=random(height);
    vx=random(11)-5;
    vy=random(11)-5;
    this.type=type;    
  }
  
  void update(){     
    if(mousePressed==true)
    {
      pressed = true;
      if(type==0)
        circle(this,mouseX,mouseY,rr);
      if(type==1)
        circle(this,mouseX,mouseY-rr/2,rr/2);
      if(type==2)
        circle(this,mouseX,mouseY+rr/2,rr/2);
      if(type==3)
        circle(this,mouseX,mouseY-rr/2,rr/6);
      if(type==4)
        circle(this,mouseX,mouseY+rr/2,rr/6);
      
    }
    else
    {
      if(pressed==true){
        pressed = false;
        vx=random(11)-5;
        vy=random(11)-5;  
      }
    }
    
    x+=vx;
    y+=vy;
    
    if(x>width){
      vx*=-1;
      x=2*width-x;
    }else if (x<0){
      vx*=-1;
      x*=-1;
    }
    
    if(y>height){
      vy*=-1;
      y=2*height-y;
    }else if (y<0){
      vy*=-1;
      y*=-1;
    }
    point(x,y);
    
  }
}

