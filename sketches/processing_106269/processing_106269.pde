
int x=0;
void setup()
{
  size(500,500);
}
int value = 0;

void draw() {
  background(0,255,0);
  fill(value);
  rectMode(CENTER);
  rect(250, 250,200,200);
}
 
void keyTyped() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
