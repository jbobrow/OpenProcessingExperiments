
int rectX=50 ;
int rectY=50;
int rectA=350 ;
int rectB=50 ;

void setup() {
  size (400, 400);
}
void draw() {
  rectMode (CENTER);
  background (7000000);
  stroke(0);
  fill(175);
  rect(rectX, rectY,50,50);
  rect(rectA, rectB,50,50);
  rectX = rectX + 2;
  rectY = rectY + 2;
  rectA = rectA - 2;
  rectB = rectB + 2;
}
