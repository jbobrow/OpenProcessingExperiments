
int bolas = 20;
int sz = 40;
float [] posX = new float [bolas] ;
float [] posY = new float [bolas];
float [] velX = new float [bolas];
float [] velY = new float [bolas];
PImage tiburon; 






void setup() {

  size (500, 500);
  tiburon=loadImage("tiburon.png");
  imageMode(CENTER); //para que el punto de referencia sea el centro
  for (int i =0; i<bolas; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random (0, 2);
    velY[i] = random (0, 2);
  }
}

void draw () { 
  background (10, 28, 113);
image (tiburon,mouseX,mouseY);



  for (int i=0; i<bolas; i++)
  { 
 posX[i] += velX[i];
 posY[i] += velY[i];
    
    if (posX[i]-(sz/2)<0){
      velX[i]=-velY[i];
      posX[i]=0+(sz/2);
     
    }
    if (posX[i]+sz/2>width){
      velX[i]=-velY[i];
      posX[i]=width-(sz/2); //porque se me estaban saliendo por este lado
      
    }

    if (posY[i]-(sz/2)<0){
    velY[i]=-velY[i];
   posY[i]=0+(sz/2);
  }
  if(posY[i]+(sz/2)>height){
    velY[i]=-velY[i];
    posY[i]=height-(sz/2);
    
  }
  }
  for (int i=0; i<bolas; i++) {
    ellipse (posX[i], posY[i], sz, sz);
    if (posX[i]>mouseX){
      velX[i]=velX[i]-1;}
      else{
    velX[i]=velX[i]+1;}
    
    if (posY[i]>mouseY){
      velY[i]=velY[i]-1;}
      else{
    velY[i]=velY[i]+1;}
    
  }
  
}




