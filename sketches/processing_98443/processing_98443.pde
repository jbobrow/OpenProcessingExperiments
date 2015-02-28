
// Dyego Lima

PFont fonte;
int j = 128;

void setup() {
  size(200, 200);
  background(0);
  fonte = createFont("verdana", 10); 
  textFont(fonte);
}

void draw() {
  fill (65, 80, 113);
  rect (0, 0, 200, 160); //Céu
  fill (35, 70, 35);
  rect (0, 160, 200, 40); //Chão
  fill (90, 60, 10);  
  rect (20, 60, 100, 100); //Casa
  for (int x=60; x<160; x=x+10) {
    line (20, x, 120, x);
  }
  rect (120, 130, 60, 30); //Garagem
  rect (40, 140, 10, 20); //Porta
  fill (240, 255, 70);
  ellipse (43, 151, 2, 2);
  rect (65, 140, 40, 10); //Janela
  line (85, 140, 85, 150);
  fill (180, 170, 145);
  rect (130, 140, 40, 20); //Portão
  fill (250,250,210);
  ellipse (170,30,30,30); //Lua
  for (int a=140; a<160; a=a+3) {
    line (130, a, 170, a);
  }
  for (int i=120; i<180; i=i+3) { //Telhado
    line (i, j, i+2, j+2);
    
  }
  textAlign(RIGHT);
  fill (255); 
  text("Dyego 2013", width-10, height-10);
}
