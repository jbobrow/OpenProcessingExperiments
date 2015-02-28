
float r;


void setup() {
  size(800, 350);
  smooth(); 
  r=random(0, 255);
}

void draw() {
  background(255);

  perfume(90, 100, 30);
  perfume(180, 0, 100);
  perfume(270, -100, 50);
  perfume(360, 0, 60);
  perfume(450, -100, 40);
  perfume(540, 0, 80);
  perfume(450, 100, 40);
  perfume(270, 100, 50);
  

}

void perfume(float x, float y, float c) {
  pushMatrix();
  translate(x, y);
  fill(random(250), random(50), random(250));
  quad(80, 118, 110, 120, 95, 125, 65, 123);
  quad(110, 120, 110, 145, 95, 155, 95, 125);
  quad(65, 123, 95, 125, 95, 155, 65, 150);
  quad(65, 155, 130, 162, 115, 175, 43, 165);
  quad(43, 165, 115, 175, 115, 275, 43, 258);
  quad(115, 175, 130, 162, 115, 275, 130, 255);
  ellipse(88, 165, 32, 7);
  line(72, 153, 72, 165);
  line(105, 150, 105, 165);

  popMatrix();
}



