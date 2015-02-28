
// Exercício de Random -  Anabel Santos

float t; // variável transparência (alpha)
float diam; // variável de diametro
float x; // posição X - horizontal
float y; // posição Y - vertical

//definições setup
void setup(){
  size(300,300); // tamanho do background
  background (0); // cor do background
  smooth(); // suavizar
}

// parte ilustrativa (desenhos)
void draw(){

  //Variáveis com valores aleatórios, excepto os da cor
t = random(255); // transparência
diam = random(20); // diametro aleatório de 1 a 20
x = random(width); // posição X - horizontal random
y = random(height); // posição Y - vertical random

noStroke(); // sem contorno (outline)
fill(201,232,255,t);  // cor dos círculos
ellipse(x,y,diam,diam); // círculos com valores aleatórios
   
  }


