
boolean overEraser = false;
boolean overRainbow = false;

void setup()
{
  size(600, 600);
}

void draw()
{
  fill(255);
  stroke(0);
  rect(30, 30, 80, 30);
  strokeWeight(6);
  stroke(255, 0, 0);
  line(30, 60, 30, 120);
  stroke(255, 128, 0);
  line(36, 60, 30, 120);
  stroke(255, 255, 0);
  line(42, 60, 42, 120);
  stroke(0, 255, 0);
  line(48, 60, 48, 120);
  stroke(0, 0, 255);
  line(54, 60, 54, 120);
  stroke(100, 0, 255);
  line(60, 60, 60, 120);
  stroke(200, 0, 255);
  line(66, 60, 66, 120);
}

void mouseDragged()
{
  strokeWeight(6);
  stroke(255, 0, 0);
  line(pmouseX, pmouseY-18, mouseX, mouseY-18);
  stroke(255, 128, 0);
  line(pmouseX, pmouseY-12, mouseX, mouseY-12);
  stroke(255, 255, 0);
  line(pmouseX, pmouseY-6, mouseX, mouseY-6);
  stroke(0, 255, 0);
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(0, 0, 255);
  line(pmouseX, pmouseY+6, mouseX, mouseY+6);
  stroke(100, 0, 255);
  line(pmouseX, pmouseY+12, mouseX, mouseY+12);
  stroke(200, 0, 255);
  line(pmouseX, pmouseY+18, mouseX, mouseY+18);
}
