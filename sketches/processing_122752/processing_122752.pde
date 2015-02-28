
int x, y;
 
void setup() {
  size(200, 200);
  noStroke();
  smooth();
  fill(0);
}

void draw() {
  //ellipse(mouseX, mouseY, 10, 10);
}

void mouseDragged() {
  ellipse(mouseX, mouseY, 5, 5);
}

void keyPressed() {

switch(key) {
    case 'q':
    background(255);
      break;
    case 'a':
     background(#FF0000);
      break;
    case 's':
    background(#0000CD);
      break;
    case 'd':
    background(#00FF00);
      break;
    case 'f':
    stroke(#FF0000);
      break;
    case 'g':
    stroke(#0000CD);
      break;
    case 'h':
    stroke(#00FF00);
      break;
  }
}



