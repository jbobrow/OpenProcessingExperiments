
/*EXERCICI-3*/

//valors en memoria
float posicioX = 300;
float posicioY = 100;
//el signe de la velocitat el fara  anar a la dreta o a l'esquerra
float velocitatX = random(5,10); //-20 faria que anes a l'esquerra
float velocitatY = random(5,10);
float sz = 50;

PImage space;

void setup(){
size(600,450);
space = loadImage("space.jpg");
}



void draw(){
 image(space,0,0,width,height);
background(0);
 posicioX = posicioX + velocitatX; //per fer que es mogui, em de sumar la velocitat
  posicioY = posicioY + velocitatY;
noStroke();

//POSICIONS

  if(posicioX + sz/2 >= width||posicioX - sz/2 <= 0){   //condicio                                                                                                                                                                                            
  velocitatX = -velocitatX; //canviar la direccio
  }
  
  if(posicioY + sz/2 >= height||posicioY - sz/2 <=0){
    velocitatY = -velocitatY; //interancivem el signe de velocitat  
}

 
  //CANVIAR COLOR SEGONS ON ESTIGUI LA FIGURA


if(posicioX <= width/6){
fill(0,27,255);
} else if(posicioX <= (width/6)*2){
  fill(242,0,255);
} else if(posicioX <= (width/6)*3){
  fill(0,255,240);
  } else if(posicioX <= (width/6)*4){
  fill(0,255,247);
} else if(posicioX <= (width/6)*5){
  fill(0,234,37);
} else {
  fill(255,247,0);
  }


  rectMode(CENTER);
  
   ellipse(posicioX,posicioY,sz+6,sz+6);
 rect(posicioX,posicioY,sz-2,sz-2);
 }

 
  void mouseReleased(){
}
 
 
 
 
  void mousePressed() {
    velocitatX = random(-10,20);
    velocitatY = random(-10,20);
    posicioX = mouseX;
    posicioY  = mouseY;
   sz = random(20,100);
  
  }
