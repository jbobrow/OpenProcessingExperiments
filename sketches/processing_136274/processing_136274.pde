
//Caroline Alves Lins de Albuquerque. ComputaÃ�Â§Ã�Â£o S53
//Retangulo girando ao redor do mouse

//Criando variÃ�Â¡vel
float r = 5;
float backR;
float backG;
float backB;

void setup() {
  size(400, 400);
  //VariaÃ�Â§Ã�Â£o de cor de fundo
  backR = random(0, 100);
  backG = random(0, 100);
  backB = random(0, 100);
  //Cor de fundo
  background(backR, backG, backB);
  //Faz o retÃ�Â¢ngulo seguir o centro do mouse
  rectMode(CENTER);
}

void quadrado(int a, int l,int x,int y) {
  //Cor de fundo e do retÃ�Â¢ngulo
  fill(backR, backG, backB, 50);
  fill(255);
  //Faz o retÃ�Â¢ngulo girar e seguir o mouse
  translate(mouseX, mouseY);
  rotate(r);
  r = r + x;
  //Tamanho do retÃ�Â¢ngulo
  rect(0, 0, a, l);
  //O quadrado muda de cor de acordo com a posiÃ�Â§Ã�Â£o do mouse
  if (mouseX<width/y) {
    fill(100);
    rect(0, 0, a, l);
  }
  if (mouseX>height/y) {
    fill(255);
    rect(0, 0, a, l);
  }
 //Ao pressionar o mouse o quadrado gira mais rÃ�Â¡pido
  if (mousePressed) {
    r++;
  }
}
//Ao soltar o botÃ�Â£o o quadrado volta a girar normalmente
void mouseReleased() {
  r = 0;
}
void draw(){

if (mouseX<weidth/2){
quadrado(50,50,0.10,2);
}
if (mouseX>height/2){
quadrado(100,100,0.05,2);
}
//<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.

