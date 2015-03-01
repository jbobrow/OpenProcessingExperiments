
PImage img;
int circ;

void setup () {
  img = loadImage("circle.png");
  size(400, 400);
}
void draw () {
  background(255);

  for (int i = 0; i<12; i++) {

    for (int j =0; j<12; j++) {
      fill(155,155,255,125);
      noStroke();
      //tint(255, 80);
      //imageMode(CENTER);
      //image(img, i*40, j*40, circ, circ);
      ellipse(i*40,j*40,circ,circ);

      if (mouseX <= (i*40)+15 && mouseX >= (i*40)-15 
        && mouseY <= (j*40)+15 && mouseY >= (j*40) -15) {
        circ=40;
      } else {
        circ=50;

        if (mousePressed && (mouseButton == LEFT)) {
          circ=60;
        } else if (mousePressed && (mouseButton == RIGHT)) {
          circ=25;
        }
      }
    }
  }
}

