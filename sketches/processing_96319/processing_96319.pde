
// Aline da Silva Lima
// Desenho feito com referência ao da colega de classe Roberta
void setup() {
  size(200, 200);
  background(5,2,59);
}
  
  
void draw() {
 stroke(175,115,25);
  for (int x=15,y=100;x<140;x=x+10) {
        strokeWeight(3);
    line(x, y, x-15, y+15);
    y=y-15;
  }
  for (int x=70,y=10;x<160;x=x+10) {
        strokeWeight(3);
    line(x, y, x+15, y+15);
    y=y+15;
  }
  stroke(245,185,241);
  line(20, 100, 20, 190);
  line(20, 190, 150, 190);
  line(150, 138, 150, 190);
  noStroke();
  fill(252,245,176);
  ellipse(160,30,30,30);
  noStroke();
  fill(7,129,0);
  rect(0,190,200,10);
  fill (245,185,241);
  rect (110,140,25,25);
  fill (175,115,25);
  rect (50,140,25,49);
}
