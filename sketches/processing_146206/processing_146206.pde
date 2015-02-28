
/*
 Autor: Roberto Plà Díaz
 SE-4 Informática
 2º GEDI ELISAVA
 */

int numBoles = 30;

//creem una matriu de posicionsX con "numBoles" elements:
float[] posicionsX = new float[numBoles];
//el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//i per velocitatsX:
float[] velocitatsX = new float[numBoles];
//i velocitatsY:
float[] velocitatsY = new float[numBoles];
// i per color 
color[]colorpilota=new color [numBoles];

void setup(){
  size(500,500);
  //inicialitzem posicions i velocitats:
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = random(width/2-100, width/2+100);
    posicionsY[i] = random(width/2-100, width/2+100);
    velocitatsX[i] = random(1,3);
    velocitatsY[i] = random(1,3);
    colorpilota[i] = color(random(255), random(255), random(255));
  }
  
}

void draw(){
  background(0);

  //iniciem un bucle perque faci les mateixes accions
  //a tots els valors de les matrius
  for(int i = 0; i<numBoles; i++){
    //actualitzem posicions
    posicionsX[i] += random(-6,6);
    posicionsY[i] += random(-6,6);
 
    //comprobem limits X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    }
    //comprobem lmits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
  
   //i dibuixem
    stroke(posicionsX[i],posicionsY[i] , 100);
    strokeWeight(2);
   
    fill(0);
    ellipse(posicionsX[i]-20,  posicionsY[i]-17, 33, 27); //Orejas
    ellipse(posicionsX[i]+20,  posicionsY[i]-17, 33, 27);
   
   
    ellipse(posicionsX[i],  posicionsY[i], 32, 32);//Cabeza
     
   
    arc(posicionsX[i],  posicionsY[i], 29, 29, 0.08, 3.06); //Boca
    arc(posicionsX[i],  posicionsY[i]+1, 29, 2, 0.08, 3.06);
   
    fill(colorpilota[i]);
    
    ellipse(posicionsX[i]-8.5,  posicionsY[i]-4, 10, 10); //Ojos
    ellipse(posicionsX[i]+8.5,  posicionsY[i]-4, 10, 10);
  }
}

void mousePressed(){

numBoles = 10;
}
