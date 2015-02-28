
//diametre
int d;
//position
int x;
int y;
//colour variables
int r;
int g;
int b;
int a;

void setup(){
  size(500,500);
  background(255);
}
void draw(){
  noStroke();
  fill(r,g,b,a);
  rect(mouseX,mouseY,d,d);
 
 x = int(random(500));
 y = int(random(500));
 d = int(25);
 r = int(random(255,200));
 g = int(random(125,200));
 b = int(random(100));
 a = int(random(255));
}


