
float colR = 255;
float colG = 0;
float colB = 0;
float linia1 = 255;
float linia2 = 255;
float linia3 = 255;
float dia = 70;
int quantitat = 25;
float [] posX = new float [quantitat];
float [] posY = new float [quantitat];
float [] velX = new float [quantitat];
float [] velY = new float [quantitat];

float forma = 1;

  void setup() {
  size(700, 500);
  for (int i =0; i<quantitat; i++) {
    posX[i] = width/3;
    posY[i] = height/3;
    velX[i] = random (3,8);
    velY[i] = random (3,8);
  }
  }
  
  void draw() {
    background(0);
  for (int i=0; i<quantitat; i++) {
    
    posX[i] = posX[i] + velX[i];
    posY[i] = posY[i] + velY[i];
  
    fill(colR, colG, colB);
    stroke(linia1, linia2, linia3);
    
    if (forma == 1) {
      ellipse(posX[i], posY[i], dia, dia);
    } else if (forma == 2) {
      line(posX[i]-dia, posY[i]-dia,posX[i]+dia,posY[i]-dia);
      line(posX[i]-dia, posY[i]+dia,posX[i]+dia,posY[i]+dia);
      line(posX[i]-dia, posY[i]-dia,posX[i]-dia,posY[i]+dia);
      line(posX[i]+dia, posY[i]-dia,posX[i]+dia,posY[i]+dia);
    }
    
  
    if (posX[i]>= width-dia/2) {
      velX[i] = -velX[i];
    }
    if (posY[i]>= height-dia/2) {
      velY[i]= -velY[i];
    }
    if (posX[i]<dia/2) {
      velX[i] = -velX[i];
    }
    if (posY[i]<dia/2) {
      velY[i] = -velY[i];
    }
  }
  }
  
  void mousePressed() {
    colR = random(255);
    colG = random(255);
    colB = random(255);
    linia1 = random(255);
    linia2 = random(255);
    linia3 = random(255);
    dia = random(5,20);
    
    for (int i=0; i<quantitat; i++) {
    velX[i] = random(-10, 10);
    velY[i] = random(-15, 15);
    }
    
    if (forma == 1) {
      forma = 2;
    } else if (forma == 2) {
      forma = 1;
    }
    mouseReleased();
  }
