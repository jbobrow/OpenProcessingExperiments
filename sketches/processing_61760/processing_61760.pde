
void setup(){
  background (0);
  size (200,200);
  noStroke ();
  fill (255,60);
  for (int h=200; h>0; h=h-20)
  ellipse (h,h,40,40);
}

void draw(){
  frameRate (10);
  
for (int i=0;i<100;i=i+20){
verdeLine(i,i);
  }
}
void verdeLine(int x, int y) {
  float r = random (200);
  float h = random (220);
stroke (0,h,0,h);
strokeWeight (10);
line (x,y,r,r);
}

