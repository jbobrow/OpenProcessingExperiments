
void setup(){
  size(600,600);
  smooth();
  strokeWeight(.5);
}

void draw() {
  //background(0);
  stroke(255);
  line(100, 50, mouseX, mouseY);
  stroke(random (255), random (255), random (255));
  float mx = random (mouseX/4) + random (90,100);
  line(120,40,mx, mouseY);
  line(400,200,mx,mouseY);
  line(52,423,mx,mouseY);
  line(347,321,mx,mouseY);
  line(528,521, mx,mouseY);
}



