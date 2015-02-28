
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (800,600); //define o tamanho da janela para 800x600
  smooth();       // suaviza o desenho. anti-aliasing
  background(0);  //define a cor/brilho da janela para 0 - preto
  noLoop(); // previne que o programa se reproduza em ciclos contínuos
}                 //fecho da função void setup

void draw(){      //abertura da função void draw

float nobjectos = random(100,255); // os nr de objectos gerados é entre 100 e 255
String texto = "R  E  L  A  C  I  O  N  A  L"; // define um conjunto de caracteres com o texto entre aspas
PFont tipoletra; // Cria uma fonte ser usado no programa
tipoletra = loadFont("Balker-48.vlw"); // carrega o tipo de letra balker para a fonte

for (int i=0 ; i < nobjectos ; i++){   
    /*ciclo for incrementa valores em i e termina quando
    o valor de i for igual a um número aleatório entre 50 e 100*/                            
    float r = i*5; // declaração da variável r (red) que assume o valor de i multiplicado por 5, isto em conjunto com as outras variáveis resultara sempre em tons avermelhados
    float g = random(i); // declaração da variável g (green) de valor aleatorio entre 0 e 120. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float b = random(i); // declaração da variável b (blue) de valor aleatorio entre 0 e 120. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
                         // o facto de a cor ir mudando progressivamente com i dá origem a uma gradiente inicial
    float diam = 100-(i*2); // variável que abarca valores aleatórios entre 10 e 40 para o tamanho dos objectos
    float posX = width*0.50; // esta variável vai definir algo para o meio do ecrã, largura.
    float posY = height*0.20;  // esta variável vai definir algo para 1/5 do ecrã na sua altura.
   
      
      fill(0);  // pinta o objecto de preto, luminosidade 0 mínima
      strokeWeight(10); // define a grossura do contorno para 5
      stroke(r,g,b);   // pinta o contorno do objecto de vermelho puro, da escala RGB red green blue
      ellipse(posX+i,posY+(i*2),diam,diam); // desenha ellipses de "diam" pixeis de diametro de cor relacional com o numero do ciclo
                                            // a relaçao com os valores de i resultam em 2 espirais convergentes num mesmo ponto
      line (width/2,150+i*2,i*4,4*i); // desenha linhas a partir do centro do ecrã usando relacão com a variável i
      
      fill(i); //define a cor de preenchimento dos  objectos seguintes para o valor de i, luminosidade, cria uma gradiente
      textSize(20);  // define o tamanho do texto para 20 
      text(texto, i, height/3+i); // desenha o texto criando uma gradiente, colocando-o no ecra no local indicado por i
      
} //fecho do ciclo For  

fill(255); //define a cor de preenchimento dos  objectos seguintes para branco, luminosidade 255
textSize(20); // define o tamanho do texto para 20
text(texto, nobjectos, height/3+nobjectos); // desenha o texto por cima da gradiente criada pelo circulo, a cor branca, para destacar

}//fecho da funçao void draw

