
//name: Matías Moreno
//date: 1-9-14
int x = 50;        // variables
int y = 50;

int dx = 9;        // velocity (9,5)
int dy = 5;

void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white

}

void draw() {  //draw function loops 

  fill (0,255,0);
  ellipse(x,y,20,20);
  x = x + dx;
  y = y + dy;
  
  if (mousePressed){
      x = mouseX;
  }
  
  if (x > 500) {        // X axis collision
      dx = -9;
  }
  else if (x < 0) {
      dx = 9;
  }
  
  if (y > 250)  {      // Y axis collision
      dy *= -1;        // the same as dy = dy*(-1)
  }
  else if (y < 0) {
      dy *= -1;
  }
}
