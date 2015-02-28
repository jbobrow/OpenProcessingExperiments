
int aroY;
int aroX;
 
int rojo=0;
int verde=0;
int azul=0;
int negro=0;
int amarillo=0;
 
void setup(){
  size(500,500);
  smooth();
  background(255);
   
   
 
}
 
void draw(){
   
   aroX = int(random(500));
   aroY = int(random(500));
    
  
   
   background(255);
  
  strokeWeight(10);
  noFill();

   
 //ARO ROJO
 stroke(237,28,36);
if ((aroX!=340) && (aroY!=100) && rojo!=1){
  ellipse(aroX,aroY,100,100);
}
else{
  ellipse(340,100,100,100);
  rojo=1; 
 }
  
  
 //ARO VERDE
 stroke(5,242,63); 
 if ((aroX!=280) && (aroY!=140)&& verde!=1){
  ellipse(aroX,aroY,100,100);
}
else{
  ellipse(280,140,100,100);
  verde=1;
 }
  
  //ARO NEGRO
 stroke(0); 
 if ((aroX!=220) && (aroY!=100) && negro!=2){
   
  ellipse(aroX,aroY,100,100);
}
else{
 
  ellipse(220,100,100,100);
 
  negro=2;
 }
  
  //ARO AMARILLO
 stroke(255,242,63); 
 if ((aroX!=160) && (aroY!=140)&& amarillo!=1){
  ellipse(aroX,aroY,100,100);
}
else{
  
  ellipse(160,140,100,100);
  amarillo=1;
 }
  
 //ARO AZUL 
  stroke(0,39,255); 
 if ((aroX!=100) && (aroY!=100)&& azul!=1){
  ellipse(aroX,aroY,100,100);
}
else{
  
  ellipse(100,100,100,100);
  azul=1;
 }
 
 
}
