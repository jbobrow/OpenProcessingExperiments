
void setup(){ // defina a imagem de fundo
  
  size(600, 700); // define o tamanho da janela
  background(255); // define a cor da janela
  smooth(); // suaviza o desenho
  noStroke(); // os objectos não têm contorno
  frameRate(4); // define que existem apenas 4 frames por segundo
}

void draw(){ // setup do desenho
  background(255); // loop, mas onde só aparece um elemento de cada vez na composição
  
   for (int x = 1; x < 200; x = x+1) { // indica o número de repetições, neste caso 200
     
  float X1 = random (0, 700); // variável para a posição horizontal dos triângulos
  float Y1 = random (0, 700); // variável para a posição vertical dos triângulos
  float r = random (0, 255); // variável para a cor de vermelhos
  //float g = random (0, 255);
  //float b = random (0, 255);

fill(r, 0, 0, 80);  // cor dos triângulos vai variar, só entre tons de vermelho, com transparência
triangle(X1, Y1, 30, 20, 86, 75); // desenho do triângulo

 }
  
fill(0);  // cor do arco
arc(250, 610, 200, 200, PI, TWO_PI-PI/2); // desenho do arco 

fill(0); // cor do segundo arco
arc(350, 610, 200, 200, TWO_PI-PI/2, TWO_PI); // desenho do arco


fill(0); // cor do círculo 
ellipse(300, 450, 300, 350); // desenho do círculo

fill(255); // cor do círculo
ellipse(300, 450, 150, 220); // desenho do círculo

fill(0); // cor do círculo
ellipse(300, 180, 200, 250); // desenho do círculo

fill(0); // cor do círculo
ellipse(200, 100, 50, 100); // desenho do círculo

fill(0); // cor do círculo
ellipse(400, 100, 50, 100); // desenho do círculo

fill(183, 13, 27); // cor do triângulo
triangle(300, 250, 330, 200, 270, 200); // desenho do triângulo

PFont myfont; // associar um nome à font
myfont = loadFont("28DaysLater-48.vlw"); // faz o load da fonte pretendida

textFont(myfont, 50); // indica o tamanho da fonte
text( "rabbit", 400 , 670); // texto pretendido, e a sua localização

  
}
