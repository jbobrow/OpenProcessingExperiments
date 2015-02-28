
int N = 32;  //el número de elementos en mi arreglo será 10, del 0 al 9
int Z = 255;

float [] posX = new float [N]; //tipo de dato, los corchetes indican q se trata de un arreglo
float [] posY = new float [N];
float [] incX = new float [N];
float [] incY = new float [N];

float [] c1 = new float [Z];
float [] c2 = new float [Z];
float [] c3 = new float [Z];


//_______

void setup (){
size (800,400);
background (255);

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


// _________
void draw () {
  background (255);
  
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


