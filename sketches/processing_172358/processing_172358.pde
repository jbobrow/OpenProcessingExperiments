
int counter;

void setup(){
  size(500,500);
  background(150,0,255);
}
void draw(){
  float pink=random(0,500);
  float purple=random(0,500);
  fill(20,10,255);
  rect(pink,purple,50,50);
  fill(0,250,200);
  ellipse(pink,purple,50,50);
}
