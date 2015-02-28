
void setup(){
  size(500,500);
  background(0);
  smooth();
}
/*definçoes do programa*/

void draw(){
  fill(255);
  rect(width/2, 0, width, height);
  /*quadrado branco*/
  if (mouseX>250){
    fill(random(255), random(255), random(255));
    ellipse(125, 250, 50,50);
    /*condição de que se o rato estiver na metade esquerda da janela,
    a circunferência ira mudar de cor*/
  }
}

