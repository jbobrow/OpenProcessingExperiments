
float posy;
float posx;
float ball_size = 40;


void setup() {
  size(400,400);
  background(255);
  fill(255,255,0);
  noStroke();
  smooth();
  posx = 0;
  posy = height/2;
  frameRate(120);
}

void draw() {
  background(0);
  fill(random(255),random(255),random(255));
  ellipse( posx, posy, ball_size, ball_size );
  posx ++;
  if( posx > width+(ball_size/2) ){ posx = - ball_size; }
  posy = height/2 + (cos(radians(posx)) *50);
}
