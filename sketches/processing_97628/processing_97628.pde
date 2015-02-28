
/*Marta Donoso_ Informàtica Seminari 4
Dibuix que utilitza el comandament for, per tal de fer la repetició de les figures en
un fons estàtic, en el qual es mouen varies peces. El peix gran es mou amb aleatoriament fins que toca
amb l'obstacle, i els peixets petits (boles) es mouen aleatoriament.*/



float posX, posY, velX, velY;
int sz = 80;
int sp=50;
int obstacleX, obstacleY; //definim com a nombre enter l'obstacle.
int numBoles = 5;

//creem una matriu de posicionsX con "numBoles" elements, que representaran als peixets petits.:
float[] posicionsX = new float[numBoles];
//el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//i per velocitatsX:
float[] velocitatsX = new float[numBoles];
//i velocitatsY:
float[] velocitatsY = new float[numBoles];

//inicialitzem el setup
void setup(){
size(700,600);
background(41,77,252);
noStroke();
smooth();
  strokeWeight(3);
  fill(255,255,192);
  stroke(255);
  posX = int(random(0,width)); //posicions amb intervals perquè el peix es mogui aleatoriament.
  posY = int(random(0,height));
  velX = 0.1;
  velY = 0.1;
  
    //inicialitzem posicions i velocitats dels peixets petits:
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = int(random(0,300));
    posicionsY[i] =int(random(300, 700));
    velocitatsX[i] = 0.3;
    velocitatsY[i] = 0.3;
  }
}


void draw(){
  background(41,77,252);
for(int x=20; x<width; x+=50) //he creat tantes ellipses com hi caben en la meitat del dibuix i representen les estrelles
{
   for(int i=20; i<height/2; i+=50){
    noStroke();
    fill(255,217,64);
    ellipse (x,i,15,12); 
    fill(232,216,152);
    ellipse(x,i,5,5);
  fill(111,200,224);

}   

//iniciem un bucle perque faci les mateixes accions en totes les boletes que representen els peixets.
  for(int i = 0; i<numBoles; i++){
    //actualitzem posicions
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];

    //comprobem limits X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    } 
    //comprobem limits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height/2)){
      velocitatsY[i] = -velocitatsY[i];
    } 
  
   //i dibuixem
    ellipse(posicionsX[i],posicionsY[i],5,5);
  }

  //actualitzem posicions per a la figura del peix
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
}



