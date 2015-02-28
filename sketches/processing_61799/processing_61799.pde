
float h12; // variável que define 12H

PFont minhaFonte; // tipo de letra escolhido

void setup (){ //definiçoes de elementos estaticos 
  size (500,500); // tamanho do background
    smooth(); //suavizar
 
  
 minhaFonte = loadFont("Tahoma-Bold-60.vlw"); // Carrega a fonte
  
  }
void draw() { // parte da composiçao que vai usar transformaçao do elementos 
  
 
  noStroke(); //sem contorno
  background (255);// este background vai ser sempre sobreposto cada vez que o codigo for executado


//1
textFont (minhaFonte); //dizer a fonte a utilizar

textSize (73); //tamanho da fonte
fill (0); // cor "preto" da letra
strokeWeight(2); //espessura do outline
text ("1", 285,180); // texto a digitar e posição X e Y (horiz. e vertical)


//2
textSize (70); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("2", 305,230); // texto a digitar e posição X e Y (horiz. e vertical)

//3
textSize (78); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("3", 340,285); // texto a digitar e posição X e Y (horiz. e vertical)


//4
textSize (70); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("4", 315,325); // texto a digitar e posição X e Y (horiz. e vertical)

//5
textSize (73); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("5", 290,380); // texto a digitar e posição X e Y (horiz. e vertical)


//6
textSize (120); //tamanho da fonte
strokeWeight(2);
fill (0); // cor "preto" da letra
text ("6", 200,430); // texto a digitar e posição X e Y (horiz. e vertical)


//7
textSize (73); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("7", 150,410); // texto a digitar e posição X e Y (horiz. e vertical)

//8
textSize (70); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("8", 115,350); // texto a digitar e posição X e Y (horiz. e vertical)

//9
textSize (78); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("9", 130,290); // texto a digitar e posição X e Y (horiz. e vertical)

//10
textSize (70); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("10", 70, 240); // texto a digitar e posição X e Y (horiz. e vertical)


//11
textSize (73); //tamanho da fonte
fill (0); // cor "preto" da letra
text ("11", 95,190); // texto a digitar e posição X e Y (horiz. e vertical)


//12
textSize (110); //tamanho da fonte
fill (0); // cor "preto" da letra
strokeWeight(2); //espessura do outline
text ("12", 160,150); // texto a digitar e posição X e Y (horiz. e vertical)

// Ponteiros do relógio


translate (235, 255); //Ponto apartir do qual vai surgir a translação

float s = second();  // Variável dos segundos de 0 - 59
  float m = minute();  // Variável dos minutos de 0 - 59
  float h = hour();  // Variável das horas de 0 - 23
  h12 = h%12; // Coloca os ponteiros na hora certa,e permite a contagem
  
  int angulo = 360; // Os ponteiros rodam 360º
  
  
  s =   map (s, 0,59, 0, angulo); //Estamos a definir o mapeamento da área, apartir do ponto de translação anteriormente referido. Esta vai de 0 a 59 percorrendo de 0 a 360.
  m =   map (m, 0,59, 0, angulo); //Estamos a definir o mapeamento da área, apartir do ponto de translação anteriormente referido. Esta vai de 0 a 59 percorrendo de 0 a 360.
  h =   map (h12, 0,12, 0, 360); //Estamos a definir o mapeamento da área, apartir do ponto de translação anteriormente referido. Esta vai de 0 a 23 percorrendo de 0 a 360.

  
 

  
//Ponteiro segundos
  strokeWeight(2); //espessura do outline
  stroke(99,99,99);  //cor do outline
  float angleSeconds = radians(s);// converte os angulos 0-360 para radianos
  
pushMatrix(); // esta função salva o sistema de coordenadas corrente 
  rotate(angleSeconds); // é o que permite a rotação do ponteiro dos segundos
  line (0,0, 0, -100); // linha dos ponteiros
popMatrix(); // esta função restaura o sistema de coordenadas prévio

// Ponteiro minutos
  strokeWeight(4); //espessura do outline
  stroke (0); //cor do outline
  float angleMinuts = radians(m);// converte os angulos 0-360 para radianos
pushMatrix(); // esta função salva o sistema de coordenadas corrente 
  rotate(angleMinuts); // é o que permite a rotação do ponteiro dos minutos
  line (0,0, 0, -90); // linha dos ponteiros
popMatrix(); // esta função restaura o sistema de coordenadas prévio


  // horas
  strokeWeight(3); //espessura do outline
  stroke(216,214,214); //cor do outline
   float angleHours = radians(h);// convertemos de angulos 0-360 para radianos
pushMatrix(); // esta função salva o sistema de coordenadas corrente 
  rotate(angleHours);// é o que permite a rotação do ponteiro das horas
  line (0,0, 0, -60);// linha dos ponteiros
popMatrix(); // esta função restaura o sistema de coordenadas prévio
  


}

