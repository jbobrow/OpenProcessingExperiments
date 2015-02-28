
//P4 RANDOM WALKER BEE


int sz = 20;
int numBoles = 20;
int colorcuerpo = 230;

//creem una MATRIU de posicionsX con "numBoles" elements:
float[] posicionsX = new float[numBoles];
//el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//i per velocitatsX:
float[] velocitatsX = new float[numBoles];
//i velocitatsY:
float[] velocitatsY = new float[numBoles];


void setup(){
  size(800,800);
  //inicialitzem posicions i velocitats de totes les boles:
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = random(width/2-100, width/2+100);
    posicionsY[i] = random(height/2-100, height/2+100);
    // Les velocitats son random, cada una pot anar a una velocitat diferent
    velocitatsX[i] = random(1,3);
    velocitatsY[i] = random(1,3);

  }
}

void draw(){
  background(130, 230, 230);

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
    //comprobem limits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    } 
  
   //i dibuixem
   dibuixarBee(posicionsX[i],posicionsY[i]);
  }
}
void dibuixarBee (float _x, float _y)
  
  {
    int mySz = 10;
    
    //Alas
    noStroke();
    fill (196, 240, 238);
    ellipse(_x-140, _y-15, mySz+50, mySz+40);
    ellipse(_x-60, _y-15, mySz+50, mySz+40);
    
    //Pincho
    stroke (0);
    strokeWeight(2);
    line(_x-100, _y, _x-100, _y+55);
    
    //Cuerpo
    noStroke();
    fill(colorcuerpo);
    ellipse(_x-100, _y, mySz+60, mySz+80);
    
    //Cabeza
    fill(0);
    ellipse(_x-100, _y-45, mySz+40, mySz+35);
    
    //Antenas-Cuerpo
    stroke (0);
    strokeWeight(2);
    line(_x-100, _y-45, _x-80, _y-80);
    line(_x-100, _y-45, _x-120, _y-80);
    
    strokeWeight (8);
    line(_x-69, _y+5, _x-131, _y+5);
    line(_x-75, _y+25, _x-125, _y+25);
    line(_x-73, _y-15, _x-128, _y-15);
    
    noStroke();
    fill(colorcuerpo);
    ellipse(_x-80, _y-80, mySz+1, mySz+1);
    ellipse(_x-120, _y-80, mySz+1, mySz+1);
    
    //Ojos
    fill(255);
    ellipse(_x-110, _y-50, mySz+5, mySz+10);
    ellipse(_x-90, _y-50, mySz+5, mySz+10);
    
    fill(0);
    ellipse(_x-110, _y-50, mySz+1, mySz+4);
    ellipse(_x-90, _y-50, mySz+1, mySz+4);
    
  }
  void mousePressed()
  
  {
    colorcuerpo = color (mouseX, mouseY, 0);
} 



