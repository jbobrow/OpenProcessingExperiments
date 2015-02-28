
void setup (){ // construção do stage
  size (500,500); // define o tamanho da janela
  background(36,42,95); // define a cor de fundo
  smooth(); // suaviza as formas
  noStroke(); // retira as linhas de contorno das formas
  frameRate(5); // define o numero de frames por segundo
}

void draw (){ // construção do desenho/formas

// primeira layer 
 float x = random (0,500); // atribui uma variavel para uma posição x aleatória da elipse
 float y = random (0,500); // atribui uma variavel para uma posiçao y aleatória da elipse
 float diam = random (10,100); // atribui uma variavel para um diametro aliatório da elipse
 float r = random (120,250); // atribui uma variavel para um valor aleatório na escala de vermelhos
 float g = random (108,220); // atribui uma variavel para um valor aleatório na escala de verdes
 float b = random (32,80); // atribui uma variavel para um valor aleatório na escala de azuis

 fill (r,g,b,95); // define a cor da forma com 95% da opacidade
 ellipse (x,y,diam,diam); // desenho da elipse
// segunda layer 
 fill (255,247,0); // define a cor da forma
 triangle (250,100,100,400,400,400); // desenho do triangulo
}
