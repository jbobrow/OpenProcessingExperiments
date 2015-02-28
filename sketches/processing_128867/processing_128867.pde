
float incremento =50;
int divisores[]= {
  30, 50, 100, 150, 200, 300
};

void setup() {
  size(1200, 600);
  background(255);
  fill(0);
  gera();
}

void draw() {
  if (random(1)>.998) gera();
}

void mousePressed() {
  gera();
}

void gera() {
  background(255);
  int x=0;
  int y=0;
  while (y<height) {
    if (random(1)>.4) {
      quadrado(x, y);
    }
    x+=incremento;
    if (x>width) {
      x=0;
      y+=incremento;
    }
  }

  stroke(200);
  for (int i=0; i<=width; i+=incremento) line(i, 0, i, height);
  for (int i=0; i<=height; i+=incremento) line(0, i, width, i);
  incremento=divisores[int(random(divisores.length))];
  strokeWeight(.25);
}

void quadrado(float px, float py) {
  pushMatrix();
  noStroke();
  translate(px+incremento/2, py+incremento/2);
  rotate(int(random(4))*PI/2);
  fill(255);
 // rect(-incremento/2, -incremento/2, incremento, incremento);
  fill(0);
  stroke(0);
  int quantos=int(incremento)*2;
  strokeWeight(.5);
  for (int i=0; i<(quantos+1); i++) {
    line(-incremento/2, -incremento/2, 0, incremento);
    rotate(PI/2/quantos);
  }

  popMatrix();
}
void keyPressed(){
  if(key=='s') saveFrame("padraoDeLinhas####.png");
}

