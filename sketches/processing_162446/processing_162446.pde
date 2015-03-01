
void setup() {
  size(400,400);
}
//wanted the arms to rotate but instead they only follow the Y axis

void draw() {
  fill(0);
  rect(200,180,20,100);
  noFill();
  fill(255);
  ellipse(180,200,60,60);
  ellipse(220,180,60,60);
  fill(0);
  ellipse(180,200,20,20);
  noFill();
  fill(255);
  ellipse(220,180,20,20);
  noFill();
  fill(255);
  ellipse(210,270,40,30);
  noFill();
  rect(220,mouseY,10,100);
  rect(190,mouseY,10,100);
}
