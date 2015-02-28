

float b = 0;
color bc = 255;
boolean isDone = true;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}
void makeBlack() {
  bc++;}
void makeWhite() {
  bc--;
}


void draw() {
  noStroke();
  fill(bc);
  ellipse(width/2, height/2, ((255)-(bc)), ((255)-(bc)));
   if (isDone) {
    makeWhite();
    if (bc == 0) {
      isDone = false;
    }
  } else {
    makeBlack();
    if (bc == 255) {
      isDone = true;
    }
  }
}


