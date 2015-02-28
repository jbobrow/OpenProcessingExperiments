
/*Pamela Conradi
 17/03/2014
 O trabalho Color Motion de Pamela Conradi está licenciado com uma Licensa Creative Commons - Atribuição 4.0 Internacional.
 Baseado no trabalho disponível em http://www.openprocessing.org/sketch/131778.*/

Rain r1; //código adaptado, retirado de http://processing.org/discourse/beta/num_1275997615.html
int numDrops = 10; 
Rain[] drops = new Rain[numDrops];   // Declarar e criar o conjunto

int a=700;
int b=200;
int s=100;
int r=200;
int c=0;

void setup() {
  size(700, 600);
  smooth();
  noStroke();   // Dá o Loop através do conjunto para criar cada objeto
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Rain(); // Cria cada objeto
    r1 = new Rain();
  }
}
void multibezier () {
  for (int i = 0; i < 600; i = i+8) {
    fill(random(255)*c, random(mouseY), random(mouseX));   // define a cor do preenchimento das 'bezier' de acordo com o movimento do mouse

    bezier(width, 600, i, mouseY, mouseX*2, i, 0, a);  // define a forma da bezier 1

    bezier(100, 600, i, mouseX, mouseY, i, 600, a);  // define a forma da bezier 2
    bezier(0, 0, s+i, mouseY/100*s, mouseX/100*r, r, 700, 0);   // define a forma da bezier 3
    if (keyPressed) {
      a= 0;
      b=700;
      s=0;
      r=0;
    }
  }
}
void draw() {
  fill(0); 
  rect(0, 0, 700, 600);  // Dá o Loop através do conjunto para usar objetos
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  multibezier();
}

class Rain {
  float r = random(600);
  float y = random(600); // variáveis randomicas
  void fall() {
    y = y + 15;
    fill(255); // define a cor dos pingos
    ellipse(r, y, 3, 3); // define o tamanho dos pingos de chuva
    if (y>height) {
      r = random(mouseX);
      y = random(mouseY);
    }
  }
}

