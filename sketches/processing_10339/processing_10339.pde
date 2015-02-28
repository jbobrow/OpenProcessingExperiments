
/*
PROYECTO 01 SESION 4 : Organizando el codigo
 
 Título: Circo caotico
 Nombre: Juan Andres Castaño
 Fecha:  10/06/2010
 Lugar: Barcelona
 Objetivo: Realizar un Sketch que tenga interaccion con el mouse
 Realizar un sketch que: Contenga elementos organizadospor toda la pagina que sean 
iguales pero con propiedades diferentes.
 
 */
//
 
 //Definicion de las variables
 
 int estado,cont;
 int[] x1=new int[500];
 int[] x2=new int[500];
 int[] y1=new int[500];
 int[] y2=new int[500];
 int actualX1,actualY1;
 
 void setup(){
   background(229,229,229);
   size(400,400);
   rectMode(CORNERS);
   estado=0;
   cont=0;
 }
 
 void draw(){
   noStroke();
   rect(0,0,400,400);
   //fill(225,225,225,20);
   
   rect(255,255,255,20);
   line(250,151,151,5);
   line(3,250,231,10);
   
   fill(random(2),random(106),random(188),15);
   
   for(int i=1;i<=cont;i++){        
     ellipse(x1[i],y1[i],x2[i],y2[i]);
   }
   if(estado==1){
     noStroke();
     fill(255,255,255,10);
     ellipse(actualX1,actualY1,mouseX,mouseY);
   }
 }
 
 void mousePressed(){
   if(mouseX>357 && mouseY<25){
     cont=0;
     estado=0;
   }
   else{
     estado=1; 
     actualX1=mouseX; 
     actualY1=mouseY; 
   }
 }
 
 void mouseReleased(){
   if(!(mouseX>357 && mouseY<25)){
     estado=0;
     cont++;
     x1[cont]=actualX1; 
     y1[cont]=actualY1;
     x2[cont]=mouseX;
     y2[cont]=mouseY;
   }
 }   

