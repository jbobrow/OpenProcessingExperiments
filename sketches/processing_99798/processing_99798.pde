
class Arc{
  Node v;
  Node u;
  Arc(Node _s, Node _e){
    v=_s;
    u=_e;
  }
  void draw(){
    int r=(int)((red(v.mycolor)+red(u.mycolor))/2);
    int g=(int)((green(v.mycolor)+green(u.mycolor))/2);
    int b=(int)((blue(v.mycolor)+blue(u.mycolor))/2);    
    stroke(r,g,b);
    //line(v.pos.x,v.pos.y,u.pos.x,u.pos.y);
    bezier(v.pos.x,v.pos.y,v.oldpos[2].x,v.oldpos[2].y,u.oldpos[2].x,u.oldpos[2].y,u.pos.x,u.pos.y);    
    noStroke();
  }
}

