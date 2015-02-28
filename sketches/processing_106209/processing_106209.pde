
void setup() {
  size(550, 400);
  rectMode(CENTER);
}
void draw() {
  background(250, 240, 0);

  //-------------cabeça
  strokeCap(ROUND);
  strokeWeight(10);
  fill(169, 20, 40);
  stroke(0);
  arc(286, 150, 284, 250, PI, TWO_PI);
  //arc(145, 149, 280, 100, 180, PI+TWO_PI);
  //------------rectangulo vermelho
  strokeCap(SQUARE);
  fill(169, 20, 40);
  noStroke();
  rect(289, 256, 280, 212);
  //----------cara amarela
  fill(251, 214, 1);
  rect(289, 272, 248, 170);
  ellipse(228, 186, 125, 100);
  ellipse(350, 186, 125, 100);


  //-----------------
  strokeWeight(15);
  strokeCap(SQUARE);
  stroke(0);
  //---------------------------olhos
  line(193, 259, 268, 259);//-----------------olho esquerdo
  line(307, 257, 385, 257);//-----------------olho direito
  line(146, 364, 428, 364);//-----------------"queixo", linha
  //------------------orelhas
  strokeWeight(10);
  fill(218, 37, 28);
  quad(113, 340, 113, 244, 143, 227, 143, 361);//-----------------orelha esquerda
  quad(428, 227, 455, 244, 455, 340, 428, 361);//-----------------orelha direita
  //---------
  //strokeCap(ROUND);

  line(144, 149, 144, 358);//---------linha esquerda 
  line(428, 149, 428, 355);//---------linha direita


  //---------"testa"
  fill(212, 49, 42);
  noStroke();
  ellipse(289, 67, 140, 70);
  
  
  
}
