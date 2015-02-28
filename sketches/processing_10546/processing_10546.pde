
class Ball{
  
  Rectangle r;
  Point v;//Bewegungsvector
  
  int RADIUS=10;
  
  public Ball(int x, int y, int vx, int vy){
    r=new Rectangle(x,y,RADIUS,RADIUS);
    v=new Point(vx,vy);
  }
  public void draw(){
    r.x+=v.x;
    r.y+=v.y;
    rect(r.x,r.y,r.width,r.height);
    if (r.x < 0 || r.x > width-RADIUS) v.x=-v.x;
    if (r.y < 0-RADIUS || r.y > height) balls.remove(this);
  }
  public void test(Rectangle brett){
    if (r.intersects(brett) && (
          (v.y<0 && r.y-brett.y>0) || 
          (v.y>0 &&r.y-brett.y<0)) 
        ) v.y=-v.y;
  }
}

