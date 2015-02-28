
//Roberta
void setup() {
  size(200, 200);
  background(#00FF00);
  noStroke();
  fill(#FF0000);
}
void draw() {

  int x;
  int y;
  for ( x=0; x<250; x=x+15)
  {
    for ( y=0; y<250; y=y+15)
      rect(x, y, 5, 5);
  }
}
