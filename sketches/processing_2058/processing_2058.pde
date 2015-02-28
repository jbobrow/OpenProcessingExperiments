
/*
PROYECTO MALEVICH

Título: Malevich esta enfermo
Nombre: iNESsantiago
Fecha:  14.05.2009
Lugar: Barcelona - en la cama comiendo fresas
Objetivo: Creación de un dibujo en processing que se asemeje lo más posible a éste
http://www.fiae.org/Malevich%20-%20Suprematism.JPG

Descripción:
*/

//DECLARACIÓN DE VARIABLES

void setup(){
size(500,695); // dimensão do ecrã
  
background (255, 255, 255); // cor do fundo

noStroke(); // sem contorno
fill (204, 141, 12); // cor do preenchimento
quad (378, 650, 486, 597, 487, 618, 378, 669); // localização x e y dos cantos do quadrado

noStroke();
fill (204, 141, 12);
quad (174, 443, 198, 444, 112, 695, 89, 695);

}


void draw() { //executa continuamente o que está inserido dentro do bloco
background (255, 255, 255); // background negro
}
void keyPressed() { // função chamada sempre que se clica numa tecla
   switch(key) { //estrutura if else para 2 alternativas
  case 'r': // no caso de se teclar a tecla "r"
    println("has pulsado la tecla r");
noStroke(); 
smooth();
fill (129, 28, 20); 
quad (206, 419, 245, 418, 168, 628, 135, 628); 
noStroke();
fill (129, 28, 20);
quad (311, 647, 445, 575, 446, 604, 325, 670);
int circleX = 99; // localizaçao do centro x do círculo no ecra 
int circleY = 111; // localizaçao do centro y do círculo no ecra
noStroke();
fill (129, 28, 20);
ellipse(circleX,circleY,165, 165); // locaização do círculo no ecrã + diâmetro
  break;
  
  case 'y': // no caso de se teclar a tecla "y" acontece isto:
    println("has pulsado la tecla y");
noStroke();
fill (204, 141, 12);
quad (378, 650, 486, 597, 487, 618, 378, 669);
noStroke();
fill (204, 141, 12);
quad (27, 288, 389, 254, 391, 281, 30, 321);
noStroke();
fill (204, 141, 12);
quad (174, 443, 198, 444, 112, 695, 89, 695);
  break;
  
    case 'b': // no caso de se teclar a tecla "b" acontece isto:
    println("has pulsado la tecla b");
noStroke();
fill (0, 15, 106);
quad (217, 92, 229, 91, 322, 610, 308, 617);
noStroke();
fill (000, 15, 106);
quad (199, 121, 256, 103, 259, 113, 200, 130);
noStroke();
fill (14, 11, 30);
quad (270, 108, 417, 182, 343, 326, 193, 247);
  break;
  
      case 'g': // no caso de se teclar a tecla "g" acontece isto:
    println("has pulsado la tecla g");
noStroke();
smooth();  
fill (211, 201, 210); 
quad (258, 434, 313, 435, 257, 597, 198, 599); 
 break;
 
       case 'a': // no caso de se teclar a tecla "w" acontece isto:
    println("has pulsado la tecla a");
PImage fondo;  
fondo=loadImage("malevich.jpg"); // localização da imagem que queremos colocar no fundo
background( fondo); // pintamos el lienzo de un color
smooth();

noStroke();
fill (211, 201, 210);
quad (258, 434, 313, 435, 257, 597, 198, 599);
 
noStroke(); 
fill (129, 28, 20); 
quad (206, 419, 245, 418, 168, 628, 135, 628); 

noStroke();
fill (129, 28, 20);
quad (311, 647, 445, 575, 446, 604, 325, 670);

noStroke();
fill (204, 141, 12);
quad (378, 650, 486, 597, 487, 618, 378, 669);

noStroke();
fill (204, 141, 12);
quad (27, 288, 389, 254, 391, 281, 30, 321);

noStroke();
fill (204, 141, 12);
quad (174, 443, 198, 444, 112, 695, 89, 695);

noStroke();
fill (0, 15, 106);
quad (217, 92, 229, 91, 322, 610, 308, 617);

noStroke();
fill (000, 15, 106);
quad (199, 121, 256, 103, 259, 113, 200, 130);

int circleX2 = 99;  
int circleY2 = 111; 
noStroke();
fill (000, 15, 106);
ellipse(circleX2,circleY2,165, 165); 

noStroke();
fill (14, 11, 30);
quad (270, 108, 417, 182, 343, 326, 193, 247);
 break;
                   }
                   

    frameRate(7); // fotogramas por segundo quando é chamada a acção da tecla
  }


