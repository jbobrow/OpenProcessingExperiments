
int numBalls = 22;
float [] posicionesX = new float[numBalls]; 
float [] posicionesY = new float[numBalls]; 
int tam = 20;
float [] velocityX = new float[numBalls];
float [] velocityY = new float[numBalls];

void setup() {
  
 size(300,300);
 noStroke();
 background(0);
 for (int i=0; i<numBalls;i++){
   posicionesX[i] = width/2;
   posicionesY[i] = height/2;
   velocityX[i] = random(1,5);
   velocityY[i] = random(1,5); 
 }
 
}

void draw() {
  
  
  
  for ( int i = 0; i<numBalls; i++) {
   posicionesX[i] += velocityX[i];
   posicionesY[i] += velocityY[i];
   
   if ( posicionesX[i]<0 || posicionesX[i] > width ){
     velocityX[i] = - velocityX[i];
   }
    if ( posicionesY[i]<0 || posicionesY[i] > width ){
     velocityY[i] = - velocityY[i];
   }
   
   
  }
  for ( int j = 0; j<numBalls; j++){
   colorMode(HSB, numBalls);
   fill(j,j,j);
   ellipse(posicionesX[j],posicionesY[j],tam,tam); 
  }
  
}


void mousePressed() {
  
   for( int k = 0; k<numBalls ; k++ ) {
   
      background(0);
      posicionesX[k] = mouseX;
      posicionesY[k] = mouseY;
      velocityX[k] = random(1,5);
      velocityY[k] = random(1,5); 
   }
 
 }
  



