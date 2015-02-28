
float x, y;
float px, py;
float w;
float an;

void setup() {
  size(300, 300);
  smooth();
  x=0;
  y=0;
  w = 100;
  an = 0;
} 
void draw() {
  translate(width/2, height/2);
  background(255);

  stroke(0);
  fill(0,0,175,100);
  ellipse(x, y, w, w);
  for (int i=0; i<6; i++) {
    px = x + w/2 * sin(radians(60*i+an));
    py = y + w/2 * cos(radians(60*i+an));
    ellipse(px, py, w, w);
  }
  an++;
}
