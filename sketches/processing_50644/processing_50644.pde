
float x, posX, posY;


void setup () {
  size (400, 400);
  background (0);
  smooth ();
}

void draw () {
  x=10;
  ellipse(random(400), random(400), x, x);
}

void mouseDragged () {
  posX=mouseX;
  posY=mouseY;
  fill(random(255), random(255), random (255), random(255));
  ellipse (posX, posY, random(100), random(100));
}

void keyPressed () {
  if (key== 'c') {
    background (0);
  }
  if (keyCode== UP) {
    x=x+20;
  }
  if (keyCode==DOWN){
    x=x-5;
  }
}

