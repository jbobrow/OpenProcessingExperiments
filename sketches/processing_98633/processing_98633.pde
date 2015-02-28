
//import de les llibreries de so.

var audioElement = document.createElement("audio");

//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;



float tamano;
int sz = 40;
int sn = 30;
int nBoles = 20;
PImage foto;
//int value =0;

// creem posicions de X i Y i de de les velocitats X i Y:
float[]posX=new float[nBoles];
float[]posY=new float[nBoles];
float[]velX=new float[nBoles];
float[]velY=new float[nBoles];

//Minim minim;
//AudioPlayer so;
//AudioOutput out;



void setup(){
size(600,600);
//definim les posicions i les velocitats:
for(int i=0; i<nBoles; i++){
  posX[i]=width;
  posY[i]=height;
  velX[i]= random(1,5);
  velY[i]= random(1,5);
}
foto = loadImage("arale.png");
noCursor();
//minim =new Minim(this);
//so = minim.loadFile("so.mp3");
//out = minim.getLineOut(Minim.STEREO, 2048);
audioElement.setAttribute("src","so.mp3");
}



void draw(){
background(109,72,127);

// dibuixem el fons:
//linies horitzontals  
for( int i=0; i<height; i= i+40){
  for( int j=0; j<width; j= j+40){
  strokeWeight(3);
  stroke(16,144,157);
    tamano=random(600);
    rect(j,i,30,30);
  }
 
}


  

//iniciem les repeticons
for(int i=0; i<nBoles; i++){
  //actualitzem posicions
  
  posX[i]+=velX[i];
  posY[i]+=velY[i];
  
  if((posX[i]<10)||(posX[i]>width)){
    velX[i]=-velX[i];
  }
  if((posY[i]<10)||(posY[i]>height)){
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
//insertar la imatge amb el moviment del mouse.
 image(foto,mouseX,mouseY,100,90);

}
//insertar so quan accionem el mouse.
void mousePressed(){
  //if (value==0){
    audioElement.setAttribute("src", "so.mp3");
    audioElement.play();
   // so.cue(0);
   // so.play();
  }




