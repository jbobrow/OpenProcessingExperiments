
int val = 3;
int j = 400;

int a, c, d, x, y, s, p;



void setup () {
  background(255, 0);
  size (700, 400);
  smooth();
  //noLoop();
  frameRate(10);
}


void draw () {
  a = (int)random(205);
  c = (int)random(6);
  d = (int)random(75);
  x = (int)random(-50, 750);
  y = (int)random(120, 350);
  s = (int)random(25, 25);
  p = (int)random(25, 25);
  noStroke();
  fill(a, c, d, 150);
  ellipse(x, y, s, p);



  for (int i = 0; i <= width; i -=-val) {
    int r=255;
    int g=255;
    int b=255;

    r=floor(random(193));
    g=floor(random(235));
    b=floor(random(60));

    stroke(91, 138, 10);
    strokeWeight(0.05);
    fill(r, g, b, 50);

    float t = random (-5, 50);
    beginShape();
    vertex(i, j);
    vertex(i+t, j-t);
    vertex(i+(2*t), 1.40*j+(3*t-j));

    endShape();
  }
}

void keyPressed() {
  saveFrame("grass  -####.jpeg");
}


