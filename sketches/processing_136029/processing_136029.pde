

PImage img;
int angle = 0;

void setup() {
  size(646, 646);
  background(102);
  noStroke();
  fill(255);
  img = loadImage("a.jpg"); 
}

void draw() {
  if (mousePressed == true) {
    angle += 4;
    float v = cos(radians(angle)) * 250.0;
    for (int a = 0; a < 380; a += 200) {
      float cercle1 = cos(radians(a)) * v;
      float cercle2 = sin(radians(a) + 100);
      image(img,0,0);
      fill(255);
      ellipse(mouseX + cercle1 , mouseY + cercle2, v, v);
    }
    fill(255);
    ellipse(mouseX, mouseY+0.4, 100,100);
  }
}


