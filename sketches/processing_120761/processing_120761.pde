
// Trabalho I
// Tags: PImage, if, abs.
// Nome: Anderson Luiz Krainski
// Data: 05/11/2013
// Resumo da ideia: Fazer uma animaÃ§Ã£o aleatoria, usando funÃ§Ãµes de movimento do mouse e de imagens para criar a animaÃ§Ã£o.
// Não carrega as imagens em Javascript, é necessário fazer o download e rodar em Java.


PImage fundo;
PImage bruxa;
PImage olho;
PImage fantasma;
int x = -100;
int y = 100;
int z;
int w;
int V = 3;
float S = 0.05;

void setup() {
  size(600, 336);
  fundo = loadImage("creepy.jpg");
  bruxa = loadImage("bruxavetor.jpg");
  olho = loadImage("evileye.jpg");
  fantasma = loadImage("fantasma.jpg");
}

void draw() {
  background(fundo);
  img();
  move();
} 
void img() {
  image(bruxa, x, y, bruxa.width/2, bruxa.height/2);
  image(olho, 550, 25, olho.width/15, olho.height/15);
  image(fantasma, z, w, fantasma.width/10, fantasma.width/13);
}
void move() {
  x = x + V;
  if (x > width) {
    x = -100;
  }
  float ghostZ = mouseX;
  float sz = ghostZ - z;
  if(abs(sz) > 1) {
    z += sz * S;
  }
  
  float ghostW = mouseY;
  float sw = ghostW - w;
  if(abs(sw) > 1) {
    w += sw * S;
  }
}




