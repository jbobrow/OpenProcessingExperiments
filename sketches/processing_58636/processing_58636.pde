
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (800,600); //define o tamanho da janela para 800x600
  smooth();       // suaviza o desenho. anti-aliasing
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw

  background(0);  //define a cor de fundo para preto, luminosidade 0
  String texto = "GRELHA 1D"; // define um conjunto de caracteres com o texto entre aspas
  PFont tipoletra; // Cria uma fonte ser usado no programa
  tipoletra = loadFont("Arial-Black-48.vlw"); // carrega o tipo de letra arial para a fonte
 
  for (int a=25;a<width;a=a+50){  // ciclo começa em 0 e incrementa de 50 em 50 até chegar à largura da janela
  
    float r=random(255);          // declaração da variável r de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros          
    float g=random(255);          // declaração da variável g de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float b=random(255);          // declaração da variável b de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    fill(r,g,b);                  // pinta os seguintes objectos com cores aleatórias definidas pelas vars. R G e B
    ellipse (a,mouseY,30,30);     // desenha uma ellipse no local do ecrã correspondente em largura à variavel a, controlável pelo rato na sua verticalidade
    
    text(texto, a*2, mouseX);     // desenha o texto da forma como desenha a ellipse em cima, mas inverte a colocação do rato, da coordenada vertical com a horizontal
    text(texto, a*2, mouseX/4+250);  // desenha o texto da for como desenha o texto em cima mas dividindo a actual posição horizontal do rato por 4 e somando 250 e atribui esse valor ao seu "Y"(vertical)
  
  }                                 //fecho ciclo For
  
for (int x=0;x<20;x=x+1){         // ciclo começa em 0 e acresce em x até ao numero 20
    fill(50);                     // pinta de cinzento (luminosidade) o seguinte objecto
    ellipse(x*50, mouseY, 5,height);  // desenha ellipses muito finas e altas entre os circulos coloridos, controladas pelo movimento vertical do rato
}  //fecha o ciclo For

}//fecho da funçao void draw

