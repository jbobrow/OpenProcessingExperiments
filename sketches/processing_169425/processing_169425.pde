
int backR = 100;
int backG = 21;
int backB = 0;
float r = 0;
float speed;


void setup() {
  size(500, 500);
  background(backR, backG, backB);
  rectMode(CENTER);
  //noStroke();
}

void draw () {

  fill(backR, backG, backB, 50);
  rect(0, 0, 2*width, 2*height);

  for (int i = 25; i < width; i+=50) {
    for (int j = 25; j < height; j+=50) {
      pushMatrix();
      translate(i, j);
      rotate(r);
      fill(20, i/2+1, j/2+1);
      rect(0, 0, 50, 50);
      popMatrix();
      r = r + .0001;
    }
  }
  textSize(32);
  fill(0);
  text("RIP Scales", width/2-80, height/2);
}
