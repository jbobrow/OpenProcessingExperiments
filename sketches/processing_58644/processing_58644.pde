
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (500,500); //define o tamanho da janela para 500x500
  smooth();       // suaviza o desenho. anti-aliasing
  noLoop();       // Previne que o programa se reproduza em ciclos contínuos
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw
  
for (int cont=0; cont < 5; cont++){ //ciclo incrementa valores em cont de 0 a 5
                                    //permite definir cores e os contornos diferentes para cada grupo de polígonos criado
  float r = random(255); // declaração da variável r red de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float g = random(255); // declaração da variável g green de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float b = random(255); // declaração da variável b blue de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
   
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
    
    /*Programa desenha entre 1 e 10 polígonos posicionando-os aleatóriamente no ecrã
    e todos com uma cor aleatória*/
  }//fecho do ciclo For que desenha até 10 polígonos
  
    strokeWeight(random(1,10)); //define a grossura dos contornos aleatóriamente entre 1 e 10 para cada grupo de polígonos
    stroke(r,g,b);// define a cor do contorno aleatóriamente para cada grupo de polígonos
    float h = random(500); // dec da variavel a para definir coordenadas das linhas
    float w = random(500); // dec da variavel a para definir coordenadas das linha
    line(h,w,w,h); //desenha uma linha por cada ciclo
  
}//fecho do ciclo For que desenha 5 grupos de polígonos de cores diferentes em layers diferentes
   
   fill(0); //define a cor de preenchimento dos  objectos seguintes para preto, luminosidade 0
   ellipse(height/2,width/2,100,100); //cria um circulo de 100x100 no centro do desenho
   
   
   String texto = "Layers. Briefing 1."; // define um conjunto de caracteres com o texto entre aspas
   PFont tipoletra; // Cria uma fonte ser usado no programa
   tipoletra = loadFont("ArialMT-48.vlw"); // carrega o tipo de letra arial para a fonte
   
   fill(0); //define a cor de preenchimento dos  objectos seguintes para branco, luminosidade 255
   textSize(200);  //define o tamanho do texto para 200
   text(texto, width/2, height/2); // desenha o texto a partir do centro do ecra
   
   fill(255); //define a cor de preenchimento dos  objectos seguintes para branco, luminosidade 255
   textSize(20);  //define o tamanho do texto para 20
   text(texto, width/2, height/2); // desenha o texto a partir do centro do ecra
   
}//fecho da funçao void draw

