
PImage katara;

int total = 100;
float [] posX = new float[total];
float [] posY = new float[total];
float [] velX = new float[total];
float [] velY = new float[total];

float sz = 5;

/* @pjs preload="katara.jpg"; */

void setup() {
  size(720, 1017);
  katara = loadImage ("katara.jpg");
  
  background (0);
  image (katara, 0,0, width, height);
  
    //posició inicial
  for (int i=0; i<total; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i]= random(-5, 0);
    velY[i]= random(-5, 0);
  }
}


void draw() {

  fill(0, 20);
  noStroke();

  fill (random (255), random (255), 255, 50);


  //actualizació
  for (int i=0; i<total; i++) {
    posX[i] = posX[i] + velX[i];
    posY[i] = posY[i] + velY[i];

    noStroke();
    ellipse(posX[i], posY[i], sz, sz);

    //rebots
    if ((posX[i] > width)||(posX[i] < 0)) {
      velX[i] = -velX[i]/2;
    }

    if ((posY[i] > height)||(posY[i] < 0)) {
      velY[i] = -velY[i]/2;
    }
  }
}


//AGAIN
void mousePressed() {
  for (int i=0; i<total; i++) {
    posX[i] = mouseX;
    posY[i] = mouseY;
  }
}


