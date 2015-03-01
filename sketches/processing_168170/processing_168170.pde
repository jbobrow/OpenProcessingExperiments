
void setup() {
  size(800, 600);
  background(255);
  frameRate(50);
}
float mx;//direction 
float my;//direction
float mmx;//damper
float mmy;//damper
float x;
float y;
float d=-100;//damping value
void draw() {
  if (mousePressed) {
    background(255);
    x=mouseX;
    y=mouseY;
    mx=mouseX-pmouseX;
    my=0;
  }
  fill(255);
  rect(0, 0, width, height);
  x=x+mx;
  y=y+my;
my=(my+9.8)*.99;
mx=mx*.99;
  noStroke();
  fill(255, 0, 255);
  ellipse(x, y, 40, 40);
  if (x<20) {
    mx=-mx;
  }
  if (x>780) {
    mx=-mx;
  }
  if (y<20) {
    my=-my;
  }
  if (y>580) {
    my=-my+9.8;
  }
}



