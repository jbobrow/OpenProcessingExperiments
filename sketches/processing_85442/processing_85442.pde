
float d;
float sqronex;
float sqroney;
void setup() {
  size(700,700);
  smooth(0);
  background(200);
}

void draw() {
  sqronex=(350+sin(d-PI)*200);
  sqroney=(350+cos(d-PI)*200);
  fill(255, 10);
  rect(0,0,width,height);
  fill(0);
  rect(350+sin(d)*200,350+cos(d)*200, 50, 50);
  rect(350+sin(d)*200,350,50,50);
  rect(350,350+cos(d)*200,50,50);
  rect(sqronex,sqroney, 50, 50);
  rect(sqronex, 350, 50, 50);
  rect(350, sqroney, 50, 50);
  d+=(mouseY-350) / 4500;
}
