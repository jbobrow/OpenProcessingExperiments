
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

//DIBUIXA FONS!

void dibuixafons(){
 
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
}
 
//posicionaelement! 
 
void posiciona_element(float pX, float pY){
    
  //dibuix
    float brX=50;
    float brY=20;
    int a=#0A93FF;
    int b=#894C0F;
 
    //canvi de color segons quadrant
 
    if ((pX<width/2)||(pY>height/2)) {
      fill(a);
    }
    else {
      fill(b);
    }
 
 
    noStroke();
    rect(pX-30, pY-50, 60, 100);
    ellipse(pX, pY-50, 60, 70);
 
    //braços
    ellipse(pX+25, pY-10, brX, brY);
    ellipse(pX-25, pY-10, brX, brY);
 
    //cosa blanca cos
    stroke(255);
    strokeWeight(15);
    line(pX-23, pY+48, pX+23, pY+48);
 
    //agarre 
    noStroke();
    stroke(108, 69, 7);
    fill(108, 69, 7);
    rect(pX-5, pY+55, 8, 40);
    ellipse(pX-1, pY+95, 8, 20);
 
    //cara
    noFill();
    strokeWeight(3);
    stroke(255);
    ellipse(pX, pY-35, 10, 20);
 
    if ((pX<width/2)||(pY>height/2)) {
      fill(a);
    }
    else {
      fill(b);
    }
 
    noStroke();
    rect(pX-30, pY-55, 50, 20);
 
 
    fill(0);
    strokeWeight(2);
    stroke(255);
    ellipse(pX+10, pY-50, 8, 20);
    ellipse(pX-10, pY-50, 8, 20);
}

//actualitzaposicio!

void actualitza_posicio (int num_element){
      
  //límits 
    if (pX[num_element] + 50 > width) {
      vX[num_element] = -vX[num_element];
      pX[num_element] = width -50;
    }
    if (pX[num_element]-50 <0) {
      vX[num_element] = -vX[num_element];
      pX[num_element] = 50;
    }
    //eix Y
    if (pY[num_element] + 110 > height) {
      vY[num_element] = -vY[num_element];
      pY[num_element] = height -110;
    }
    if (pY[num_element]-80 <0) {
      vY[num_element] = -vY[num_element];
      pY[num_element] = 80;
    }
}
   
void draw(){
  
dibuixafons();

for (int i = 0; i<gelatohs; i++) {
posiciona_element(pX[i], pY[i]);
    pX[i] += vX[i];
    pY[i] += vY[i];
actualitza_posicio(i); 
}
}


