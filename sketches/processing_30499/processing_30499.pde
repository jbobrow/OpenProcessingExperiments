
//declarar variavel, onde se define a quantidade dos quadradinhos.
 int num = 300;
 
//dar entrada as variaveis da forma e da cor (4 cores)
camuf[] camuflagem = new camuf[num];
color [] cor = new color[4];
 
//definir tamanho da tela, cor de fundo, suavidade 
void setup() {
  size(400,400);
  background(255);
  noStroke();
  smooth();
//definir as quatro cores 
  cor[0] = color(89,132,189,30);
  cor[1] = color(140,192,108,30);
  cor[2] = color(232,210,88,30);
  cor[3] = color(153,0,0,30);
 
 
  for(int i=0; i < camuflagem.length; i++) {
    camuflagem[i] = new camuf();
  }
}
//funcao que desenha as formas, segundo a criacao da classe camuf 
void draw() {
 
 
  for(int i=0; i < camuflagem.length; i++) {
    camuflagem[i].update();
    camuflagem[i].display();
  }
}
 //classe onde se cria os quadradinhos, direcção random vertical e horizontal, e as cores definidas anteriormente
  class camuf {
    float x = random(0,width);
    float y = random(0,width);
    float rectSize = random(3,6);
    color colorChoice = cor[floor(random(0,4))];
 
    camuf() {
    }
 
    void update () {
      x = x + random(-2,2);
      y = y + random(-2,2);
    }
 
    void display() {
      fill(colorChoice);
      rect(x,y,rectSize,rectSize);
    }
  }
                                            
