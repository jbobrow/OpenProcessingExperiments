
void setup(){ //criação do Set Up da composição
  
size (600,600); //definição do tamanho da composição
background (0); //definição da cor de fundo
frameRate (50); //definição do número de frames por segundo
noStroke(); // define que os elementos da composição não tem contorno
smooth(); //serve para suavizar os elementos da composição

}

void draw(){ //inicio da criação dos elementos da composição

 float r = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
 float g = random (255); //determina um valor para a escala de verdes que vai de 0 a 255
 float b = random (255); //determina um valor para a escala de azuis que vai de 0 a 255
  
  
  stroke (r,g,b); //define que a cor da linha vai estar relacionada com as variáveis criadas anteriormente
  line (random (0,600), random (0,600), random (0,600), random (0,600)); //criação de linhas aleatorias
                           
  
  noStroke(); //define que os elementos que se seguem nao tem linha de contorno
  
                              //ORELHAS
  
//variável cor orelhas/cabeça
 float r1 = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
 float g1 = random (255); //determina um valor para a escala de verdes que vai de 0 a 255
 float b1 = random (255); //determina um valor para a escala de azuis que vai de 0 a 255  

//orelha esq
fill (r1,g1,b1); //preenchimento do quadrado consoante as variáveis criadas anteriormente
rect (50,50,200,200); //coordenadas do quadrado

//orelha dir
fill (r1,g1,b1); //preenchimento do quadrado consoante as variáveis criadas anteriormente
rect (350,50,200,200); //coordenadas do quadrado

                              //CABEÇA

//cabeça
fill (r1,g1,b1); //preenchimento do quadrado consoante as variáveis criadas anteriormente
rect (150,250,300,300); //coordenadas do quadrado

                              //OLHOS

//olho esq
fill (255); //preenchimento do triangulo, neste caso, branco
triangle (237.5,300,200,400,275,400); //coordenadas do triangulo

//olho dir
fill (255); //preenchimento do triangulo, neste caso, branco
triangle (362.5,300,325,400,400,400); //coordenadas do triangulo

                              //BOCA

fill(255); //preenchimento do quadrado, neste caso, branco
rect (200,450,200,50); //coordenadas do quadrado

                              //FONT

//criação de font

PFont myFont; //nome para a font 

myFont = loadFont ("HappyKiller-48.vlw"); //função que permite carregar a font

fill (255); //atribuição de cor ao texto, neste caso, branco

textFont (myFont, 50); //definição do tamanho da font

text("wazaap", 159, 296); //definição do texto 

                              //INTERIOR DAS ORELHAS

fill (255); //preenchimento do quadrado, neste caso, branco                      
rect (100,100,100,100); //coordenadas do quadrado

fill (255); //preenchimento do quadrado, neste caso, branco
rect (400,100,100,100); //coordenadas do quadrado


}


