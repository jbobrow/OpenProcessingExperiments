
PShape i;
PShape t;
PShape l;


void setup()
{
  size(640,480);
  background(255);
  noStroke();
  smooth();
  i = loadShape("egyptianeye.svg");
  t = loadShape("tear.svg");
  l = loadShape("eyelid.svg");
}

void draw()
{
  background(255);

  shapeMode(CENTER);
  shape(i, 200, 300, 700, 600);
  float mx = constrain(mouseX, 290, 320);
  float my = constrain(mouseY, 230, 235);
  fill(0);
  ellipse(mx, my, 60, 60);
  fill(#25C2C9);
  ellipse(mx, my, 50,50);
  fill(#58ACAF);
  ellipse(mx, my, 40, 40);
  fill(#3A6062);
  ellipse(mx, my, 20, 20);

  if (mousePressed) {
    if (mouseButton == LEFT) {

      shapeMode(CENTER);
      shape(i, 200, 300, 700, 600);

      fill(0);
      ellipse(mx, my, 60, 60);
      fill(#ED2318);
      ellipse(mx, my, 50,50);
      fill(#F57C54);
      ellipse(mx, my, 40, 40);
      fill(#D14313);
      ellipse(mx, my, 20, 20);
      shape(t, 340, 300, 700, 600);
    }
    if (mouseButton == RIGHT) {
      shapeMode(CENTER);
      shape(l, 320, 234, 700, 600);
    }
  }
}



