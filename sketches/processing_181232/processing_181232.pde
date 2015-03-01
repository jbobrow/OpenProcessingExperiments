
int h;   
int m;  
int s;


void setup() {
  size(600,250);
  noFill();
  background(255);
}

void draw() {
  background(255);
  updateTime();
  stroke(0);
  line(100,height/2,500,height/2);


  float sPos = map(s,0,59,0,400);
  stroke(0,0,255);
  ellipse( 100+sPos, height/2,10,10);
  
  
  float mPos = map(m,0,59,0,400);
  stroke(0,255,0);
  ellipse( 100+mPos, height/2,10,10);
  
  float hPos = map(h,0,23,0,400);
  stroke(255,0,0);
  ellipse( 100+hPos, height/2,10,10);
  
}

void updateTime() {
  h = hour();   
  m = minute();  
  s = second();
}
