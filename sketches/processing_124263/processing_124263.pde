
int cs = 20;
PImage bild;
float x = 0;
float y = 0;

void setup() {
  size(700, 560);
  smooth();
  bild = loadImage("men1b.jpg");
  background (0);
}
void draw() {
  background(0);

  x = mouseX+sin(frameCount/125.0)*40;
y = mouseY+cos(frameCount/125.0)*40;

  fill(0);
  for (int j = 0; j<=height/cs;j++) {
    for (int i = 0; i<=width/cs;i=i+1) {

      if (i>5)fill(mouseY/2, mouseX/2, random(0-255));
      if (j<10)fill(mouseX, mouseY, mouseY-mouseX);
      
      //stroke(bild.get(int(x)+3,int(y)+3),250);
      stroke(mouseX,mouseY-mouseX,mouseY);
      line(i*cs, j*cs, random(mouseY-mouseX), random(mouseY-mouseX));
    }

  }
}



