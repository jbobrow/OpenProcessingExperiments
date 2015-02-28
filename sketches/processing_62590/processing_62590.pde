
// Exercício Ilustração Figurativa Generativa - Anabel Santos



void setup(){  // definiçoes de setup
  size(800,450); // define o tamanho do fundo
background(0); // cor de fundo da janela 
smooth(); // suaviza os contornos 
}
void draw(){ // definiçoes de desenho

  PImage img; // codigo que permite carregar imagem a qual atribuimos o nome (img)
img = loadImage("cod.jpg"); // isto carrega a imagem
image(img,0,0); // desenha a imagem na coordenada que inseriremos


PFont texto; //codigo que permite inserir texto ao qual atribui o nome (texto)
texto = loadFont("Arial-Black-48.vlw"); // tipo de letra escolhido

fill(232,5,5); // cor do texto
textFont(texto,30); // tamanho do tipo de letra
text ( "HEADSHOT", 540,200); // escolha do texto que pretendemos que apareça e posição

PFont texto2; // codigo que permite inserir texto ao qual atribui o nome (texto2)
texto2 = loadFont("Arial-Black-48.vlw"); // tipo de letra escolhido


fill(255); // cor do texto
textFont(texto2,10); // tamanho do tipo de letra
text ( "Go,go, go", 75,390); // escolha do texto que pretendemos que apareça e posição

PFont texto3;  // codigo que permite inserir texto ao qual atribui o nome (texto3)
texto3 = loadFont("Gisha-Bold-48.vlw"); // tipo de letra escolhido


fill(0); // cor do texto
textFont(texto3,20); // cor do texto
text ( "Hell yeah!!!", 675,310); // escolha do texto que pretendemos que apareça e posição


noStroke(); // sem linha de contorno (outline)
fill(237,24,6); // cor escolhida
rect(33, 395,random(width) , 2); /* rectângulo com posições x/y e comprimento definidos, 
                                 apenas sendo a largura variável*/


noStroke(); // sem linha de contorno (outline)
fill(255); // cor escolhida
rect(45, 397, random(width), 2); /* rectângulo com posições x/y e comprimento definidos, 
                                 apenas sendo a largura variável*/



  
} 



