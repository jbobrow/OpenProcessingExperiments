

int w = 750;
int h = 750;
void setup(){
size(w,h);
background(34,8,77);
noStroke();
frameRate (2);
}
 
void draw(){
  int r = 30;
for(int y = 0; y < h+25; y = y+50) {
  stroke(random(2-200));
  strokeWeight(random(.5,17));
  fill(random(2,40),8,114);
  for (int x = 0; x < w+25; x = x+50)
{ //fill(random(100,200),0,50);
  ellipse (x-25, y-25, r, r);
  triangle (x-2, y-2, x-3, y-3, x+4, y+4);
}
}
}

