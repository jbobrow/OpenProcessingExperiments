
Clock c1, c2, c3, c4, c5, c6;
float coluna;
ArrayList clocks;
int sizeClock=30, sizeX=1000, sizeY=800;

void setup(){
  size(1000,800);
  smooth();
  clocks = new ArrayList();
  
  for(int baz=sizeClock; baz<sizeY; baz+=sizeClock){
    for (int coluna=sizeClock; coluna<sizeX; coluna+=sizeClock){
      clocks.add(new Clock(coluna,baz));
    }
  }
}

void draw(){
  background(0);
  //background(127);
  float bar = 1;
  for (int foo=0; foo<=clocks.size()-1; foo++) { 
    bar+=0.05;
    Clock c = (Clock) clocks.get(foo);
    c.beat(bar);
  }
}


class Clock{
  float rectx, recty, angle, x, y, vel;
  
  Clock(float xrect, float yrect){
    angle=0;
    x = xrect;
    y = yrect;
  }

  void beat(float vel){
    fill(0);
    stroke(0);
    ellipse(x, y, sizeClock,sizeClock);
    angle+=vel;
    
    rectx= x+cos(radians(angle))*(sizeClock/2);
    recty= y+sin(radians(angle))*(sizeClock/2);
  
    stroke(255);
    //strokeWeight(2);
    line(rectx,recty,x,y); 
  }
}
