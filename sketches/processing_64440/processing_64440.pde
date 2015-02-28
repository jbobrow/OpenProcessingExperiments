


float n = 0;
void setup() {
  size(500, 500);
  background(#890A32);
  fill(255);
  noStroke();
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(#890A32);
  translate(width*noise(n+70), height*noise(n+80));
  rotate(noise(n+20));
  rect(0, 0, 250 * noise(n), 250 * noise(n+12));

  n=n+0.005;
}


