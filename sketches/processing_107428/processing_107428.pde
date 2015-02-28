
int x;
int y;

void setup() {
  size(700, 400);
  background(255);
  smooth();
}

void draw() {
  strokeWeight(1);
 fill(0);
  arc(210, 200, 260, 330, 0, HALF_PI); // arco de dentro esquerdo
  fill(255);
  arc(150, 200, 300, 300, 0, HALF_PI);//arco esquerdo de fora
 
  arc(430, 200, 260, 330, HALF_PI, PI);//arco de dentro direito
  arc(490, 200, 300, 300, HALF_PI, PI);//arco de fora direta
  line(300, 210, 300, 85);
  line(340, 210, 340, 85);
  line(300, 85, 340, 85);
  line(0, 365, 700, 365);
}
