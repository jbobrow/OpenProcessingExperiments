
void setup(){
  size(600, 500);
  smooth();
}

int rex = int(random(200)) +100;
int rey = int(random(200)) +100;
int brx = 100;
int bry = 100;
int wpx = 400;
int wpy = 400;

void draw(){
  background(0);
  //Red Ellipse
  fill(#E96151);
  noStroke();
  ellipse(rex, rey, 100, 100);
  rex+=2;
  rey+=2;
  //Blue Rectangle
  fill(#0F3D48);
  noStroke();
  rect(brx, bry, 100, 100);
  brx++;
  bry++;
  //White point
  stroke(#ECECE7);
  strokeWeight(25);
  point(wpx, wpy);
  wpx--;
  wpy--;
}
