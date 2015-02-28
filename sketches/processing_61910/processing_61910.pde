
float [] x = new float [32];
float [] y = new float [32];


void setup () {
  size (500, 500);

  int boxnum = 0;

  while (boxnum < x.length)
  {
    x [boxnum] = 250;
    y [boxnum] = (boxnum-2)*20;
    boxnum = boxnum+1;
  }
}
void draw () {
  background (255);
  int boxnum = 0;
  beginShape();
  noFill();
  while (boxnum <  x.length)
  {
    curveVertex (x[boxnum], y[boxnum]);
    //ellipse(x[boxnum], y[boxnum], 10,10);
    if (mousePressed) {
      float d = dist(x[boxnum], y[boxnum], mouseX, mouseY);

      if (d<100) {
        x[boxnum] = x[boxnum] + random(-10, 10);
      }
    }

    boxnum = boxnum+1;
  }

  endShape();
}


