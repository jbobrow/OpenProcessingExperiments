


int gelatohs = 10;

//matriu
float[] pX = new float[gelatohs];
//el mateix per pY[i]:
float[] pY = new float[gelatohs];
//i per vX:
float[] vX = new float[gelatohs];
//i vY:
float[] vY = new float[gelatohs];

void setup() {

  size(500, 600);

  //les posicions + velocitats
  for (int i = 0; i<gelatohs; i++) {
    pX[i] = width/2;
    pY[i] = height/2;
    vX[i] = random(0, 5);
    vY[i] = random(0, 5);
  }
}

void draw() {

  //inici background

  background(#FFA51C);
  noStroke();
  //bucles!
  int[] PosicionsBackground= {15, 65, 150, 200, 250, 350, 460,550,690,390};

  for (int i=0; i<PosicionsBackground.length;i++) {
    //groc
    fill(255, 255, 0);
    rect(PosicionsBackground[i]-50, PosicionsBackground[i]-25, 100, 100);
    //lila
    fill(#8440FC);
    rect(190+PosicionsBackground[i], PosicionsBackground[i]-25, 80, 80);
    //rosa.
    fill(#FF3EFC);
    ellipse(115+PosicionsBackground[i], PosicionsBackground[i], 100, 100);
    //blau
    fill(#4BFFD9);
    ellipse(PosicionsBackground[i]-180, PosicionsBackground[i], 100, 100);
    //verd
    fill(#1BF011);
    ellipse(PosicionsBackground[i]-285, PosicionsBackground[i], 100, 100);
  }
  //background 
  
  
  for (int i = 0; i<gelatohs; i++) {

    pX[i] += vX[i];
    pY[i] += vY[i];

    //dibuix

    float brX=50;
    float brY=20;
    int a=#0A93FF;
    int b=#894C0F;

    //canvi de color segons quadrant

    if ((pX[i]<width/2)||(pY[i]>height/2)) {
      fill(a);
    }
    else {
      fill(b);
    }


    noStroke();
    rect(pX[i]-30, pY[i]-50, 60, 100);
    ellipse(pX[i], pY[i]-50, 60, 70);

    //braços
    ellipse(pX[i]+25, pY[i]-10, brX, brY);
    ellipse(pX[i]-25, pY[i]-10, brX, brY);

    //cosa blanca cos
    stroke(255);
    strokeWeight(15);
    line(pX[i]-23, pY[i]+48, pX[i]+23, pY[i]+48);

    //agarre  
    noStroke();
    stroke(108, 69, 7);
    fill(108, 69, 7);
    rect(pX[i]-5, pY[i]+55, 8, 40);
    ellipse(pX[i]-1, pY[i]+95, 8, 20);

    //cara
    noFill();
    strokeWeight(3);
    stroke(255);
    ellipse(pX[i], pY[i]-35, 10, 20); 

    if ((pX[i]<width/2)||(pY[i]>height/2)) {
      fill(a);
    }
    else {
      fill(b);
    }

    noStroke();
    rect(pX[i]-30, pY[i]-55, 50, 20);


    fill(0);
    strokeWeight(2);
    stroke(255);
    ellipse(pX[i]+10, pY[i]-50, 8, 20);
    ellipse(pX[i]-10, pY[i]-50, 8, 20);


    //límits

    if (pX[i] + 50 > width) {
      vX[i] = -vX[i];
      pX[i] = width -50;
    }
    if (pX[i]-50 <0) {
      vX[i] = -vX[i];
      pX[i] = 50;
    }
    //eix Y
    if (pY[i] + 110 > height) {
      vY[i] = -vY[i];
      pY[i] = height -110;
    }
    if (pY[i]-80 <0) {
      vY[i] = -vY[i];
      pY[i] = 80;
    }
  }
}

//info tutorial extret de processing.joan.cat



