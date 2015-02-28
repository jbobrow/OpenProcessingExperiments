
int maVariable;
void setup() {
  maVariable = 5;
  size (200,450);
}
void draw() {

  strokeWeight(3);
  noFill();
  ellipse(100,100,160, 160);
  line(100,180,100,300);
  line(10,190,190,190);
  line(100,300,10,400);
  line(100,300,190,400);
  ellipse(50,90,20,20);
  ellipse(150,90,20,20);
  fill(random(255),random(255),random(255));
  ellipse(50,90,20,20);
  ellipse(150,90,20,20);
}



