
//farm humor!
/*
why did the scarecrow get a promotion?
he was out standing in his field.
*/
void setup() {
  background(0);
  size(200,200);
  stroke(random(255));
}
void draw() {
  float x=random(width);
  float y=random(height);
  strokeWeight(200);
  stroke(random(255),random(255),random(255),70);
  line(x,0,y,width);
}

