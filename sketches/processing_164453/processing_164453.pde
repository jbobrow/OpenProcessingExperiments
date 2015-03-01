
boolean drawSpace = false;

void setup() {
  size(500,500);
  background(0);
  noStroke();
  noCursor();
}

void draw() {
  if (drawSpace == true) {
    liquid(10,10);
  } else {
    background(0);
  }
}


void liquid(int x, int y) {
  for (int i = 0; i < 10; i+=5) {
    drop(int(random(500)),int(random(500)));
   }
}

void drop(int x, int y) {
  fill(x-40,x,y,3);
  translate(x,y);
  for (int i = 0; i < 280; i+=2) {
    ellipse(x,y,i-180,i-180);
  }
}

void keyPressed() {
  if (key == ' '){
    drawSpace = true;
  }
}

void keyReleased() {
  drawSpace = false;
}


