
int x;
int y;
int r;
float c;
float s;
void setup() {
  size(800, 800);
  background(255);
  noStroke();
  smooth();
  frameRate(10);
}
void draw() {
  if (mousePressed == true) {
    if (r ==0) {
      myYellow();
    } 
    else if (r ==1) {
      myRed();
    } 
    else {
      myBlue();
    }
  }
}

void myYellow() {
  x=mouseX;
  y=mouseY;
  c=random(30, 200);
  s=random(30, 200);
  fill(255, 255, 0); 
  rect(x, y, c, s);
  strokeWeight(5);
  line(0, y, 800, y);
  strokeWeight(5);
  line(x, 0, x, 800);
  strokeWeight(5);
  line((c+x), 0, (c+x), 800);
  strokeWeight(5);
  line(0, (y+s), 800, (y+s));
  stroke(0);
}

void myRed() {
  x=mouseX;
  y=mouseY;
  c=random(30, 200);
  s=random(30, 200);
  fill(255, 0, 0); 
  rect(x, y, c, s);
  strokeWeight(5);
  line(0, y, 800, y);
  strokeWeight(5);
  line(x, 0, x, 800);
  strokeWeight(5);
  line((c+x), 0, (c+x), 800);
  strokeWeight(5);
  line(0, (y+s), 800, (y+s));
  stroke(0);
}

void myBlue() {
  x=mouseX;
  y=mouseY;
  c=random(30, 200);
  s=random(30, 200);
  fill(0, 0, 255); 
  rect(x, y, c, s);
  strokeWeight(5);
  line(0, y, 800, y);
  strokeWeight(5);
  line(x, 0, x, 800);
  strokeWeight(5);
  line((c+x), 0, (c+x), 800);
  strokeWeight(5);
  line(0, (y+s), 800, (y+s));
  stroke(0);
}
void mousePressed() {
  r=r+1;
  if (r>2) {
    r=0;
  }
}
