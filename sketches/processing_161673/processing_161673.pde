
int w = 700;
int h = 500;
void setup(){
size(w,h);
background(196,152,240);
noStroke();
frameRate (3);
}

void draw(){
  int r = 40;
for(int y = 0; y < h+25; y = y+50) {
  fill(random(100,200),0,50);
  for (int x = 0; x < w+25; x = x+50)
{ //fill(random(100,200),0,50); 
  ellipse (x-25, y-25, r, r);
}
}  
}
