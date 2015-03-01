
//Tripledesign wish you a Merry Christmas and Happy New Year 2015
//Tripledesign.pt


float volume; 
float y = 100;
int posX = 0;
int posY = 0;
int sentidoX = 1;
int sentidoY = 1;

int x = 0;
// declaracao
PVector[] posicoes = new PVector[100];

PFont font;

void setup() {
  size(1024, 756);
  background(#FF4500);
  smooth();
font = loadFont("Gotham-Book-40.vlw");
  // inicializacao
  for (int i = 0  ; i < posicoes.length ; i++) {
    posicoes[i] = new PVector( (int) random(0, width), (int) random (0, height)  );
  }
}


void draw() {
  //background();
  // desenho
  // retangulo/transparencia
  textFont(font, 32);
  fill(255);
  text("TRIPLEDESIGN CHRISTMAS", 250, 240);
  textFont(font, 20);
  fill(255);
  text("Este ano, desenhe connosco o Natal!", 250, 280);
  noStroke();
  fill(0,4);
  noStroke();
  rect(0, 0, width, height);
  noStroke();  


  for (int i = 0  ; i < posicoes.length ; i++) {

    float distancia = dist(posicoes[i].x, posicoes[i].y, mouseX, mouseY );

    stroke(#FF0000 );
    ellipse(posicoes[i].x, posicoes[i].y, distancia/9, distancia/9);


    if (distancia<300) {
      strokeWeight(0.15);
      line(posicoes[i].x, posicoes[i].y, mouseX, mouseY);
    }
  }


  {
  }
  strokeWeight(0.5);
  stroke(#ffffff, 30);
  //quadrado em Loop reactivo ao Som
  rect(mouseY, y, volume, posX);  
  y = y - 1; 
  if (y < 0) { 
    y = volume;
  } 
  strokeWeight(1);
  stroke(#ffffff);
  ellipse(mouseX, y, volume, volume);  
  y = y - 1; 
  if (y < 0) { 
    y = height;
  } 
  ellipse(mouseX, mouseY, volume, volume);


  // movimentar
  for (int i = 0  ; i < posicoes.length ; i++) {

    posicoes[i].x += (int) random (-5, 5);
    posicoes[i].y += (int) random (-5, 5);
  }
}
void mousePressed() {
  {
    saveFrame("Tripledesign2014-######.png");
    background(0);
  }
}
