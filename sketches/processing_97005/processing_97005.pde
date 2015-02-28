
float posX=0;
float posY=0;
float velX=5;
float velY=5;
float diametro=50;


void mousePressed(){posX=random(0,255);
}
void setup(){
  size(400,400);
  
}

void draw(){
  //Fondo
  background(posX,posY,0);
 
  posX=posX+velX;
  posY=posY+velY;
  //elipses ojo ext
  fill(255);
  strokeWeight(5);
   ellipse(posX,posY, diametro+50,diametro);
   //elipses ojo int
    strokeWeight(2);
  fill(0,0,posY);
  ellipse(posX,posY, diametro,diametro);
  fill(0,posX,0);
  ellipse(posX,posY, diametro/2,diametro/2);
    fill(posY,0,0);
   ellipse(posX,posY, diametro/4,diametro/4);
 
  
  //Movimiento diagonal.
  if(posX>=width||posX<=0){
    velX=-velX;}
  if(posY>=height||posY<=0){
    velY=-velY;}
  if(posY<=0){posX=width;
 
  }
  if(posX>=width){
    velX=-5;
  }
  if(posX>=height){
    posX=5;
    }
    //Variacion de tamaño
    if(mousePressed){
    ellipse(posX,posY, diametro,diametro);
    diametro=diametro+1;
    }
    
    
    //Reduccion de tamaño
 if(diametro>=100){diametro=5;
 
 
}
 

 
 
   
}
  
  
  


