
 /*Victor Krafft Vico_2º Gedi_Informàtica
Dibuix d'una abella polinitzant les flors que segueix el ratolí mitjançant mouse X i mouseY amb les funcions setup i draw.*/
 

 
 int x; int y;
 /*Definim el tamany i el color de fons del dibuix*/

void setup() {
  size(500,500);
  background(30,144,250);
 stroke(255);
 strokeWeight(0);
}

//A continuació crearem un nou entorn en el que es mourá l'abella, el seu habitat//


void draw(){
 
background(#87CEEB);//en aqui he posat un background per tal de que se'm vagi borrant la figura i no quedi el rastre//

//Dibuixem primer les tijes de les flors//

strokeWeight(6);
stroke(#32CD32);
line(110,375,110,500);
line(250,300,250,500);
line(380,390,380,500);

noStroke();
fill(mouseX,125,200); //els petals de les flors canviaran de color quan el punter del mouse es mogui en l'eix de les X//

ellipse(110,320,55,120);
ellipse(165,375,120,55);
ellipse(110,425,55,120);
ellipse(55,375,120,55);

fill(mouseX,200,375);
ellipse(250,355,55,120);
ellipse(305,300,120,55);
ellipse(250,245,55,120);
ellipse(195,300,120,55);

fill(mouseX,375,480);
ellipse(380,335,55,120);
ellipse(435,390,120,55);
ellipse(380,445,55,120);
ellipse(325,390,120,55);

fill(#FFD700);
ellipse(110,375,55,55);
ellipse(250,300,55,55);
ellipse(380,390,55,55);

//Aquest es el dibuix de l'abella//

fill(#F5FFFA);
ellipse(mouseX,mouseY-20,25,50);

fill(#FFD700);
ellipse(mouseX,mouseY,50,30);

fill(0);
rect(mouseX-10,mouseY-15,20,30,7);




}





