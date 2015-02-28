
//Roberta
void setup() {
  size(200, 200);
  background(#A21AAA);
  noStroke();
  fill(#FAFF05);
}
void draw() {

  int x;
  int y;
  for ( x=5; x<200; x=x+7)
  {
    for ( y=5; y<200; y=y+20)
      rect(x*x/10, y, 5, 5);
  }
}
