
/*
COMPOSIÇÃO PROBILIDADES
 */

int dX, dY; // Dimensões da tela
float cX, cY; // Coordenadas do centro da tela
int rX, rY; // Variáveis aleatórias

int aeRand; // Pontos aleatórios numa linha diagonal de abertura à esquerda
int adRand; // Pontos aleatórios numa linha diagonal de abertura à direita
LinhaC linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8; // Criação dos objectos


void setup() {
  dX=500; // Largura da tela
  dY=500; // Altura da tela

  size(dX, dY); // Definição das dimensões da tela
  smooth(); // Animação suavizada
  //noLoop(); // Sem Loop
  frameRate(5); // Número de frames por segundo
}

void draw() {
  cX=dX*0.5;
  cY=dY*0.5;

  aeRand= (int)random(50, cY-50);
  adRand= (int)random(cY+50, dY-50);

  // Definição dos objectos
  linha1 = new LinhaC(adRand, adRand);
  linha2 = new LinhaC(aeRand, aeRand);
  linha3 = new LinhaC((int)cX, adRand);
  linha4 = new LinhaC(adRand, (int)cY);
  linha5 = new LinhaC((int)cX, aeRand);
  linha6 = new LinhaC(aeRand, (int)cY);
  linha7 = new LinhaC(aeRand, dY-aeRand);
  linha8 = new LinhaC(adRand, dX-adRand);

  background(0); // Definição da cor de fundo da tela
  stroke(255); // Cor do traço a BRANCO
  strokeWeight(5); // Espessura do traço de 5
  fill(0); // Cor interna das círcunferências

  // Desenho dos objectos
  linha1.cria();
  linha2.cria();
  linha3.cria();
  linha4.cria();
  linha5.cria();
  linha6.cria();
  linha7.cria();
  linha8.cria();

  ellipse(cX, cY, 40, 40); // Criação do círculo central
}

// Criação da class do objecto
class LinhaC { 
  int endX, endY;
  // Parâmetros do objecto que definem a extremidade de cada linha
  LinhaC(int tempEndX, int tempEndY) {
    endX= tempEndX;
    endY= tempEndY;
  }
  void cria() {
    // Se a distância entre o centro da tela e a extremidade da linha for maior que 100 a circunfência na ponta da linha tem a dimensão de 25 por 25
    if (dist(cX, cY, endX, endY)>100) {
      line(cX, cY, endX, endY);
      ellipse(endX, endY, 25, 25);
    }
    // Caso a distência seja inferior a 100, a circunferência tem a dimensão de 10 por 10
    else {
      line(cX, cY, endX, endY);
      ellipse(endX, endY, 10, 10);
    }
  }
}
