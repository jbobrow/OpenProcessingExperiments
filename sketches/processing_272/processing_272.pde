
class abstractor{
  float x,y,x2,y2,mx,my;
  float rad,theta;
  float burst_dist;
  float inv;
  float rd,gr,bl;
  color c=color(random(0,255),random(0,255),random(0,255));
  float ox,oy,ox2,oy2;
  
  abstractor(){
    //construct this
    x=random(-1,1);
    y=random(-1,1);
    x2=random(-1,1);
    y2=random(-1,1);
    if(random(100)>99){
      x2=-x2;
    }
    if(random(100)>99){
      y2=-y2;
    }
    rad=sqrt(x2*x2+y2*y2);
    theta=atan2(x2,y2);
    
    rd=(c>>16)&0xff;
    gr=(c>>8)&0xff;
    bl=c&0xff;
  }
  
  void interact(int lv){
    //previously move
    ox2=ox;
    oy2=oy;
    ox=x;
    oy=y;
    
    //burst distance
    burst_dist=sqrt(sq(burst.x-x)+sq(burst.y-y));
    
    x2=rad*cos(theta+burst_dist);
    y2=rad*sin(theta+burst_dist);
    
    //update
    rad=sqrt(x2*x2+y2*y2);
    theta=atan2(x2,y2);
    
    x+=rad*cos(theta);
    y+=rad*sin(theta);
    
    //perform random walk
    if(x<0){
      x+=random(-1,1);
    }else if(x>=random(-1,1)){
      x-=random(-1,1);
    }
    
    if(y<0){
      y+=random(-1,1);
    }else if(y>=random(-1,1)){
      y-=random(-1,1);
    }
    
    //recursive flow
    if(lv>1){
      lv--;
      interact(lv);
    }
  }
  
  void trail(){
    //trail abstractors
    stroke(rd,gr,bl,48);
    line(x,y,ox2,oy2);
    line(width-x,y,width-ox2,oy2);
    line(x,height-y,ox2,height-oy2);
    line(width-x,height-y,width-ox2,height-oy2);
  }
}

