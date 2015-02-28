
PShape robot1;
PShape robot2;
PShape robot3;
PImage backimage;
float offset = 0;
float easing= 0.5;



void setup()
{
  smooth();
  size (480,240);
  robot1 = loadShape ("robot1.svg");
  robot2 = loadShape ("robot1.svg");
  robot3 = loadShape ("robot1.svg");
  backimage= loadImage ("lunar.jpg");

}

void draw() {
  background (backimage);
  float target = map(mouseY, 0, height, -40, 40);
  offset+=(target-offset)*easing;
  shape (robot1, 85, 85, 50, 50);
  shape (robot2, target, 140, 100, 100);
  shape (robot3, 200, mouseY, 200, 200);

}


