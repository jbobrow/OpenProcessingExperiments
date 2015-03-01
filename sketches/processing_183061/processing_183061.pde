
float colR = 255;
float colG = 0;
float colB = 0;
float linia1 = 255;
float linia2 = 255;
float linia3 = 255;
float dia = 70;
float posX = 200;
float posY = 350;
float velX = 8;
float velY = 4;
float forma = 1;

  void setup() {
  size(700, 500);
  }
  
  void draw() {
    background(0);
  
    posX = posX + velX;
    posY = posY + velY;
  
    fill(colR, colG, colB);
    stroke(linia1, linia2, linia3);
    
    if (forma == 1) {
      ellipse(posX, posY, dia, dia);
    } else if (forma == 2) {
      line(posX-dia, posY-dia,posX+dia,posY-dia);
      line(posX-dia, posY+dia,posX+dia,posY+dia);
      line(posX-dia, posY-dia,posX-dia,posY+dia);
      line(posX+dia, posY-dia,posX+dia,posY+dia);
    }
    
  
    if (posX>= width-dia/2) {
      velX = -velX;
    }
    if (posY>= height-dia/2) {
      velY= -velY;
    }
    if (posX<dia/2) {
      velX = -velX;
    }
    if (posY<dia/2) {
      velY = -velY;
    }
  }
  
  void mousePressed() {
    colR = random(255);
    colG = random(255);
    colB = random(255);
    linia1 = random(255);
    linia2 = random(255);
    linia3 = random(255);
    dia = random(60);
    posX = pmouseX;
    posY = pmouseY;
    velX = random(-10, 10);
    velY = random(-15, 15);
    
    if (forma == 1) {
      forma = 2;
    } else if (forma == 2) {
      forma = 1;
    }
    mouseReleased();
  }
