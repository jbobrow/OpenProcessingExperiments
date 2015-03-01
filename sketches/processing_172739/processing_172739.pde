
int rectX=50 ;
int rectY=50;
int rectA=350 ;
int rectB=50 ;

void setup() {
  size (400, 400);
}
void draw() {
  rectMode (CENTER);
  background (17,247,207);
  stroke(0);
  fill(255,7,7);
  rect(rectX, rectY,50,50);
  rect(rectA, rectB,50,50);
  rectX = rectX + 3;
  rectY = rectY + 3;
  rectA = rectA - 3;
  rectB = rectB + 3;
}
