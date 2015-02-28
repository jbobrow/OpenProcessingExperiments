
boolean flat = false;
void  setup() {
  size(450,450,P2D);
}

void draw() {
  background(0);
  smooth();
  fill(255,120);
  stroke(255);
  roundrect((width-200)/2, (height-100)/2, 200, 100, mouseX/30, mouseY/30, flat);
}

void mouseClicked()
{
    flat = !flat;
}

void roundrect(int x, int y, int w, int h, int rx, int ry, boolean flat)
{
  int cx = 0;
  int cy = 0;
  pushMatrix();
  translate(x+w/2, y+h/2);
  beginShape();
  vertex(-(w/2-rx), -h/2);
  if (flat)
    vertex(-w/2, -(h/2-ry));
  else
    bezierVertex(-(w/2-rx+rx/2),-h/2, -w/2, -(h/2-ry+ry/2),  -w/2, -(h/2-ry));

  vertex(-w/2, h/2-ry);
  if (flat)
    vertex(-(w/2-rx), h/2);
  else
    bezierVertex(-w/2, h/2-ry+ry/2, -(w/2-rx+rx/2), h/2,  -(w/2-rx), h/2);
  
  
  vertex(w/2-rx, h/2);
  if (flat)
    vertex(w/2, h/2-ry);
  else
    bezierVertex(w/2-rx+rx/2, h/2, w/2, h/2-ry+ry/2,  w/2, h/2-ry);
  
  vertex(w/2, -(h/2-ry));
  if (flat)
    vertex(w/2-rx, -h/2);
  else
    bezierVertex(w/2, -(h/2-ry+ry/2), w/2-rx+rx/2, -h/2,  w/2-rx, -h/2);
  endShape(CLOSE);
  popMatrix();
}

