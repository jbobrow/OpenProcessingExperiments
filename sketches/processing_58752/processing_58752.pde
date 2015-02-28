
void setup(){  // abre a função void setup
  size(400,700);  // define o tamanho da janela para 400 por 700
} // fecha a funçao void setup

void draw(){ // abre a funçao void draw

int r = 100; // atribui o valor 100 à variavel r para a cor vermelho
int g = 70;   // atribui o valor 70 à variavel r para a cor vermelho
int b = 0;    // atribui o valor 0 à variavel r para a cor vermelho

PImage img;   // define uma nova variavel que aceita imagens img
img = loadImage("Police Target-Paper.jpg"); // carrega para a variavel a imagem
image(img, 0, 0,width, height); // introduz a imagem no ecra preenchendo o

String a1 = "Mesmo em cheio!"; // define um conjunto de caracteres string para o texto entre aspas
String a2 = "Quase!";  // define um conjunto de caracteres string para o texto entre aspas
String a3 = "Bom Tiro!";  // define um conjunto de caracteres string para o texto entre aspas
String a4 = "Ainda tens de praticar!";  // define um conjunto de caracteres string para o texto entre aspas
String a5 = "Zero!";  // define um conjunto de caracteres string para o texto entre aspas



PFont tipoletra;  // introduz a funçao que aceita tipos de letra para serem carregados
tipoletra = loadFont("Arial-BoldMT-48.vlw"); // carrega a fonte arial para a variavel tipoletra

stroke(50); // define o contorno dos proximos objectos para cinzento, luminosidade 50

fill(50); // pinta os seguintes objectos com cinzento, luminosidade 50
rect(mouseX,575,50,200); // desenha um rectangulo que define o corpo da arma

rect(mouseX+5,550,40,300); // desenha outro rectangulo para definir o corpo da arma

fill(0);  // pinta os seguintes objectos de preto
rect(mouseX+20,550,10,50); // desenha o apontador da arma

fill(r,g,b); // pinta de castanho o cabo da arma
rect(mouseX,625,50,200); // desenha o cabo da arma

fill(255); // pinta os próximos objectos de branco
textSize(30); // define o tamanho do texto para 30

if (mousePressed) { // se o rato tiver premido, cria uma bola branca para onde apontamos
  fill(255); // pinta a bola de branco
  ellipse(mouseX,mouseY, 5, 5); // desenha a bola no local do rato

if((mouseX>180)&&(mouseX<220)&&(mouseY>325)&&(mouseY<375)){ // condiçao que desenha o texto da string a1 se o cursor do rato tiver no centro da mira

text(a1,width/2-125, 250); // escreve o texto a1

} else if((mouseX>160)&&(mouseX<240)&&(mouseY>300)&&(mouseY<400)){ // condiçao que desenha o texto da string a1 se o cursor do rato tiver na zona ao lado do centro da mira

text(a2,width/2-125, 250); // escreve o texto a2

} else if((mouseX>130)&&(mouseX<270)&&(mouseY>270)&&(mouseY<430)){ // condiçao que desenha o texto da string a1 se o cursor do rato tiver na zona 9 e 8 da mira

text(a3,width/2-125, 250); // escreve o texto a3
  
} else if((mouseX>100)&&(mouseX<300)&&(mouseY>240)&&(mouseY<460)){ // condiçao que desenha o texto da string a1 se o cursor do rato tiver na zona 8, 7 e 6 da mira

text(a4,width/2-150, 250); // escreve o texto a4
 
} else { //caso nao se verifiquem as condiçoes anteriores faz o que está em baixo
  
text(a5,width/2-150, 250); // escreve o texto a5

} // fecha o sistema condicional IF secundário
} else { //não acontece nada se nao tiver o rato premido
}// fecha o sistema condicional IF principal
} // fecha a funçao void draw

