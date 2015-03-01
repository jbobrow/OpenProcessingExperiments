
int mat =50;
float bola = 20;
float [] posX = new float [mat];
float [] posY = new float [mat];

float [] velX= new float [mat];
float [] velY = new float [mat];


void setup () {
  size(500, 500);
  noSmooth();

  for (int i= 0; i<mat; i++) {
    posX [i]= width/2;
    posY[i] = height/2;
    velX[i]= random (-10, 10);
    velY[i]= random (-10, 10);
  }
}


void draw() {
background(255);
noStroke();
colorMode(HSB);
fill(23,100,255);

  for (int i= 0; i< posX.length; i++ ) { 
    posX[i] = posX [i] + velX[i];
    posY [i] = posY [i] + velY[i];
    ellipse(posX[i], posY[i], bola, bola);

    if ((posX [i] >= width)||(posX [i] <= 0)) { 
      velX [i] = -velX[i];
    }
    if ((posY [i] >= width)||(posY [i] <= 0)) { 
      velY[i] = -velY[i];
    }
  
  }
}


  void mousePressed() {
    for(int i = 0; i<50;i++){
      posX[i]= mouseX;
      posY[i] = mouseY;
    }
  }
