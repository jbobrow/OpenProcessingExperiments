
//experiência com arrays e objectos

Quadrado[] quadrado1 = new Quadrado[6];
Quadrado[] quadrado2 = new Quadrado[6];
Quadrado[] quadrado3 = new Quadrado[6];
Quadrado[] quadrado4 = new Quadrado[6];
Quadrado[] quadrado5 = new Quadrado[6];
Quadrado[] quadrado6 = new Quadrado[6];

void setup() {
  size(600,600);
  smooth();
  
  for(int i = 0; i < quadrado1.length; i++) {
    quadrado1[i] = new Quadrado(i*100, 0, 100, i*100, 100, i*100+100, 0);
    quadrado2[i] = new Quadrado(i*100, 100, 100, i*100, 200, i*100+100, 100);
    quadrado3[i] = new Quadrado(i*100, 200, 100, i*100, 300, i*100+100, 200);
    quadrado4[i] = new Quadrado(i*100, 300, 100, i*100, 400, i*100+100, 300);
    quadrado5[i] = new Quadrado(i*100, 400, 100, i*100, 500, i*100+100, 400);
    quadrado6[i] = new Quadrado(i*100, 500, 100, i*100, 600, i*100+100, 500); 
  }
  
}

void draw() {
  background(255);
  for(int i = 0; i < quadrado1.length; i++) {
    quadrado1[i].mostrar();
    quadrado2[i].mostrar();
    quadrado3[i].mostrar();
    quadrado4[i].mostrar();
    quadrado5[i].mostrar();
    quadrado6[i].mostrar();
  }
}

void mousePressed() {
  for(int i = 0; i < quadrado1.length; i++) {
    quadrado1[i].interruptor(mouseX,mouseY);
    quadrado2[i].interruptor(mouseX,mouseY);
    quadrado3[i].interruptor(mouseX,mouseY);
    quadrado4[i].interruptor(mouseX,mouseY);
    quadrado5[i].interruptor(mouseX,mouseY);
    quadrado6[i].interruptor(mouseX,mouseY);
  }
}
class Quadrado {
  //x do quadrado branco de fundo
  int xQ;
  //y do quadrado branco
  int yQ;
  //dimensões do quadrado branco
  int dQ;
  //x e y das linhas diagonais
  int x1;
  int y1;
  int x2;
  int y2;
  
  boolean botao;
  
  Quadrado(int tempXQ, int tempYQ, int tempDQ, int tempX1, int tempY1, int tempX2, int tempY2) {
    xQ = tempXQ;
    yQ = tempYQ;
    dQ = tempDQ;
    
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    
    botao = false;
  }
  
  void mostrar() {
    if(botao) {
    noStroke();
    fill(255);
    rect(xQ,yQ,dQ,dQ);
    stroke(0);
    noFill();
    line(x1,y1-100,x2,y2+100);
    } else {
          //quadrados do fundo brancos
    noStroke();
    fill(255);
    rect(xQ,yQ,dQ,dQ);
    //linhas na diagonal
    stroke(0);
    noFill();
    line(x1,y1,x2,y2);
    }
  }
  
  void interruptor(int mx, int my) {
    if(mx >= xQ && mx <= xQ+dQ && my >= yQ && my <= yQ+dQ) {
      botao = !botao;
    }
  }
  
}


