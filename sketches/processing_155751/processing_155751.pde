
float radious = 0;


void setup () {
  size (500, 800);
  background (255);
}

void draw () {
  noStroke();
  fill (random (255), random (255), random (255), random (100));
  ellipse ( mouseX, mouseY, radious, radious);
}
void mousePressed () {
  if (mousePressed == true) {
    radious = random (200);
  } else {
    radious= 0;
  }
}



