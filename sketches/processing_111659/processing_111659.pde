
void setup(){
  size(600, 400);
  background(255);
  smooth(1);
}
 
int n = 100;
int dir = 1;
float Size;
 
void draw(){ 
  fill(512-n,512-n,n);
  color randomColor =color(random(255),random(255),random(255)); 
  float randomSize = random(-3,3);
  Size = Size + randomSize;
  circle (mouseX, mouseY, Size, randomColor);
}


void circle(float x, float y, float size, color color1) {
 fill(color1);
 ellipse(mouseX, mouseY, Size, Size);
  if(n == 0 || n == 512)
  {
   dir = dir * -1;
  }
  n = n + dir;
}
