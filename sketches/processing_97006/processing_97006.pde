
/*MARTA DONOSO_2 GEDI INFORMÀTICA
Aquest exercici es basava en que hi hagués l'efecte rebot (que fa el peix) i el canvi de mida, que ho he aconseguit fen l'efecte de respiració*/
 
 
//aqui defineixo les mides del sol, ja que fa l'efecte de respiració i per tant necessita varis valors de diàmetre
int midaMinima = 100;
int midaMaxima = 150;
int interval = 1;
boolean creixent = true;
int midaBola = 30;
float posX, posY, velX, velY;
int sz = 80;
int sp=50;
int obstacleX, obstacleY; //definim com a nombre enter l'obstacle.

//en el setup defineixo els intervals de la velocitat que tindrà el peix i les posicions.
void setup(){
  size(600,600);
  smooth();
  strokeWeight(3);
  posX = width/2;
  posY = height/2;
  velX = random(1,3);
  velY = random(1,3);
  fill(255,255,192);
  stroke(255);

}
//Dibuix del sol i dels núvols)
void draw(){
  background(155,180,255); 
   fill(41,84,237);
   stroke(41,84,237);
ellipse(100,120,160,100);
ellipse(160,150,140,90);
fill(103,137,255);
stroke(103,137,255);
ellipse(160,150,130,80);
ellipse(100,120,150,90);

  //colors sol
  fill(255,233,31);
  stroke(255,233,31);
 

  //La mida de la bola ha de canviar segons estigui creixent o decreixent
  if(creixent==true){
    midaBola = midaBola + interval;
  } 
  else { //no esta creixent
  midaBola = midaBola - interval;
  }


  //I ara cal comprobar si ha arribat a una mida límit
  //per canviar el cicle creixent/decreixent
  if(midaBola > midaMaxima){
    creixent = false;
  }
  if(midaBola < midaMinima){
    creixent = true;
  }

  //I finalment la dibuixem
  ellipse(240,100,midaBola,midaBola);

  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;

  //dibuixem el peix que anirà rebotant.
  fill(191,222,255);
  stroke(191,222,255);
  ellipse(posX,posY,sz,sp);
   
  triangle(posX-90,posY-30,posX-90,posY+30,posX-30,posY);
 fill(255);
 stroke(0);
 strokeWeight(1);
  ellipse(posX+15,posY-5,20,25);
  fill(0);
   ellipse(posX+15,posY-5,5,10);
   stroke(41,9,227);
   fill(0);
ellipse(posX+50,posY-10,5,5);
ellipse(posX+50,posY-20,10,10);
ellipse(posX+55,posY-50,20,20);


  //comprobem posició X
  if((posX<0)||(posX>width)){
    velX = -velX;
  } 
  //comprobem posició Y
  if((posY<0)||(posY>height)){
    velY = -velY;
  } 

  //actualitzem l'obstacle, que representa el límit on el peix pot estar nadant:
  obstacleX = mouseX;
  obstacleY = mouseY;
  stroke(6);
  //dibuixem :
line(0,obstacleY,width,obstacleY);

  if(abs(posY-obstacleY) < sz/2){
    velY = -velY;
  }
}


