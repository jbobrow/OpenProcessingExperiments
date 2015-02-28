
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/141376*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//
//Retangulo girando ao redor do mouse

float r = 5;
float backR;
float backG;
float backB;
float passo=0.01;


void setup() {
  size(2500, 5000);
  //
  backR = 255;
  backG = 255;
  backB = 255;
  //Cor de fundo
  background(backR, backG, backB);
  //Faz o quadrado seguir o centro do mouse
  rectMode(CORNER);
}

void quadrado(int x, int y, int a, int l, float r) {
  rectMode(CENTER);
  //Faz o quadrado girar e seguir o mouse
  pushMatrix();
  translate(x, y);
  rotate(r);
  r = r + x;
  //Tamanho do quadrado
  rect(0, 0, a, l);

  //A
  if (mousePressed) {
    r++;
  }
  popMatrix();
}

void draw() {
//Muda a cor do quadrado
  if (mouseX<width/2) {
  //stroke(153);
    fill(255,178,102, 50);
    stroke(192,192,192,80);
  }
  if (mouseX>height/2) {
  stroke(224,224,224,90);
    fill(255,178,102, 70);
    
  }
//Muda o quadrado de acordo com a 
  if (mouseX<width/2) {
    quadrado(mouseX, mouseY, 125, 6,r);
  }
  stroke(224,224,224,90);
  fill(255,178,102, 70);

  if (mouseX>width/2) {
    quadrado(mouseX, mouseY, 100, 100, -r);
  }
//velocidade do quadrado
  r= r+passo;

  if (mousePressed) { 
    r++;
  }
}

//Ao soltar o botÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¿Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o o quadrado volta a girar normalmente
void mouseReleased() {
  r=0;
}

//


