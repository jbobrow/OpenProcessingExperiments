
void setup() {
  size(700,700);
}

void draw() {
  background(255);
  if(mouseX == (0,0)) {
      background(0,250,0);
  }
  fill(random(250),random(250),random(250));
  ellipse(mouseX,mouseY,175,175);
  fill(250,0,250);
  ellipse(mouseX,mouseY,150,150);
  fill(0,0,250);
  ellipse(mouseX,mouseY,125,125);
  fill(0,250,250);
  ellipse(mouseX,mouseY,100,100);
  fill(0,250,0);
  ellipse(mouseX,mouseY,75,75);
  fill(250,250,0);
  ellipse(mouseX,mouseY,50,50);
  fill(250,0,0);
  ellipse(mouseX,mouseY,25,25);
  fill(random(250),random(250),random(250));
  rectMode(CENTER);
  rect(mouseX,mouseY,10,10);
}
