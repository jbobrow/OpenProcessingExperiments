
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (800,600); //define o tamanho da janela para 800x600
  smooth();       // suaviza o desenho. anti-aliasing
  noLoop();       // Previne que o programa se reproduza em ciclos contínuos
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw

int limiteHorizontal = 200; // define a margem lateral da geraçao de objectos
int limiteVertical = 150; // define a margem vertical da geraçao de objectos
int crectX = 60; // define a margem lateral da geraçao do rectangulo do canto inf esq
int crectY = height/2 + 50; // define a margem vertical da geraçao do rectangulo do canto inf esq
int crectX2 = width/2 + 60; // define a margem lateral da geraçao do rect do canto sup direito
int crectY2 = 50; // define a margem vertical da geraçao do rect do canto sup direito
int nobjectos = 500; // define a variável nobjectos para o valor 200, valor maximo de objectos de cada tipo que vao ser gerados

fill(255); // define a cor branca para o seguinte objecto, luminosidade maxima
rect(0, 0, width/2, height); // define um rectangulo branco de fundo que divide a imagem em 2, branco e preto

for ( int i = 0; i < nobjectos; i++) 
/* ciclo que começa em i=0 e vai até o valor definido para a variável
   nobjectos, que neste caso é 200*/
  {    // abertura do ciclo For
     float coordX = random (width/4-limiteHorizontal, width/4 +limiteHorizontal); // gerar um numero para posição horizontal canto superior esq
     float coordY = random (height/4-limiteVertical, height/4 + limiteVertical); // gerar um numero para posição vertical canto superior esq
     float coordX2 = random (width*0.75-limiteHorizontal, width*0.75 + limiteHorizontal); // gerar um numero para posição horizontal canto inferior dir
     float coordY2 = random (height*0.75-limiteVertical, height*0.75 + limiteVertical); // gerar um numero para posição vertical canto inferior dir

     float r = random(255); // gerar um valor para a componente vermelha entre 0 e 255
     float g = random(255); // gerar um valor para a componente verde entre 0 e 255
     float b = random(255); // gerar um valor para a componente azul entre 0 e 255
     
     float diametro = random (5, 50); // gera um diametro entre 5 e 50
     strokeWeight(random(1,5)); // define a grossura do contorno entre 1 e 5
     stroke(0); // define os contornos como pretos, luminosidade 0
     fill(r,g,b); // //define a cor de preenchimento dos  objectos seguintes para os valores assumidos pelas variaveis R G e B
     ellipse ( coordX, coordY, diametro, diametro); // desenhar a elipse com os valores gerados
     
     float lado = random (5, 50); // gera um lado do rectangulo entre 5 e 50
     strokeWeight(random(1,5)); // define a grossura do contorno entre 1 e 5
     stroke(255); // define os contornos como brancos, luminosidade 255
     fill(r,g,b); // //define a cor de preenchimento dos  objectos seguintes para os valores assumidos pelas variaveis R G e B
     rect ( coordX2, coordY2, lado, lado); // desenha o rectangulo com os valores gerados
     } //fecho do ciclo For

stroke(0); // define os contornos como pretos, luminosidade 0
rect(crectX, crectY, (width/2)-2*(crectX) , (height/2)-2*(crectX)); // define um rectangulo com a ultima cor definida no ciclo, no canto inferior esquerdo com margens definidas pelas variaveis crectX e Y
stroke(255); // define os contornos como pretos, luminosidade 0
rect(crectX2, crectY2, (width/2)-2*(crectX) , (height/2)-2*(crectX)); // define um rectangulo com a ultima cor definida no ciclo, no canto inferior esquerdo com margens definidas pelas variaveis crectX e Y

}//fecho da funçao void draw

