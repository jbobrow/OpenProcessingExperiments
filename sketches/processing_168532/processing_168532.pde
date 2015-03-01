

float posX;
float posY;
float posX2;
float posY2;
float velX;
float velY;
float velX2;
float velY2;
float sz;
float cl;


void setup(){
  size(510,510);
  posX = random(width/6,width/6*5);
  posY = random(height/6,height/6*5);
  posX2 = random(width);
  posY2 = random(height);
  velX = 5;
  velY = 5;
  velX2 = 5;
  velY2 = 5;
  sz = 5;
  cl = random (255);
}

void draw(){
  
  fill(posX/2,posY/2,125,0); // cuadrado del background
  rect(0,0,width,height);
  
  fill(posX/3,posY/3,125,0); // cuadrado del centro
  rect(width/6,height/6,width/6*4,height/6*4);
  
  //vel = random(0,10);
  //vel2 = random(-10,0);
  sz = random(5,20);
    cl = random (255);
  
  noStroke(); //background
 //fill(0,0,0,0);
 //rect(0,0,width,height);


  posX = posX + velX;
  posY = posY + velY;
  
  posX2 = posX2 + velX2;
  posY2 = posY2 + velY2;
  

  
  if(posX-posY<0){ // cambio de elipse a rectangulo (adentro)
  fill(posX/2,posY/2,random(255));
  ellipse(posX,posY,sz,sz);}
  else{fill(posX/2,posY/2,random(255));
  rect(posX-(sz/2),posY-(sz/2),sz,sz);}
  

  
  if((posX+sz)>(width/6)*5){ //paredes de adentro
    velX = random(-10,-2);}
    else{
      if((posX-sz)<width/6){
    velX = random(2,10);}}
    
  if((posY+sz)>(height/6)*5){
    velY = random(-10,-2);}
    else{
      if((posY-sz)<height/6){
    velY = random(2,10);}}
   
      fill(cl,cl,cl);
      ellipse(posX2,posY2,sz*2,sz*2); //ellipse de afuera
      
      
   if(posX2>width){ //paredes de afuera
    velX2 = random(-10,-2);}
    else{
      if((posX2)<0){
    velX2 = random(2,10);}}
    
  if((posY2)>height){
    velY2 = random(-10,-2);}
    else{
      if((posY2)<0){
    velY2 = random(2,10);}}
 
  
}
  void mousePressed (){
    posX=mouseX;
   posY=mouseY;
   

   
   }


