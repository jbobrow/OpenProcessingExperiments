
//SKETCH BY ANTONIO GARCÍA CANCINO SEPT-NOV 2009
//UNIVERSIDAD ANÁHUAC MÉXICO NORTE, ESCUELA DE ARQUITECTURA
//MEDIOS DIGITALES ALTERNATIVOS, ARQ EMMANUEL RUFFO CALDERÓN


import ddf.minim.*;

AudioPlayer player;
Minim minim;


void setup (){
  size(800,600,P3D);
  background(255);
  frameRate(60);
  
  minim = new Minim(this);


  player = minim.loadFile("cancionfinal.mp3", 2048);
  player.play();
  
}

//VARIABLES

float cx, cy, cvx, cvy;
float size;
int i,j;
int aumento=4;
int r1=255;
int g1=255;
int b1=255;
int r2=230;
int g2=230;
int b2=240;
int r3=240;
int g3=240;
int b3=240;
int transp=1;





//VOID DRAW

void draw(){
  background(255);
  
size=dist(i,j,cvx,cvy);
 
 fill(#FFF586,100);

 
 
 transp=transp+1*aumento;

 
 stroke(#000000,220);
 noFill();
 // fill(r,g,b,transp);
   if (transp>=255) {
        aumento*=-1;
   }
        else if (transp<=0){
          aumento*=-1;
        }
      /*  if (transp>=200)       
  {
    r=int (random(255));
    g=int (random(255));
    b=int (random(255));

   }
   else if (transp==150||transp==50||transp==100)
   {
    r=int (random(255));
    g=int (random(255));
    b=int (random(255));
   }
   */
   
      
  for (int i=0; i<800; i=i+13){
    for(int j=0; j<600; j=j+13){
      rect(i,j,10,10);
     
    }
  }
  
 

      
   
  //cubo
  
   strokeWeight(5);
   
   cx=10;
   cy=10;
   
   cvx=cx+1*cvx;
   cvy=cy+1*cvy;
  
  translate(width/2,height/2,-width-300);
  rotateY(map(cvx,0,width,-PI,PI));
  rotateX(map(cvy,0,height,PI,0));
  lights();
  stroke(#FFFFFF,15);
  noFill();
  for(int ancho=0;ancho<100;ancho=ancho+20){
    for(int alto=0;alto<100;alto=alto+20){
      for (int largo=0;largo<100;largo=largo+20){
  box(ancho*transp,alto*transp,largo*transp);
      }}}
  translate(width/4,height/4+50,200);
    fill(r1,g1,b1,100);
  box(400,400,(400*transp/100+50));
  translate(-width/2,-height/2-100,-400);
    fill(r2,g2,b2,100);
  box(400,(400*transp/100),400);
  translate(0,0,400);
    fill(r3,g3,b3,100);
  box((400*transp/100-45),400,400);
  translate(width/2,0,0);
    fill(r1,g1,b1,100);
  box(400,400,(400*transp/100+100));
  translate(0,400,-width/2);
   fill(r2,g2,b2,100);
  box(400,(400*transp/100+80),400);
  translate(-width/2,0,width/2);
    fill(r3,g3,b3,100);
  box(400*transp/100,400,400);
  translate(0,0,-width/2);
    fill(r1,g1,b1,100);
  box(400,400,(400*transp/100)-100);
  translate(width/2,-400,0);
   fill(r2+1*aumento,g2+1*aumento,b2+1*aumento,120);
  box(400,(400*transp/100)+200,400);
  
  
 if (transp>=255)
 {
    r1=int (random(255));
    g1=int (random(255));
    b1=int (random(255));

   }
   else if (transp<=0)
   {
    r1=int (random(255));
    g1=int (random(255));
    b1=int (random(255));
   }

   if (transp>=255)
 {
    r2=int (random(230));
    g2=int (random(230));
    b2=int (random(230));

   }
   else if (transp<=0)
   {
    r2=int (random(230));
    g2=int (random(230));
    b2=int (random(230));
   }
  if (transp>=255)
 {
    r3=int (random(240));
    g3=int (random(240));
    b3=int (random(240));

   }
   else if (transp<=0)
   {
    r3=int (random(240));
    g3=int (random(240));
    b3=int (random(240));
   }

  

   
 }
 




