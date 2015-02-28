
PVector onepos = new PVector(200, 200), twopos;
float d;
void setup() {
  size(400, 400);
  stroke(200, 80);
  fill(200, 50);
}
void draw() {
  background(0);
  d=atan2(mouseX-onepos.x, mouseY-onepos.y);
  twopos = new PVector(onepos.x+sin(d)*50, onepos.y+cos(d)*50);
  onepos.x+=mouseX-twopos.x;
  onepos.y+=mouseY-twopos.y;
  strokeWeight(1);
  ellipse(onepos.x, onepos.y, 25, 25);
  ellipse(twopos.x, twopos.y, 25, 25);
  strokeWeight(25);
  line(onepos.x, onepos.y, twopos.x, twopos.y);
}
