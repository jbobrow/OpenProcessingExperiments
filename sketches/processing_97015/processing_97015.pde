
 /*Nil Pastor G3: Pràctica3*/
 /*En Primer lloc definim les  variables que utilitzarem per a definir el la posició i velocitat
 de la car, els colors d'aquesta, i la mida de l'esfera de fons*/
int posX, posY, velX, velY;
int color1, color2, color3;
int mx=0;
 /*En l'apartat del void setup definim la mida de la pantalla, i la posició
 i velocitat inicial de la cara*/

void setup(){
  size(500,450);
  posX = width/2;
  posY = height/2;
  velX = 2;
  velY = 2;
}
/*A continuació definim el color del fons i el dibuix de la cara en el void draw*/
void draw(){
  background(0);
/*El primer punt a l'hora de definir la cara es la seva posició i amb aquesta
funció fem que aquesta canvi a mida que es va repetint*/
  posX = posX+velX;
  posY = posY+velY;
  fill(3,97,255);
  stroke(3,97,255);
  ellipse(width/2,height/2,mx,mx);
  fill(color1,color2,color3);
  stroke(255,255,255);
  strokeWeight(3);
  ellipse(posX,posY,100,100);
  fill(0);
  ellipse(posX-20,posY-20,20,20);
  ellipse(posX+20,posY-20,20,20);
  fill(0);
  stroke(0);
  ellipse(posX,posY+10,40,40);
  fill(color1,color2,color3);
  stroke(color1,color2,color3);
  rect(posX-25,posY-12,50,20);
  color1 = 233;
  color2 = 255;
  color3 = 0;
/*Un cop definida la cara afegim les variables*/

/*La primera variable ens serveix per que la cara modifiqui la seva
direcció en sentit X, definint que quan la posició sigui menor a 50(el radi
de l'esfera que defineix la cara) o quan sigui menor a l'amplada menys el radi
l'esfera canvi el sentit de la velocitat*/
  
  
  if((posX<50)||(posX>width-50)){
    velX = -velX;
  }
 /*La segona variable es el mateix pero per a l'eix Y*/
  
   if((posY<50)||(posY>height-50)){
    velY = -velY;
  } 
 /*aquesta tercera i última variable la utilitzem per que la cara canvi de
color groc al vermell al creuar la meitat vertical de la pantalla*/ 
   if(posX>width/2){
     color1=255;
     color2=0;
     color3=0;
  }   
}
/*Finalment afegim la funció mouse pressed que la relacionarem amb variables
de tal manera que al premer el mouse s'infli una esfera al mig de la pantalla
de color blau, que s'infla fins a arribar a un diametre màxim de 400*/
void mousePressed() {
  if(mx<400){
    mx=mx+20;
  } else {
    mx=0;
  }  
    
  
}  
  


