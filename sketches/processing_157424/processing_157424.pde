
//::Based in Rioji Ikeda style
//OGOSHI

int posX = 0;
int posY = 0;
int sentidoX = 1;
int sentidoY = 1;

void setup() {
  size(600, 800);
  smooth();
  colorMode(RGB);
  background(0);
  frameRate(250);
}

void draw() {
  float numeroA = random(0, 30);

  // transparency
  fill(0,4);
  noStroke();
  rect(0, 0, width, height);
  stroke(0);

  if (keyPressed) {
    if (key=='z') {

      fill(0);
    } 
    else if (key=='x') {
      fill(255);
    }
  }

  // #1 
  strokeWeight(0.5);
  stroke(255);
  rect(0, 0, posX, posY);
  posX = posX + (0 * sentidoX);
  posY = posY + (5 * sentidoY);

  if (posX > width) {
    sentidoX = -1;
  }
  if (posX < 0) {
    sentidoX = 1;
  }

  if (posY > height) {
    sentidoY = -1;
  }
  if (posY < 0) {
    sentidoY = 1;
  }


  // #2
  strokeWeight(3);
  stroke(255);
  rect(0,posY,800,posY);
  posX = posX + (5 * sentidoX);
  posY = posY + (0 * sentidoY);

  if (posX > width) {
    sentidoX = -1;
  }
  if (posX < 0) {
    sentidoX = 1;
  }

  if (posY > height) {
    sentidoY = -1;
  }
  if (posY < 0) {
    sentidoY = 1;



    //#3 lines
    strokeWeight(0.5);
    stroke(255);
    line(posX, posY, 200, 220);
    posY = posY + 10;


    //pos x e y
    println("valor de posX: " + posX);
    println("valor de posY: " + posY);
  }
}


