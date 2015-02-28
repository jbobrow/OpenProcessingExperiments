
boolean drag = false;

void setup()
{
  size(400, 400);
  background(252,48,90);
  smooth();
}

void draw() {
  if (drag)
  {
        stroke(255);
    fill (random(0),252,48,90);

    float r = dist(pmouseX, pmouseY, mouseX, mouseY) + 5;
    ellipse(mouseX, mouseY, r, r);
  }
    
}

void mouseDragged() {
  drag = true;
}

void mouseReleased() {
  drag = false;
}

void keyPressed() {
    endRecord();
    exit();
}

