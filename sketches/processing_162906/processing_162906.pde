
int w = 1000;
int h = 1000;
void setup(){
size(w,h);
background(300,400,300);
noStroke();
frameRate (10);
}
 
void draw(){
  int r = 30;
for(int y = 1; y < h-25; y = y+50) {
  fill(random(10,800),50,500);
  for (int x = 1; x < w-25; x = x+50)
{ //fill(random(100,200),0,50);
  rect (x-2, y-2, r, r);
}
} 
}

