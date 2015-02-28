
void setup(){
  size(500, 500);
  background(255);
  noStroke();
}
void draw(){
 int xa = 0;
 int ya = 0;
  for(int i = 255; i > 0; i -= 25){
   fill(250 - i, 10 + i, 255 + i, 50);
  rect(xa, ya, 50, 500);
  xa = xa + 50;
  }
  
  int xb = 0;
  int yb = 0;
  for(int i = 255; i > 0; i -= 25){
  fill(250 - i, 10 + i, 255 + i, 50);
  rect(xb, yb, 500, 50);
  yb = yb + 50;
  
  } 
}



