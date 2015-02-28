
void setup()
{
  size(400,400);
}
void draw(){
   background(142, 137, 137);
    rect(mouseX,mouseY,100,70);
}

void mousePressed() {
if (mouseButton == LEFT) {
    fill(255, 0, 0);
  } else {
    fill(22, 35, 234);
  }
}











