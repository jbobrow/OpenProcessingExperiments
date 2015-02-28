
int x = 0;
int y = 0;

void setup() {
  size (1000,1000);
}

void draw() {
  background(random(0,255));
  fill(random(0,255));
  strokeWeight(4);
  rect(x+300,y+300,400,400);
  ellipse(x+500,y+200,200,200);
  line(x+300,y+400,x+200,y+650);
  line(x+700,y+400,x+800,y+650);
  line(x+400,y+700,x+400,y+900);
  line(x+600,y+700,x+600,y+900);
  ellipse(x+465,y+200,40,40);
  ellipse(x+525,y+200,40,40);
  x = x -2;
}

