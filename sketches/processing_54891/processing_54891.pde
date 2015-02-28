
//some global vairables

float x;
float y;
float spdx;
float spdy;
float gravity;
float w;
float h;
float damping;
float friction;

void setup(){
  size(600, 600);
  smooth();
  x = 120;
  y = 386;
  spdx = random(0, 6);
  //spdx and spdy randomized so the throw is different every time.
  //I had them constant but it was really boring.
  gravity = .08;
  //i messed around with gravity until i got it to look relatively realistic
  spdy = random(-6, 0);
  w = 20;
  h = 20;
  damping = .9;
  //damping is about how it should be for a good rubber ball
  friction = .8;
  //relatively high friction, it is a rubber ball after all
}

void draw(){
  backgr();
  /*the hardest part of this whole thing was getting the background to not
  mess with the look of the ball. I didn't want the ball to leave a trail, so
  I had to make the background its own separate function and then declare it
  before the ball animation so it would animate over the trail.*/
  
  noStroke();
  fill(245, 10, 10);
  ellipse(x, y, w, h);
  
  x += spdx;
  spdy += gravity;
  y += spdy;
  
  if (x > width-w) {
    x = width-w;
    spdx *= -1;
  }
  
  if (x < 0) {
    x = 0;
    spdx *= -1;
  }
  
  if (y > height-120) {
    y = height-120;
    spdy *=-1;
    spdy *= damping;
    
    spdx *= friction;
  }
  
  if (y < 0) {
    spdy *= -1;
  }
}

