
// quadrados recursivos
int quantosConjuntos;
void setup() {
  size(1024, 512);
  background(255);
  desenhaTela();
}

void desenhaTela() {
  quadrado(0, 0, height); 
  quadrado(512, 0, height);
}

void draw() {
  if (mousePressed) {
    background(255);
    desenhaTela();
    quantosConjuntos=0;
  }
}

void quadrado(int px, int py, int tam) {
  if (tam>height/4 || (tam>8 && random(1)>.4)) {
    for (int i=0; i<4; i++) {
      quadrado(px+int(i%2) * int(tam/2), py+int(i/2)*int(tam/2)-int(tam/24), int(tam/2));
    }
  }
  else {
    desenhaForma(px, py, tam);
    quantosConjuntos++;
    return;
  }
}

void desenhaForma(int px, int py, int incremento) {
  pushMatrix();
  noStroke();
  translate(px+int(incremento/2), py+int(incremento/2));
  float tAng=int(random(4))*PI/2;
  rotate(tAng);
  fill(random(255), random(255), random(255));
  rect(-incremento/2, -incremento/2, incremento, incremento);
  fill(255);
  //fill(random(255),random(255),random(255));
  arc(-incremento/2, -incremento/2, 2*incremento, 2*incremento, 0, PI/2);
   popMatrix();
}
