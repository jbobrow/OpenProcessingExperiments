
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (500,500); //define o tamanho da janela para 500x500
  smooth();       // suaviza o desenho. anti-aliasing
  noLoop();       // Previne que o programa se reproduza em ciclos contínuos
  noStroke();     // Cancela o aparecimento de contornos nos objectos
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw
  
  String abc = "Random."; // define um conjunto de caracteres com o texto entre aspas
  PFont tipoletra; // Cria uma fonte ser usado no programa
  tipoletra = loadFont("ArialMT-48.vlw"); // carrega o tipo de letra balker para a fonte
  
  float r = random(255); // declaração da variável r de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float g = random(255); // declaração da variável g de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float b = random(255); // declaração da variável b de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  
  for (int i=0 ; i < random(10); i++)
    /*ciclo for incrementa valores em i e termina quando
    o valor de i for igual a um número aleatório entre 0 e 10*/
   {//abertura do ciclo For
    fill(r,g,b); // atribui uma cor aleatória RGB para os seguintes objectos de acordo com as variaveis de valor aleatorio r, g, b
    float x1 = random(500); // declaração da variável x1 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float x2 = random(500); // declaração da variável x2 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float x3 = random(500); // declaração da variável x3 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float x4 = random(500); // declaração da variável x4 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float y1 = random(500); // declaração da variável y1 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float y2 = random(500); // declaração da variável y2 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float y3 = random(500); // declaração da variável y3 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float y4 = random(500); // declaração da variável y4 de valor aleatorio entre 0 e 500. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    quad(x1,y1,x2,y2,x3,y3,x4,y4); //define um polígono quadrilateral de coordenadas aleatórias, que estam definidas em cima
  
    textSize(20); // define o tamanho do texto seguinte para 20
    fill(255); // pinta o texto seguinte de branco, luminosidade 255
    text(abc, 50,400);         // desenha o texto abc definido no inicio do programa pela string abc
    /*Programa desenha entre 1 e 10 polígonos posicionando-os aleatóriamente no ecrã
    e todos com uma cor aleatória*/


   }//fecho do ciclo For
   
}//fecho da funçao void draw

