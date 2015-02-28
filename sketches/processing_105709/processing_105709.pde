
//100balls


int siz = 30;
int numElements = 100;
float posX[] = new float[numElements];
float posY[] = new float[numElements];
float velX[] = new float[numElements];
float velY[] = new float[numElements];

void setup () {
  size (800,600);
  
  for (int i = 0; i < numElements; i++ ){
    posX[i] = int ( random(100, width-100) );
    posY[i] = int ( random(100, height-100) );
    velX[i] = int ( random(1, 4) );
    velY[i] = int ( random(3, 9) );
  }    
}

void draw () {
  
  background(100);
  noStroke ();
  fill(20,30,50,80);
  
  for (int i=0; i < numElements; i++) {
    ellipse(posX[i], posY[i], siz, siz);
    
   if (posX[i] > width || posX[i] < 0 ) {
     velX[i] = velX[i] * -1;
   }
   
   if (posY[i] > height || posY[i] < 0 ) {
     velY[i] = velY[i] * -1;
   }
   posX[i] = posX[i] + velX[i];
   posY[i] = posY[i] + velY[i];
  }
}
