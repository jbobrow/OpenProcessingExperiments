
float  vx, vy, posx, posy;

void setup() {
  vx = 6 ;
  vy= 3 ;  
  posy = 650 ;
  posx = 5 ;

  size (800,800);
  background (255);
  smooth();
}
void draw () {

  background (255);
  translate(posx, posy);
  rotate(posx/50.0);
  fill(255);
  ellipse(0,0, 100, 100);
  fill(0);
  ellipse(20,0,10,10);
  posx = posx + vx;
  if (posx > 800) {
    vx=-vx;
  }
  if (posx < 0) {
    vx=-vx;
  }
}


