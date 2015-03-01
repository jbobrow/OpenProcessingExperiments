
float tam, angInicial, angFinal, objetivoFinal, objetivoInicial, tamFinal;
float px, py, pxFinal, pyFinal;
float st, stFinal;
PImage ifundo;

void setup() {
  size(900, 450);
  smooth();
  strokeCap(SQUARE);
  background(255, 255, 0);
  fundo();
  tam=500;
  defineParametros();
  st=25;
}


void draw() {
  //background(255, 255, 0);
  //image(ifundo, 0, 0);
  strokeWeight(st);
  noFill();
  stroke(0);

  pushMatrix();
  translate(px, py);
  stroke(100);
  arc(0, 0, tam, tam, angInicial, angFinal);
  strokeWeight(st-1.4);
  stroke(255);
  float dAng=0.005; // valores na casa dos milésimos 0.00...
  arc(0, 0, tam, tam, angInicial+dAng, angFinal-dAng);
   
  angInicial = angInicial+(objetivoInicial-angInicial)/10;
  angFinal = angFinal + (objetivoFinal-angFinal)/15;
  tam = tam + (tamFinal-tam)/10;
  st = st +(stFinal-st)/15;
  px = px +(pxFinal - px)/10;
  py = py +(pyFinal - py)/10;

  popMatrix();
}
void mousePressed() {
  defineParametros();
} 

void defineParametros() {
  objetivoInicial = random(TWO_PI); //onde o arco vai comeÃ�ï¿½Ã�Â§ar
  objetivoFinal = objetivoInicial+random(TWO_PI); // onde  o arco vai acabar
  tamFinal = int(random(2, 6))*75; //tamanho final
  stFinal = int(random(1, 6))*25; //stroke final
  pxFinal = int(random(2, 5))*width/7; //posiÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o final
  pyFinal  = int(random(2, 5))*height/7;
}

void keyPressed(){
 background(255, 255, 0);
 fundo();
 defineParametros();
}

void fundo() {
  //fundo.beginDraw();
  noFill();
  strokeWeight(.5);
  stroke(0);
  for (int i=0; i<dist(0,0,width,height); i+=8) {
    ellipse(width/2, height/2, i, i);
  }
  noStroke();
  fill(250, 100);
  rect(0, height-24, 80, -20);
  fill(50);
  textSize(12);
  text("just click", 20, height-30);
  ifundo = get(0, 0, width, height);
}
