
int value = 0;

void setup() {
  size (500, 500);
  smooth();
}

void draw () {

  noStroke();
  if (millis() < 5000 || millis() == 5000) {
    noFill();
    stroke (0);
    strokeWeight (1);
    rect (124, 149, (5000/20), 51);
    noStroke();
    fill (255);
    rect (125, 150, millis()/20, 50);
    fill (0);
    textSize (20);
    text ("Loading...", 125, 125);
   
  }
}


