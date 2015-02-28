
class Kwadrat {
  float x;
  float y;
  float w;
  float h;
  float r;
  color col;
  int przez;
  PVector loc;


  Kwadrat(float tx, float ty, float tw, float th)
  {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    col = color(random(100, 255));
    przez = int(random(100));
    loc = new PVector(x, y);
  }

  void plot() {
 
    pushMatrix();
    translate(loc.x+ w/2, loc.y + h/2);
    float dx = (mouseX - loc.x);
    float dy = (mouseY - loc.y);
    rotate (atan2(dx, dy));
    noStroke();
    fill(col, przez);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }

  void go() {
    x += random(-3, 3);
    y += random(-3, 3);
    w += random(-1, 1);
    h += random(-1, 1);
  }
}

Kwadrat [][] kwadraty;
int cols = 10;
int rows = 10;

void setup(){
size(600,600);

kwadraty = new Kwadrat[cols][rows];
for (int i = 0; i < cols; i++){
  for (int j = 0; j < rows; j++){
    kwadraty[i][j] = new Kwadrat(i*width/cols, j*height/rows, width/cols, height/rows);
}}}

void draw(){
  background(0,0,0);
  for (int i = 0; i < cols; i++){
  for (int j = 0; j < rows; j++){
    kwadraty[i][j].go();
    kwadraty[i][j].plot();
  }}}
