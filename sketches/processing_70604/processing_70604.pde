
float a;
float a2;
float a3;
float a4;
float a5;

float b;
float b2;
float b3;
float b4;
float b5;
 
int azul;
int negro;
int rojo;
int amarillo;
int verde;
 
void setup(){
    size(800,600);
    smooth();
    noFill();
    strokeWeight(5);
   
   
  a=800;
  a2=800;
  a3=800;
  a4=800;
  a5=800;

  b=600;
  b2=600;
  b3=600;
  b4=600;
  b5=600;
 
  azul=0;
  rojo=0;
  amarillo=0;
  negro=0;
  verde=0;
 
}
  
void draw(){ 
    background(50);
    
  a= int(random(20,800));
  b= int (random(10,600));
  a2= int(random(20,800));
  b2= int (random(10,600));
  a3= int(random(20,800));
  b3= int (random(10,600));
  a4= int(random(20,800));
  b4= int (random(10,600));
  a5= int(random(20,800));
  b5= int (random(10,600));
    
//------------------(CIRCULOS)-----------------------------  

   if((a!=200) && (b!=250) && (azul!=1)) {
     
     stroke(0,0,255);
     ellipse(a ,b ,150,150);
   }
      
     else{
       stroke(0,0,255);
       ellipse(200 ,250,150,150);
       azul=1;
   }
      
//----------------------------------------------------------     
     
     if((a!=380) && (b!=250) && (negro!=1)) {
     stroke(0);
     ellipse(a2 ,b2 ,150,150);
   }
    
   else{
       stroke(0);
       ellipse(380 ,250,150,150);
       rojo=1;      
   }
    
//-----------------------------------------------------------

    if((a!=560) && (b!=250) && (rojo!=1)) {
     stroke(255,0,0);
     ellipse(a3,b3 ,150,150);
   }
    
   else{
       stroke(255,0,0);
       ellipse(560 ,250,150,150);
       amarillo=1;
   }
 
//------------------------------------------------------------

if((a!=290) && (b!=340) && (amarillo!=1)) {
     stroke(230,230,0);
     ellipse(a4,b4 ,150,150);
   }
    
   else{
       stroke(230,230,0);
       ellipse(290 ,340,150,150);
       negro=1;
   }  
    
//------------------------------------------------------------

 if((a!=470) && (b!=340) && (verde!=1)) {
     stroke(0,200,0);
     ellipse(a5,b5 ,150,150);
   }
    
   else{
       stroke(0,200,0);
       ellipse(470 ,340,150,150);
       verde=1;
   }
    
}


