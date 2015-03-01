
float mida = 40;
float posicioX = 100;
float posicioY= 100;
float velocitatX = 2;
float velocitatY = 2;
  
void setup (){
  size(600,400);
  background (0);
}

void draw (){

 //bola
  ellipse(posicioX, posicioY, mida, mida);
  posicioX= posicioX + velocitatX;
  posicioY=posicioY + velocitatY;
 
  //rebot
  if(posicioX>=width||posicioX<=0){
    velocitatX=-velocitatX;
  }
  if(posicioY>=height || posicioY<=0){
    velocitatY=-velocitatY;
  }
 
  //rebotar per l'extrem
  if(posicioX+mida/2>width||posicioX-mida/2<=0){
    velocitatX=-velocitatX;
  }
  
  if(posicioY+mida/2>height||posicioY-mida/2<=0){
    velocitatY=-velocitatY;
  }
  
}

void mousePressed (){
   posicioX=mouseX;
   posicioY=mouseY;
   velocitatX = random(-4,10);
   velocitatY = random (-6, 14);
   fill (random (255), random(255), random(255));
   mida = random (30,60);
   
  }
