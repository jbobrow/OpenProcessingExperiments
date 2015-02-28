
 /*Victor Krafft Vico_2º Gedi_Informàtica
Dibuix d'una abella polinitzant les flors que es mou per la pantalla tot sol*/
 

 int posX, posY, velX, velY;
 int x; int y;
 /*Definim el tamany i el color de fons del dibuix*/

void setup() {
  size(500,500);
  background(30,144,250);
 stroke(255);
 strokeWeight(0);
   posX = width/2;
  posY = height/2;
  velX = 6;
  velY = 5;
}

//A continuació crearem un nou entorn en el que es mourá l'abella, el seu habitat//


void draw(){
 
background(#87CEEB);//en aqui he posat un background per tal de que se'm vagi borrant la figura i no quedi el rastre//

//Dibuixem primer les tijes de les flors//
//actualitzem posicions//
 
  posX = posX+velX;
  posY = posY+velY;

strokeWeight(6);
stroke(#32CD32);
line(110,375,110,500);
line(250,300,250,500);
line(380,390,380,500);

noStroke();
fill(posX,125,200); //els petals de les flors canviaran de color quan l'abella es mogui en l'eix de les X//

ellipse(110,320,55,120);
ellipse(165,375,120,55);
ellipse(110,425,55,120);
ellipse(55,375,120,55);

fill(posX,200,375);
ellipse(250,355,55,120);
ellipse(305,300,120,55);
ellipse(250,245,55,120);
ellipse(195,300,120,55);

fill(posX,375,480);
ellipse(380,335,55,120);
ellipse(435,390,120,55);
ellipse(380,445,55,120);
ellipse(325,390,120,55);

fill(#FFD700);
ellipse(110,375,55,55);
ellipse(250,300,55,55);
ellipse(380,390,55,55);

//Aquest es el dibuix de l'abella, afegint-li posX i posY fem que l'abella es mogui//

fill(#F5FFFA);
ellipse(posX,posY-20,25,50);

fill(#FFD700);
ellipse(posX,posY,50,30);

fill(0);
rect(posX-10,posY-15,20,30,7);

  //comprovem la posicio X
  if((posX<0)||(posX>width)){
    velX = -velX;
  } 
    //comprovem la posicio Y
  if((posY<0)||(posY>height)){
    velY = -velY;
  } 
}









