
int bgColor= 200;


void setup() {
  size(900, 400);
  background(bgColor);
}

void draw() {
  float nextX,nextY;
  nextX=random(0,900);
  nextY=random(0,400);
  stroke(nextX*255/900, 0, nextY*255/800, random(80) );
  for (int y=0; y<=height; y+=50) {
    line(0, y, mouseX, mouseY);
  }
  
  
  
  stroke(255, random(80) );
  for (int y=0; y<=height; y+=50) {
    line(width, y, mouseX, mouseY);
  }


}
void keyPressed()
{
  if (key == ' '){
  background(bgColor);
}
}


