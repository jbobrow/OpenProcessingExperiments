
class Box {
  
  float x, y;
  float mx, my;
  color c;
  int s;
  
  Box(){
    x = random(0,width);
    y = random(0,height);
    
    mx = random(1,6);
    my = random(1,6);
    
    c = color(random(255),random(255),random(255));
    s = (int)random(5,30);
  }
  
  void display(){
    fill(c);
    rect(x,y,s,s);
  }
  void move(){
    x+=mx;
    y+=my;
    if(x<0||x>width)mx *=-1;
    if(y<0||y>height)my *=-1;
  }
}


