
float hue = random(100);
int i = 100;
int j=1;
int changei =1;
void setup () {
  background(0);
  size (640, 360) ; 
  colorMode(HSB, 255);
}
void draw () {
  fill(random(255));
  strokeWeight(20);
  stroke(hue, 255, 255);

  ellipse(mouseX, mouseY, i, i);
  if (mousePressed) {
    i=i+changei;
    if (i>150) {
      changei= -1;
    }
    if (i<1) {
      changei = 1;
    }
  }

  if (keyPressed==true) {
    strokeWeight(20);
    stroke(hue, 255, 255);
    fill(0);
    ellipse(random(700), random(500), random(10, 100), random(10, 100));
  }
  fill(0, 20);
  stroke(0, 0, 300);
  rect(0, 0, width, height);

  hue = (hue+1)%100;
}



