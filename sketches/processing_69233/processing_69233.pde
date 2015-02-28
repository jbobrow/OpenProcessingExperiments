
float a;
float b;
float a2;
float b2;
float a3;
float b3;
float a4;
float b4;
float a5;
float b5;

int azul;
int rojo;
int amarillo;
int negro;
int verde;

void setup(){
  background(250);
    size(800,600);
    smooth();
    noFill();
  strokeWeight(15);
  
  
  a=800;
  b=600;
  a2=800;
  b2=600;
  a3=800;
  b3=600;
  a4=800;
  b4=600;
  a5=800;
  b5=600;

  azul=0;
  rojo=0;
  amarillo=0;
  negro=0;
  verde=0;

}
 
void draw(){  
    background(250);
   
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
   
  
   if((a!=200) && (b!=250) && (azul!=1)) {
    
     stroke(#00BFFF);
     ellipse(a ,b ,150,150);
     
   }
     
     else{
       stroke(#00BFFF);
       ellipse(200 ,250,150,150);
       azul=1;
     
     
   }
     
     
     if((a!=380) && (b!=250) && (rojo!=1)) {
     stroke(#FF0000);
     ellipse(a2 ,b2 ,150,150);
     
   
   }
   
   else{
       stroke(#FF0000);
       ellipse(380 ,250,150,150);
       rojo=1;       
   }
   
    if((a!=560) && (b!=250) && (amarillo!=1)) {
     stroke(#FACC2E);
     ellipse(a3,b3 ,150,150);
     
   
   }
   
   else{
       stroke(#FACC2E);
       ellipse(560 ,250,150,150);
       amarillo=1;
   
   
   
}

if((a!=290) && (b!=340) && (negro!=1)) {
     stroke(0);
     ellipse(a4,b4 ,150,150);
     
   
   }
   
   else{
       stroke(0);
       ellipse(290 ,340,150,150);
       negro=1;

   
}   
   

 if((a!=470) && (b!=340) && (verde!=1)) {
     stroke(#088A29);
     ellipse(a5,b5 ,150,150);
     
   
   }
   
   else{
       stroke(#088A29);
       ellipse(470 ,340,150,150);
       verde=1;
      
      
   } 
   
}
  



