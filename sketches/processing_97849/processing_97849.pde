
PFont fonte; 
void setup() {
  size(200, 200);
  background(135, 206, 235); //cor do céu
  fonte = createFont("oi", 12);
  textFont (fonte);
}
 int d=60; // variáveis para a repetição das janelas
int j=90;
 void draw() {
   strokeWeight(40);
  //espessura do traçado da linha
  stroke(0, 100, 0);
  //cor da linha que é verde
  line(0, 180, 200, 180);
  // representa o gramado da casa
  strokeWeight(3);
  stroke(0);
  line(10, 140, 10, 170);
  fill(255, 215, 0);
  strokeWeight(1);
  ellipse(9, 135, 10, 10);
  //luminária externa da casa
  strokeWeight(1);
  fill(255, 250, 205);
  rect(50, 130, 110, 40); //pavimento maior da casa (em branco)- primeiro andar
  for (int x=50; x<160; x=x+10) {
    line(x, 130, x, 170);
  }
  fill(205, 201, 165);
  rect(50, 80, 110, 40); // Pavimento maior - segundo andar
  int k=0; //variável para o terceiro pavimento
  for (k=46; k<150; k=k+2) { // repetição para o terceiro pavimento
    strokeWeight(1);
    rect( k, 55, 20, 20);
  }
  strokeWeight(2);
  line(46, 77, 163, 77); 
  fill(139, 71, 38);
  rect(45, 80, 4, 40);
  rect(160, 80, 5, 40);
  fill(255);
  strokeWeight(3);
  rect(50, 120, 110, 10); //Pavimento intermediário - sacada
  fill(205, 201, 165);
  rect(160, 140, 20, 30);
  //pavimento menor da casa - ainda no primeiro andar
  strokeWeight(4);
  stroke(130, 80, 40);
  line(180, 141, 180, 169);
  int x=0;
  strokeWeight(0);
  stroke(255);
  for (x=50; x<110; x=x+1) {
    line(x, 50, 10, 40);
  }
   stroke(0);
  fill(190, 190, 190);
  rect(30, 165, 70, 5);
  //escada em cinza
  rect(30, 160, 60, 5);
  rect(30, 155, 50, 5);
  rect(30, 150, 40, 5);
  // mudança de cor em degradè
  fill(160, 82, 45);
  rect(30, 145, 20, 5);
  fill(130, 80, 40);
  rect(30, 140, 20, 5);
  //mudança de cor em degradè
  fill(115, 75, 40);
  rect(30, 135, 20, 5);
  fill(105, 65, 30);
  rect(30, 130, 20, 5);

  for (d=60; d<151; d=d+20) { //repetição para as janelas
    for (j=90; j<100; j=j+10) {
      strokeWeight(1);
      fill(39, 64, 139);
      rect(d, j, 10, 20);
    }
  }
  fonte = createFont("Daniel", 12); 
//  textFont(font,12); 
  noLoop();   
 textAlign(RIGHT);  
   fill (255);   
   text("Daniel Veiga 2013", width-10, height-10); 
 }
