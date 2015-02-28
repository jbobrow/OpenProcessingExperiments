
//prédios e janelas aparecerão em lugares aleatórios
 
   size(200,200);
   background(10, 10, 100);
//reticulado de fundo
 fill(0,0,25);
for (int i=0; i<200;     i=i+2) {
  for (int x=0; x<200;   x=x+2) {
    stroke (50, 80, 150);
    rect (i, x, 5, 5);
    
  }
}

void setup() { 
//lua
  fill(185, 180, 250);
  ellipse(45, 70, 50, 50);
}
 
float count=0;
float num=500;
float x;
float y;
 
void draw() {
//nome
PFont fonte;
   { 
  fonte = createFont("Calibri", 12); 
  textFont(fonte); 
  textAlign(RIGHT);
  fill (255);
  text("Larissa Pacheco 2013", width-10, height-10);
}
//altura das janelas
  x=random(20, 25);
//altura das janelas em relação a altura
  y=random(-height);
//para a altura
  if (count < width) {   
    fill(40);
    rect(count * 35, height, random(30, 70), y);
//ilumina as janelas 
    if ((y<=-100) && (y+50>=-height)) {
      fill(260, 240, 10);
      rect(20+ count*35, -y, random(-15), x);
    }
  }
 
  count++;


}
