
void setup(){
  size(500,500);
  frameRate(50);
}
int x = 20;
int y = 20;
void draw(){
  colorMode(RGB,300);
  background(x);
fill(1,x*2,y*4);
  ellipse(250,mouseY,x,y);
  y++;
  x++;
}

