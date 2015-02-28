
Branch axiom;

void setup()
{
  size(400,400,P3D);
  axiom = new Branch();
}

void draw()
{
  background(#3366ee);
  noStroke();
  translate(width/2, height,0);
  rotateY(frameCount * 0.01);
  axiom.draw();
  // create a starter tree to which the user can add:
  if (frameCount < 4) {
    axiom.replace();
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT) {
    axiom.replace();
  }
  else {
    axiom = new Branch();
  }
}


