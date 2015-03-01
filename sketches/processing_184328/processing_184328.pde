
int total = 30;

float[] posX = new float[total];
float[] posY = new float[total];
float[] velX = new float[total];
float[] velY = new float[total];
float[] mida = new float[total];


void setup() {
  size(500, 500);
  for (int i=0; i<total; i++) {
    mida[i] = 100;
    posX[i] = random(mida[i]/2, width-mida[i]/2);
    posY[i] = random(mida[i]/2, height-mida[i]/2);
    velX[i] = random(-4, 4);
    velY[i] = random(-4, 4);
    
  }
}
void draw() {
  //background(255);
 
 //actualització
  for (int i=0; i<total; i++) {
    posX[i] += velX[i];
    posY[i] += velY[i];
    //float col = random(255);
    
    //cos
    fill(random(255), random(255), random(255));
    noStroke();
    ellipse(posX[i], posY[i], mida[i], mida[i]/1.5);
    ellipse(posX[i], posY[i]+30, mida[i], mida[i]/1.5);
    ellipse(posX[i]+45, posY[i]+45, mida[i]/3, mida[i]/5);
    ellipse(posX[i]-45, posY[i]+45, mida[i]/3, mida[i]/5);
    
    //ulls i boca sz/5
    fill(00);
    noStroke();
    ellipse(posX[i]-15,posY[i],mida[i]/10,mida[i]/5);
    ellipse(posX[i]+20,posY[i],mida[i]/10,mida[i]/5);
    ellipse(posX[i],posY[i]+20,mida[i]/10,posY[i]/30);
    
    
    if (posX[i]<0+mida[i]/2 || posX[i]>width-mida[i]/2) {
      velX[i] = -velX[i];
    }
    if (posY[i]<0+mida[i]/2 || posY[i]>height-mida[i]/2) {
      velY[i] = -velY[i];
    }  
  }
}
 
void mousePressed() {
 background(random(255),random(255),random(255));
 
  for (int i=0; i<total; i++) {
    posX[i] = mouseX;
    posY[i] = mouseY;
    //mida[i] = 80;
  }
}



