
float angle = 90;
float steepness = 0.5;
float lineSpace = 60;
float frequency = 0.002;
int m = 0;

void setup() {
  size(700, 400);
  background(0);
  frameRate(30);
}

void draw() {
  if (mousePressed) {
    stroke(random(0, 255)); 

    float k = 0;
    for (int i=0; i<height; i+=lineSpace) {
      for (int j=0; j<width; j++) {
        k = i+sin(radians(angle))*mouseY*steepness;
        line(j, k, j, k);
        angle+=mouseX*frequency;
      }
    }
  }
  for (mouseX-=0; mouseX>700; mouseX=m);
  for (mouseY-=0; mouseY>400; mouseY=m);

  for (mouseX-=0; mouseX<0; mouseX=m);
  for (mouseY-=0; mouseY<0; mouseY=m);

keyPressed();
 if(key == 'r' || key == 'R')
{
  background(0);
}
}

