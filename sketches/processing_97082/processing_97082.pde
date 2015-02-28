
/*Alfons Echegaray
Informatica Grup 02 - 2n GEDI
Professora: Anna Mª del Corral
Practica 3
Variables:

En aquest exercici treballem les variables en funció del cursor (X,Y) utilitzant el void set, i el void draw, i definint la posició de les lineas respecte mouseX.
Les elipses canvien de tamany amb mouseX, i de color amb mouseY.
L'ull apareix segons el moviment de mouseX, pero apareix amb un moviment vertical.

1.Fem que el dibuix del ull i de l'anell i de l'ull reboti amb els límits de la finestra, no amb el seu centre, sinó amb els 
seus límits (a la dreta, esquerra, a dalt i a baix, com si el que dibuixes tingués entitat 
física, per dir-ho així).
2. Afegim a l’sketch la funció mousePressed() per tal que, quan cliquis sobre la 
finestra, canviï la posició del dibuix i la mida de tots o algun dels seus 
elements. Mira’t la referència de processing per veure com fer-ho. Atenció: 
No confonguis la funció mousePressed() (que va fora del Draw i el Setup) 
amb la variable mousePressed (que pot anar dins el Draw).
3.Utilitza les variables de posició horitzontal i vertical del dibuix per fer canviar 
paràmetres com el seu color o forma mitjançant condicionals. Per exemple: 
que una part del dibuix sigui cercle o quadrat segons aquest estigui a la 
dreta o esquerra de la finestra, o que un color canviï segons si està a la 
meitat de dalt o de baix.

En aquesta animació l'anell passa per derrara dels cercles de colors, i l'ull per devant.
si cliquem el mouse es reposicionen l'ull i l'anell i mentre es mante clicat el fons queda blanc.
el tamany de l'ull augmenta al premer mouse, pero no he aconseguit que recuperes el tamany despres de deixar de premer el mouse.






*/

//introducció deles entitats//
int posX, posY, velX, velY,posX1,posY1,velX1,velY1;
float szull,szanell;

void setup()
{
  size(600,600);
  rectMode(CENTER);
  colorMode(RGB, height, height, 250);
  noCursor(); 
 
 posX = width/2;
  posY = height/2;
 posX1 = width/4;
  posY1 = height/4;
  velX = 7;
  velY = 4;
  velX1 = 10;
  velY1 = 7;
  szull = 100;
  szanell= 50;

}

void draw()
{
  background(0);
  //canvi de fons//
   if (mousePressed == true) {
   background(#FFFFFF);
  } 
  

//anell//

fill(#FCD700);
ellipse(posX1,posY1,szanell,szanell);
fill(0);
ellipse(posX1,posY1,szanell/4,(szanell - 20));
   posX1 = posX1 +velX1;
  posY1 = posY1 + velY1;

  if ((posX1<(0+(szanell/2)))||(posX1>(width-(szanell/2)))){
    velX1 = -velX1;
  }
  
  if ((posY1<(0+(szanell/2)))||(posY1>(height-(szanell/2)))){
    velY1 = -velY1;
  }

  if (mousePressed == true) {
   posX1 = mouseY;
   posY1 = mouseX;
  } 


  //lineas creu//   
  stroke(255);
    strokeWeight(10);
  line(width/4,height/4,3*(width/4),3*(height/4));
  line(3*(width/4),height/4,width/4,3*(height/4));
  
  
  //cercles de colors//
noStroke();
fill(mouseY+100,mouseY,50);
ellipse(width/2,height/2,130+(0.5*mouseX),180+(0.5*mouseX));

fill(mouseY+50,mouseY,150);
ellipse(width/2,height/2,100+(0.5*mouseX),100+(0.5*mouseX));

fill(mouseY,mouseY,250);
ellipse(width/2,height/2,20+(0.3*mouseX),40+(0.8*mouseX));

  
//ull moviment//
fill(#FCD700);
ellipse(posX,posY,szull,szull);
fill(0);
ellipse(posX,posY,szull/4,(szull - 20));
   posX = posX + velX;
  posY = posY + velY;

  if ((posX<(0+(szull/2)))||(posX>(width-(szull/2)))){
    velX = -velX;
  }
  
  if ((posY<(0+(szull/2)))||(posY>(height-(szull/2)))){
    velY = -velY;
  }


   if (mousePressed == true) {
   posX = mouseX;
   posY = mouseY;
  } 

   if (mousePressed == true) {
   szull= 400;
   }
else{
  szull= szull;
}
 






}





