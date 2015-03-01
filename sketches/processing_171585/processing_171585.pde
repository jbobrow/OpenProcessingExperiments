
float r = 0;
float x;
float y;

void setup() {
  size(600, 600);
  background(2);
  rectMode(CENTER);
}
void draw_spiral (float x, float y) {
    translate(width/2, height/2);
  rotate(r);
  rect(0,0,width, height);

}
void draw() {
  translate(width/2, height/2);
  rotate(r);


  fill(105, 13, 0);
  rect(0, 0, 150, 10);
  fill(2, 110, 51);
  rect(50, 50, 150, 10);
  fill(2, 50, 120);
  rect(100, 100, 150, 10);
  fill(100, 143, 2);
  rect(150, 150, 150, 10);


  r = r+.02;

  //Outer Tier
  fill(2, 85, 51);
  translate(width/2, height/2);
  rotate(r);
  rect(0, 0, 100, 100);
  r = r+.03;
}

