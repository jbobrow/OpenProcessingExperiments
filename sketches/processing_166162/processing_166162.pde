
void setup(){
size(500,500);
background(100,22,210);
noStroke();
frameRate (10);
}
 
void draw(){
  int r = 30;
for(int y = 0; y < 520; y = y+50) {
  fill(random(10,250),150,250);
  for (int x = 0; x < 520; x = x+50)
{ //fill(random(10,200),120,260);
  rect (x-20, y-20, r, r);
}
} 
}


