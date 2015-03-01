
void setup() {
  size(1280,720, P3D);
  frameRate(20);
}

int blink = 0;

void draw() {
  float colour1 = random(0,255);
  float colour2 = random(0,255);
  float colour3 = random(0,255);
  float Radius = random(20,100);
  background(random(50,255),random(10,100),random(10,100));
  noStroke();
  lights();
  translate(mouseX, mouseY, 0);
  fill(colour1,colour2,colour3);
  sphere(Radius);
  if(blink % 60 == 0) println("Eat sleep rave repeat");
  blink++;

}

