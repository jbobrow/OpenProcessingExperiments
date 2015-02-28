


int black = 600;        //
int colourred = 200;
int canvasX = 500;                        
int canvasY = 1000;
int frameX = 700;
int frameY = 1200;
float inc = 0.002;    

 
float[] ptsX = new float[black];           
float[] ptsY = new float[black];           
float[] posX = new float[black];           
float[] posY = new float[black];  

float[] ptsA = new float[colourred];           
float[] ptsB = new float[colourred];           
float[] posA = new float[colourred];           
float[] posB = new float[colourred];
 
void setup() {
  size(canvasX, canvasY);
  smooth();
  noLoop();
  for (int i = 0; i < black; i++) {
    ptsX[i] = random(-50, frameX);          
    ptsY[i] = random(-50, frameY);          
    posX[i] = ptsX[i];                     
    posY[i] = ptsY[i];  

    for (int h = 0; h < colourred; h++) {
      ptsA[h] = random(-50, frameX);          
      ptsB[h] = random(-50, frameY);          
      posA[h] = ptsX[h];                     
      posB[h] = ptsY[h];    
    }
  }
}
 
void draw(){
  background(255); 
  stroke(0,0,0);
  strokeWeight(1);
  
  for (int i = 0; i < black; i++) {}
  for (int i = 0; i < black-1; i++) {
    for (int j = i; j < black; j++) {
      if (dist(posX[j], posY[j], posX[i], posY[i]) < 120) {
        line(posX[j], posY[j], posX[i], posY[i]);
      }
    }
  }
  
  stroke(209,36,36);
  strokeWeight(1);
  for (int h = 0; h < colourred; h++) {}
  for (int h = 0; h < colourred-1; h++) {
    for (int k = h; k < colourred; k++) {
      if (dist(posA[k], posB[k], posA[h], posB[h]) < random(70,100)) {
        line(posA[k], posB[k], posA[h], posB[h]);
      }
    }
  }
}


