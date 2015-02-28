
PImage munyo;
PImage munyoflipped;

void setup() {
  size(1060,700);
  munyo = loadImage("Munyo.jpg");
 munyoflipped = loadImage("Munyo2.jpg");

}

void draw () {
  tint(mouseX,mouseY,mouseX,30);
  image(munyo,530,0);
  tint(200,mouseX,mouseY,30);
  image(munyoflipped,530,0);
  tint(mouseX,mouseY,mouseX,30);
  image(munyo,0,0);
  tint(200,mouseX,mouseY,30);
  image(munyoflipped,0,0);
  fill(255,255,255,100);
  variableRect(mouseY,mouseX,pmouseY,pmouseX);
}

void variableRect(int y, int x, int py, int px) 
{
  float speed = abs(y-py) + abs(x-px);
  rect(y, x, speed, speed);
}


