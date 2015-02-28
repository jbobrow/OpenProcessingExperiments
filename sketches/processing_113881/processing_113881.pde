
PFont fuente;
String texto="TIEMPO";



PImage raton;
PImage gato;

int xspeed=4;
int yspeed=2;

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

     
     for(i=60; i<=1000; i=i+20);
bezier(i,i,bolaX,130,bolaY,630,bolaX/i,1000);
bezier(1000,i,bolaX/4,130,bolaY,630,bolaX/i,60);
bezier(10,i,bolaY/4,130,palaX,630,bolaX/i,500);
bezier(400,20,bolaX/2,130,palaY*2,630,700,100);
bezier(800,200,bolaX/2,530,bolaY*2,630,1000,600);
bezier(10,i,bolaY/4,130,bolaX,630,bolaX/i,500);

    raton= loadImage("mouse.png");
    image(raton,bolaX, bolaY);
    
   gato= loadImage("cat.png");
    image(gato,palaX, palaY); 
    
    bolaX=mouseX;
    bolaY=mouseY;
    
    margenXizq=bolaX-60;
    margenXder=bolaX+85; 
    
    margenYarr=bolaY-70;
    margenXabajr=bolaY+90;

    if(bolaX>=1000){bolaX-=10;}
  if(bolaX<=35){bolaX+=10;}
  if(bolaY>=738){bolaY-=10;}  
   if(bolaY<=20){bolaY+=10;}
  
  fill(0,255,0);
    if (keyPressed) {
    if(key == 'w'){
      palaY-=20; }else if (key== 'z'){
      palaY +=20;}
}
  if (keyPressed) {
    if(key == 'a'){
      palaX-=20;
    }else if (key== 's'){
      palaX +=20;
    }
  }
if(palaX>=1000){palaX-=20;}
  if(palaX<=35){palaX+=20;}
  if(palaY>=738){palaY-=20;}  
   if(palaY<=20){palaY+=20;}
     
  
 if (palaX > margenXizq & palaX < margenXder &
 palaY>margenYarr & palaY<margenXabajr){
  background(random(255),(random (255)),(random (255)));
println ("ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM ÑAM");
nam=nam+1;
println(nam);fill(255,0,0);

for(int n=0; n<=7000; n=n+1){

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
  
 
    



