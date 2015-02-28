
float a;
float b;
float velX, velY, posX, posY;
 
void setup(){
  noCursor();
  size (800,800);
  a=width;
  b=height;
  println("SENYOR AMB RATLLES");
  println("Guillem de Juan 2n GEDI G03");

  posX= width/2;
  posY= height/2;
  velX= random (1,8);
  velY= random (1,8);
}
 
void draw (){
  background (255,255,255);
  
  //ACTUALITZACIÓ DE POSICIONS 
  posX=posX+velX;
  posY=posY+velY;
  personatge(posX,posY);

  
}

//PERSONATGE
void personatge(float _X,float _Y)  
{
  noStroke();
  fill(52,49,54,230); //CAMES
  rectMode(CENTER);
  rect(posX-1.5*a/30,posY+b/3,2.5*a/30,7.5*b/30);
  rect(posX+1.5*a/30,posY+b/3,2.5*a/30,7.5*b/30);
   
  fill(43,32,38,230); //RATLLES NEGRES
  rectMode(CENTER);
  rect(posX,posY-1.5*b/30,6*a/30, 1.5*b/30);
  rect(posX,posY+1.5*b/30,6*a/30,1.5*b/30);
  rect(posX,posY+4.5*b/30,6*a/30,1.5*b/30);
 
  fill(200,47+posX/4,64+posX/4,230); //RATLLES VERMELLES
  rect(posX,posY,6*a/30,1.5*b/30);
  rect(posX,posY+3*b/30,6*a/30,1.5*b/30);
  rect(posX,posY+6*b/30,6*a/30,1.5*b/30);
 
  fill(222,168,121,200); //CAP I MANS
  triangle(posX,posY-0.5*b/30,posX-3*a/30,posY-6.5*b/30,posX+3*a/30,posY-6.5*b/30); //CAP
  triangle(posX-2.5*a/30, posY+4.5*b/30,posX-2.5*a/30, posY+7.5*b/30, posX-5*a/30,posY+6*b/30);
  triangle(posX+2.5*a/30, posY+4.5*b/30,posX+2.5*a/30, posY+7.5*b/30, posX+5*a/30,posY+6*b/30);
 
  fill(52,49,54,230); //BARRET
  triangle(posX-5*a/30,posY-6.5*b/30,posX+5*a/30,posY-6.5*b/30,posX+5*a/30,posY-9.5*b/30);
  triangle(posX-3*a/30,posY-6.5*b/30,posX+a/30,posY-6.5*b/30,posX-a/30,posY-11.5*a/30);
  triangle(posX-1.5*a/30,posY-6.5*b/30,posX+3.5*a/30,posY-6.5*b/30,posX+a/30,posY-13.5*a/30);
  
  //LÍMITS
  //POSICIÓ EN EL EIX X
  if ((posX > width-5*width/30)||(posX < 5*width/30)){ 
  velX=-velX; 
  }
  // POSICIÓ EN EL EIX Y
  if(posY > height-((13.5*height)/30)||(posY < (13.5*height)/30)){
  velY=-velY;
  } 
}

//CANVI DE PARÁMETRES AMB LA FUNCIÓ MOUSE PRESSED
  void mousePressed(){
  
  //CANVI DE POSICIÓ
  posX=width/2;
  posY=height/2;
  
  //CANVI DE VELOCTIAT
  velX = random(1,5);
  velY = random(1,5);
  
  //CANVI DE MIDA
  if (a == width) {
    a = width/2;
  } else {
    a = width;
  }
 
  if (b == height) {
    b = height/2;
  } else {
    b = height;
  }
  }



