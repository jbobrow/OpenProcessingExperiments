
void setup () {
size(500,500);
smooth();
background(0, 20,30);
}

void draw () {
  float durchmesser = dist(pmouseX, pmouseY, mouseX, mouseY);
  if (durchmesser > 50) {
  fill(0, 0, 0);
  }
  else {
  fill(0);
  }
ellipse(mouseX,mouseY,durchmesser,durchmesser);

}

