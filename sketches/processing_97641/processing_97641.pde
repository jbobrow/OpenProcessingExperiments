

float tamano;
int sz = 40;
int sn = 30;
int nBoles = 20;


// creem posicions de X i Y i de de les velocitats X i Y:
float[]posX=new float[nBoles];
float[]posY=new float[nBoles];
float[]velX=new float[nBoles];
float[]velY=new float[nBoles];


void setup(){
size(600,600);
//definim les posicions i les velocitats:
for(int i=0; i<nBoles; i++){
  posX[i]=width;
  posY[i]=height;
  velX[i]= random(1,5);
  velY[i]= random(1,5);

}
}

void draw(){
background(229,72,127);

// dibuixem el fons:
//linies horitzontals  
for( int i=0; i<height; i= i+10){
  stroke(16,144,157);
strokeWeight(3);
    tamano=random(600);
    line(0,i,i,i);
  }
//linies verticals
for( int i=0; i<width; i= i+10){

    tamano=random(600);
    line(i,0,i,i);
  }
//linia en diagonal
for( int i=0; i<width; i= i+10){
  strokeWeight(6);
    stroke(42, 76, 131);
    tamano=random(600);
    line(i,i,700,700);
  }

//iniciem les repeticons
for(int i=0; i<nBoles; i++){
  //actualitzem posicions
  
  posX[i]+=velX[i];
  posY[i]+=velY[i];
  
  if((posX[i]<0)||(posX[i]>width)){
    velX[i]=-velX[i];
  }
  if((posY[i]<0)||(posY[i]>height)){
    velY[i]=-velY[i];
  }
  
  //dibuxem el cos en moviment
  stroke(0);
  strokeWeight(1);
  fill(71,98,242,0);
  ellipse(posX[i],posY[i],sz,sz);
  fill(206,17,39);
  ellipse(posX[i],posY[i],sn,sn);
  
}

}



