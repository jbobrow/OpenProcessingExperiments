
void setup() {
  size (600, 600);
  background(160);
  noStroke ();
  smooth();
}

void draw () {
  
    background(160);

  fill(0);
  if (mousePressed == false) {
    ellipse(371, 229, 10, 10);
    ellipse(471, 129, 15, 15);
    ellipse(271, 100, 20, 20);
    ellipse(460, 320, 30, 30);
    ellipse(200, 360, 35, 35);
    ellipse(340, 471, 40, 40);
  } else {
    ellipse(371, 229, 40, 40);
    ellipse(471, 129, 35, 35);
    ellipse(271, 100, 30, 30);
    ellipse(460, 320, 20, 20);
    ellipse(200, 360, 15, 15);
    ellipse(340, 471, 10, 10);
  }
  
  
  


}


