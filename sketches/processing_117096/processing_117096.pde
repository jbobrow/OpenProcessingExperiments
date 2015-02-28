
Linha[] linhas;
int numL = 20; //quantidade de instâncias que vão aparecer

void setup() {
  //size(displayWidth, displayHeight);
  size(700,500);
  background(0);
  smooth();
  colorMode(RGB, width, height, 2000);
  linhas = new Linha[numL];
  for (int i = 0; i < numL; i++){
    linhas[i] = new Linha(random(width),random(height),random(5,200));
  }
}

void draw() {  
  //background(0);
  for (int i = 0; i < numL; i++){
    linhas[i].desenha();
    linhas[i].atualiza();
  }
}

//limpar a tela
void mousePressed() {
  background(0);
}


class Linha {

  float px, py; //posicao
  float comp; //comprimento
  float dir; //sorteio para direçao
  float ang = 0;
  float b = 500; //quantidade de azul na cor
  color cor = color(mouseX, mouseY, b);
  
  Linha(float x, float y, float c) {
    px = x;
    py = y;
    comp = c;
    dir = random(0, 1);
  }

  void desenha() {
    pushMatrix();
    pushStyle();
    translate(px, py);
    rotate(radians(ang));
    stroke(cor, 100);
    line(0, 0, comp, comp);
    popStyle();
    popMatrix();
  }

  void atualiza() {
    
    //adiciona azul
    if (b < 2000) {
      b += 1;
    }
    else {
      b = 0;
    }

    cor = color(mouseX, mouseY, b);
    //println(b);
    
    //sentido horário
    if (dir > 0.5) {
      ang = ang + 0.5;
      if (ang > 360) {
        ang = 0;
      }
    }
    //sentido anti horario
    else
    {
      ang = ang - 0.5;
      if (ang > 0) {
        ang = 0;
      }
    }
    
    px = px + 1;
    py = py + 1;
    if (px > width) {
      px = 0;
      dir = random(0, 1);
    }
    if (py > height) {
      py = 0;
      dir = random(0, 1);
    }
  }
}
