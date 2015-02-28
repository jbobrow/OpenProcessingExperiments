
PImage b;
PImage a;
void setup() {
  size(690, 450);

  b = loadImage("Frog.png");
a = loadImage("dragon-fly.png");
}

void draw() {


background(#00D7FF);
pushMatrix();
translate(mouseX, mouseY-90);
image(b, 0, 0, 140, 140);



image(a, (sin(frameCount / 50.0) * 200), (cos(frameCount / 20.0) * 200), (sin(frameCount / 50.0) * 100), (sin(frameCount / 50.0) * 100));
popMatrix();
}
  
 

