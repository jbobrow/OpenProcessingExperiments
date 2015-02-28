
/*
COMPOSIÇÃO LAYERS
 */

PFont font; // Chamada da class

int dX, dY; // Dimensões da tela
float cX, cY; // Coordenadas do centro da tela
int nQ; // Número de quadrados
int rPX, rPY; // Posições aleatórias
int lH, lV; // Limites horizontais e verticais

void setup() {
  font = loadFont("1454GutenbergBibel-48.vlw"); // Loading da fonte
  textFont(font, 200); // Criação da fonte e definição do tamanho

  dX=500; 
  dY=500;

  size(dX, dY); // Criação da tela
  background(250, 230, 0); // Cor de fundo
  smooth(); // Suaviza o conteudo da tela
  //frameRate(5); // Número de frames por segundo
  noLoop(); // Sem repetição
}

void draw() {
  dX=width; 
  dY=height;

  cX=dX*0.5;
  cY=dY*0.5;

  lH=50; 
  lV=50;

  nQ=750;

  stroke(255, 75); // Traço BRANCO com alpha 75
  strokeWeight(5); // Espessura do traço de 5
  noFill(); // Sem preenchimento
  for (int x=3; x<nQ; x++) {
    rPX=(int) random(lH, dX-lH);
    rPY=(int) random(lV, dY-lV);
    noStroke(); // Sem traço
    fill(255, random(200, 255)); // Preenchimento dos quadrados de BRANCO com alpha aleatório entre 200 e 255
    rectMode(CENTER); // Definição do centro de construção dos quadrados
    rect(rPX, rPY, 35, 35); // Criação dos quadrados com diametro 35 em posições aleatórias
  }

  filter(BLUR); // Aplicação de filtro BLUR nos quadrados

  noStroke(); // Sem traço
  fill(30, 170, 20); // Preenchimento a VERDE da circunferência 
  ellipse(cX, cY, 300, 300); // Criação da circunferência
  filter(BLUR); // Aplicação de filtro BLUR na círcunferência

  fill(255); //Cor do texto
  textAlign(CENTER, CENTER); // Alinhamento do texto
  text("0", cX, cY); // Desenho do texto na posição central da tela
}

