
/*
 Autor: Joan Soler-Adillon (www.joan.cat)
 Tutorial de Processing: Condicionals
 */

int sz = 9;
int numeroBoles = 200;

//creem un array de posicionsX amb "numeroBoles" elements:
float[] posicionsX = new float[numeroBoles];
//creem un array de posicionsY:
float[] posicionsY = new float[numeroBoles];
//creem un array de velocitatsX amb "numeroBoles" elements:
float[] velocitatsX = new float[numeroBoles];
//creem un array de velocitatsY:
float[] velocitatsY = new float[numeroBoles];

void setup(){
  size(400,350);
  frameRate(30);
  //inicialitzem les posicions i velocitats:
  for(int i = 0; i<numeroBoles; i++){
    posicionsX[i] = int(random(width));
    posicionsY[i] = int(random(height));
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }
  noStroke();
}

void draw(){
  //background(0);
  colorMode(RGB,255);
  fill(255,25);
  rect(0,0,width,height);


    //actualitzem les posicions
  for(int i = 0; i<numeroBoles; i++){
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];


    //comprobem els l�mits X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    } 
       //comprobem els l�mits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    } 
  }


  //dibuixem les elipses:
  for(int i = 0; i<numeroBoles; i++){
    colorMode(HSB,numeroBoles);
    fill(i,i,i);
    ellipse(posicionsX[i],posicionsY[i],sz,sz);
  }
}

void mousePressed(){
  //reinicialitzem velocitats:
  for(int i = 0; i<numeroBoles; i++){
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }
}


