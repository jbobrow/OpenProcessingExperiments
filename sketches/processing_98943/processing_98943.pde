
//Barbara Cornudella

int quadrats=2;

float[] pX=new float [quadrats];
float[] pY=new float [quadrats];
float[] vX=new float [quadrats];
float[] vY=new float [quadrats];

void setup (){
 size(600,600);
 frameRate (2);
 noStroke ();

 for (int i = 0; i< quadrats; i++){
  posiciona_element (pX[i], pY[i]);
  actualitza_posicio (i);
 } 
}

void draw(){
  dibuixa_fons();
  
  for (int i = 0; i <quadrats; i++){
    posiciona_element (pX[i],pY[i]);
    actualitza_posicio (i);
  }
}

void dibuixa_fons(){
  background (67,8,250);
  fill(64,149,53);
  for (int i = 0; i < height; i = i + 20){ 
   strokeWeight (2);
   stroke (i,150,30);
   line(0, i, width, i);
  }
}

void posiciona_element (float pX, float pY){
  for (int i = 0; i <20; i = i + 1){
   
  noStroke();
  fill (33,32,121);
  rect (random (width), random (height),random  (100),random (100));
  }
}

void actualitza_posicio (int i ){
  pX[i] = vX[i];
  pY[i] = vY[i];
  if (pX[i] <0 || pX[i] > width){
    vX[i] = -vX[i];
  }
  if (pY[i] <0 || pY[i] > height){
    vY[i] = -vY[i];
  }
}


