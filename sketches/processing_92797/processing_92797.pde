
//rectángulo 1b
int posX1;
int posY1;
int X2;
int Y2; 
int X3;
int X4;
int incX1;
 
//rectángulo 1a
int N = 32;  
int Z = 255;

float [] posX = new float [N]; 
float [] posY = new float [N];
float [] incX = new float [N];
float [] incY = new float [N];

float [] c1 = new float [Z];
float [] c2 = new float [Z];
float [] c3 = new float [Z];


void setup(){
   
   
  background (0);
 
 size (1200,600);
 
  //rectMode(CENTER);
 
 
posX1 = 0;
X2 = 550;
 
X3 = 200;
X4 = 400;
 
 
 incX1 = 1;
 
 //información para rect 1a
 for(int i = 0; i < N; i++){

  posX[i] = random(0,width);
  posY[i] = random(0,height);
  incX[i] = random(0.5,2.5);
  incY[i] = random(0.5,2.5);
  
}


for (int i = 0; i<Z; i++){
  c1[i] = random (0,255);
  c2[i] = random (0,255);
  c3[i] = random (0,255);

}

   
}
 
void draw () {
 //información para rect 1a  
  fill (0,5);
  rect (0,0, 600, height);
 for (int i=0; i <N; i++){
  
    fill (c1[i],c2[i],c3[i]);
    ellipse (posX[i], posY[i], 80,80);
  posX[i] = posX[i] + incX[i];
  posY[i] = posY[i] + incY[i];
  
  if (posX[i] < 0 || posX[i] > width){
  incX[i] = incX[i] * -1;
  }
  
  if (posY[i] < 0 || posY[i] > height){
  incY[i] = incY[i] * -1;
  }
  
  }
 
 

 
 
}


