
// By Andrew Viny & John Gruen

final int index = 2500;
float[] xPos = new float[index];
float[] yPos = new float[index];
float[] speed = new float[index];
float[] dia = new float[index];
float[] alfa = new float[index];
float[] cNoise = new float[index];
float[] dList = new float[index];
float x=0;
float nInc;
color[] col = new color[index];
//float[] andy = {30,70,130,25,56,37,88}

void setup() {
   size(450,900);
   smooth();
   noStroke();
   nInc = .01;
  for(int i = 0; i < index; i++) {
    xPos[i]  = random(width);
    yPos[i] = random(height);
    dia[i] = random(1,10);
    speed[i] = dia[i]/7;
    alfa[i] = random(120,210);
    cNoise[i] = random(10);
    col[i] = 0;
  }
  
  
}


void draw() {
  background(0);
    for(int i = 0; i < index; i++) {
    fill(col[i],alfa[i]);
    dList[i] = dist(xPos[i],yPos[i],mouseX,mouseY);
    
    if (dList[i] < 50) {
      col[i] = 255;
      stroke(255,0,0);
      fill(255,0,0,alfa[i]);
      dia[i] += .2;
      alfa[i] -= .6;
      line(xPos[i],yPos[i],mouseX,mouseY);
    }
    noStroke();
    ellipse(xPos[i],yPos[i],dia[i],dia[i]);
    xPos[i] += ((noise(cNoise[i]))-.4);
    if (yPos[i] > height + dia[i]/2) {
       dia[i] = random(5,10);
       yPos[i] = -dia[i]/2;
       alfa[i] = random(120,210);
       col[i] = 0;
    }
    if (xPos[i] > width + dia[i]/2) {
       xPos[i] = -dia[i]/2;
    }
    yPos[i]+=speed[i];
    cNoise[i]+=nInc;
    
  }
  
  
}               
