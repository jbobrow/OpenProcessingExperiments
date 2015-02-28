
void setup(){ // definições do setup
size (600,600); // tamanho da janela
smooth(); //suavizar o desenho
frameRate (5); // 5 frames por segundo

}

void draw(){ // definições do desenho
  background (66,3,99); // cor de fundo
  
// triangulo

noStroke(); // sem espessura
fill(151,17,201); // cor do 1º triangulo
triangle (0,300,150,100,300,300); // triangulo 1
fill (79,3,107);
triangle (0,300,150,500,300,300);
fill (79,3,107);
triangle (250,0,300,300,350,0);
fill(151,17,201);
triangle (250,600,300,300,350,600);
fill (79,3,107);
triangle (300,300,450,100,600,300);
fill(151,17,201);
triangle (300,300,450,500,600,300);

float diametro1 = random (100,200);

fill(255,0,0);
ellipse(300,300,8,8);
ellipse(150,100,5,5);
ellipse(450,100,5,5);
ellipse(150,500,5,5);
ellipse(450,100,5,5);
ellipse(598,300,5,5);
ellipse(450,500,5,5);
ellipse(2,300,5,5);


float diametroh = random(100,100); // crira uma variavel e atribuir um valor
 float r2 = random(252);
 float g2 = random(3);
 float b2 = random(28);
 
 float s2 = random(1,10);
 fill(r2,g2,b2);
 ellipse(random(500),random(500),diametroh,diametroh);
 
 float diametrop = random(50,50); // criar uma variavel e atribuir um valor
 float r3 = random(252); 
 float g3 = random(3);
 float b3 = random(28);
 
 float s3 = random(1,10);
 fill(r3,g3,b3);
 ellipse(random(500),random(500),diametrop,diametrop);
 
 float diametroo = random(25,25); // criar uma variavel e atribuir um valor
 float r4 = random(252);
 float g4 = random(3);
 float b4 = random(28);
 
 float s4 = random(1,10);
 fill(r4,g4,b4);
 ellipse(random(500),random(500),diametroo,diametroo);

}

