
// claire gustavson, homework 4, copywrite 2012.
//KEY input displays and moves across the screen. The circle visualization represents the number associated with the key. Background changes with scaled randomness. Spacebar creates randomness. 


float x, y, pos; 
void setup() {

  size (400, 400);
  smooth();
  textSize(20);
  fill (255);
  pos=200;
  text ("Press any key", 125, 200);
}

void draw() {

  if (key == ' ') {
    background (random (255), random (200), 200);
  }
}
void keyPressed () {

  if (pos> -30) {
    pos=pos-25;
  }
  else {
    pos=200;
  }
  background (random (255), random (200), 200);
  fill (255);
  textSize(100);
  text (key, pos, 200);
  noStroke();
  fill (255, 100);
  ellipse (width/2, height/2, keyCode*2, keyCode*2);
}


