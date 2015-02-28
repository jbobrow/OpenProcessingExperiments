
PFont fuente;
String texto="TIEMPO";



PImage raton;
PImage gato;

int xspeed=60;
int yspeed=35;

int bolaX;
int bolaY;

int palaX;
int palaY;

int margenXizq;
int margenXder;

int margenYarr;
int margenXabajr;

int times;
int nam;
int n=0;
int i;
int t;

void setup() {
  size(1024,768);
  background(75);
  frameRate(120);
  smooth ();
  imageMode(CENTER);

fuente=loadFont("fuenterl.vlw");


  
   bolaX=30;
 bolaY=300;
 
 palaX=1000;
palaY=700;
}
  
  void draw() {
     background(75);
     
     for(i=60; i<=1000; i=i+50){
bezier(i,768,bolaX,130,bolaY,630,bolaX,1000);
bezier(i,0,bolaX,130,bolaY,630,bolaX,0);
}
 for(int v=30; v<=700; v=v+30){
   bezier(0,v,bolaX/2,75,450,bolaY,250,bolaY/2);
 bezier(1024,v,bolaX/2,75,450,bolaY,1024,bolaY/2);}


    raton= loadImage("mouse.png");
    image(raton,bolaX, bolaY);
    
   gato= loadImage("cat.png");
    image(gato,palaX, palaY); 
    
    bolaX-=xspeed;
    bolaY-=yspeed;
    
  margenXizq=bolaX-60;
    margenXder=bolaX+85; 
    
    margenYarr=bolaY-70;
    margenXabajr=bolaY+90;

      if(bolaX>=width-15 || bolaX<=15){
    xspeed*=-1; }
  if (bolaY>=height-15 || bolaY<=15){
    yspeed*=-1; }
  
  fill(0,255,0);
    if (keyPressed) {
    if(key == 'w'){
      palaY-=4; }else if (key== 'z'){
      palaY +=4;}
}
  if (keyPressed) {
    if(key == 'a'){
      palaX-=4;
    }else if (key== 's'){
      palaX +=4;
    }
  }
if(palaX>=1000){palaX-=10;}
  if(palaX<=35){palaX+=10;}
  if(palaY>=738){palaY-=10;}  
   if(palaY<=20){palaY+=10;}
     
  
 if (palaX > margenXizq & palaX < margenXder &
 palaY>margenYarr & palaY<margenXabajr){
  background(random(255),(random (255)),(random (255)));
println ("ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM");
nam=nam+1;
println(nam);fill(255,0,0);

for(int n=0; n<=9000; n=n+1){

text("ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM",360,height/2);
}
 }
  text(texto,10,20);
  text(t,60,20);
  
  times=times+1;
  t=times/30;
  println("times");
 println(times);
   }  
  
 
    



