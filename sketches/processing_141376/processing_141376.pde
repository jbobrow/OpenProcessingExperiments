
//Caroline Alves Lins de Albuquerque. ComputaÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o S53
//Retangulo girando ao redor do mouse

float r = 5;
float backR;
float backG;
float backB;
float passo=0.05;


void setup() {
  size(400, 400);
  //Variação de cor de fundo
  backR = random(0, 100);
  backG = random(0, 100);
  backB = random(0, 100);
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

  //Ao pressionar o mouse o quadrado gira mais rápido
  if (mousePressed) {
    r++;
  }
  popMatrix();
}

void draw() {
//Muda a cor do quadrado
  if (mouseX<width/2) {
    fill(100, 20);
  }
  if (mouseX>height/2) {
    fill(255, 20);
  }
//Muda o quadrado de acordo com a posição do mouse
  if (mouseX<width/2) {
    quadrado(mouseX, mouseY, 50, 50, r);
  }
  fill(255, 30);

  if (mouseX>width/2) {
    quadrado(mouseX, mouseY, 100, 100, -r);
  }
//velocidade do quadrado
  r= r+passo;

  if (mousePressed) { 
    r++;
  }
}

//Ao soltar o botão o quadrado volta a girar normalmente
void mouseReleased() {
  r=0;
}

//<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licença Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Quadrado Girando ao redor do mouse</span> de <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.openprocessing.org/sketch/136274" property="cc:attributionName" rel="cc:attributionURL">Caroline Alves Lins de Albuquerque</a> está licenciado com uma Licença <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons - Atribuição 4.0 Internacional</a>.<br />Baseado no trabalho disponível em <a xmlns:dct="http://purl.org/dc/terms/" href="http://www.openprocessing.org/sketch/136274" rel="dct:source">http://www.openprocessing.org/sketch/136274</a>.

