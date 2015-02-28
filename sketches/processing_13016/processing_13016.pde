
class aPoint{
  int x,y,dx,dy;
  aPoint(int aX, int aY){
    x = aX;
    y = aY;
    dx = (int)random(-5,5);
    dy = (int)random(-5,5);
    //dx=0;
    //dy=0;
  }
  void draw(){
    if(x+dx>width || x+dx < 0){
      dx = dx * -1;
    }
    if(y+dy>height || y+dy < 0){
      dy = dy * -1;
    }
    x+=dx;
    y+=dy;
    point(x,y);
  }
  void drawToOther(int oX,int oY){
    line(x,y,oX,oY);
  }
  void drawToOthers(aPoint[] tmp)
  {
    for(int i=0;i<tmp.length;i++){
      this.drawToOther(tmp[i].x,tmp[i].y);
    }
  }

}

