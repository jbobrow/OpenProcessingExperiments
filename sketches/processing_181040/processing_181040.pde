

int x = 215; 
int y = 215;

void setup() {
  background(0);
  size(900, 1000);
  stroke(255, 90);
  strokeWeight(6);
}

void draw() {
  if (keyPressed && (key == CODED)) { 
    if (keyCode == LEFT) {
      x = x - 10;
    } else if (keyCode == RIGHT) {
      x=x+10;
    } else if (keyCode == UP) {
      y = y - 10;
    } else if (keyCode == DOWN) {
      y=y+10;
    }
  }

  if ( x < 0 - 30 ) {
    x = width;
  }
  if ( x > width ) {
    x = 0;
  }
  if ( y < 0 -55 ) {
    y = height;
  }
  if ( y > height ) {
    y = 0;
  }
//  image(img,0,0);
  fill(0,10);
  noFill();
ellipse (x+68,y+68,200,200);
rect (x,y, 136,136);  
line(x,y,x+133,y+133);
line(x+133,y,x,y+133);
}


