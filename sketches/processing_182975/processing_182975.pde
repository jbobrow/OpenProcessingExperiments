
float mida = 60;
float posicionX = 30;
float posicionY= 75;
float posicionX1= 58;
float posicionY1= 20;
float posicionX2= 86;
float velocitatX = 3;
float velocitatY = 3;

void setup (){
  size(600,400);
  background (0);
}

void draw (){


  triangle(posicionX, posicionY, posicionX1, posicionY1,posicionX2, posicionY);
  fill (random (60),random(100), random(200));
  posicionX = posicionX + velocitatX;
  posicionY = posicionY + velocitatY;
  posicionX1 = posicionX1 + velocitatX;
  posicionY1 = posicionY1 + velocitatY; 
  posicionX2 = posicionX2 + velocitatX;
  //posicionY2 = posicionY + velocitatY; 
  
  if(posicionX>=width||posicionX<=0){
    velocitatX=-velocitatX;
  }
  

  if(posicionY>=height || posicionY<=0){
    velocitatY=-velocitatY;
  }
 
 
  if(posicionX+mida/2>width||posicionX-mida/2<=0){
    velocitatX=-velocitatX;
  }
  
  if(posicionY+mida/2>height||posicionY-mida/2<=0){
    velocitatY=-velocitatY;
  }
  

}

void mousePressed (){
   posicionX=mouseX;
   posicionY=mouseY;
  
   velocitatX = random(-4,10);
   velocitatY = random (-6, 14);
  
   
   mida = random (10,100);

  }



