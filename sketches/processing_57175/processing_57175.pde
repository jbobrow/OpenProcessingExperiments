
void setup() {
  size (400,400);
  background(0,0,0);
  stroke(255,255,255,100);
}
int x1 = 200;
int x2 = 100;
int x3 = 200;
int x4 = 300;
int y1 = 100;
int y2 = 200;
int y3 = 300;
int y4 = 200;
void draw(){
  background(0,0,0);
  line(x1,y1,x2,y2);
  line(x1,y1,x3,y3);
  line(x1,y1,x4,y4);
  line(x2,y2,x3,y3);
  line(x2,y2,x4,y4);
  line(x3,y3,x4,y4);
 x1 += random(-1,2);
 x2 += random(-1,2);
 x3 += random(-1,2);
 x4 += random(-1,2);
 y1 += random(-1,2);
 y2 += random(-1,2);
 y3 += random(-1,2);
 y4 += random(-1,2);
 
}
  

