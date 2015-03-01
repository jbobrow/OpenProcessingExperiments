
void setup(){
  size(800,600);
background(255,255,255);
}
void draw (){
for(int i=0; i<100; i++) {
fill(random (0,255), random(0,255), random(0,255));
int p1x =(int) random(0,800);
int p1y =(int) random(0,600);

int p2x =(int) random(0,800);
int p2y =(int) random(0,600);

int p3x =(int) random(0,800);
int p3y =(int) random(0,600);

triangle(p1x, p1y, p2x, p2y, p3x, p3y);
}
}
