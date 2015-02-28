
float ellipseSize = 10;
float speed = 2;
float border = 1;

float posx;
float posy;
int dirx;
int diry;

boolean displayRect = false;

void setup() {
  size (350, 250);
  smooth ();
  ellipseMode (CENTER);
  
  posx = 0;
  posy = 0;

  dirx = 1;
  diry = 1;
  
  background (0);
}

void draw() {

  fill(0, 20);
  rectMode (CORNER);
  noStroke ();
  rect(0, 0, width, height);
  
  fill (255);
  rectMode (CENTER);

  posx += speed * dirx;
  posy += speed * diry;

  if (posx > width || posx < 0) {
    dirx = dirx * -1;
    ellipseSize += 5;
  }

  if (posy > height || posy < 0) {
    diry = diry * -1;
    ellipseSize += 5;
  }
  
  if (posx > width - border || posx < 0 + border || posy > height - border || posy < 0 + border ) {
    displayRect = !displayRect;
  }

  if (displayRect) {
    rect (posx, posy, ellipseSize, ellipseSize);
  } 
  else {
    ellipse (posx, posy, ellipseSize, ellipseSize);
  }
  
  if(ellipseSize > 100) {
  ellipseSize = 10;
    
  }
  
}
