
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (800,600); //define o tamanho da janela para 800x600
  smooth();       // suaviza o desenho. anti-aliasing
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw

  String texto = "I T E R A T I O N"; // define um conjunto de caracteres com o texto entre aspas
  PFont tipoletra; // Cria uma fonte ser usado no programa
  tipoletra = loadFont("Balker-48.vlw"); // carrega o tipo de letra balker para a fonte

  float nobjectos = random(250,500); // atribui à variavel nobjectos o valor 500.0 nao inteiro   
  colorMode(HSB, 360,100,100); // muda o modo de funcionamento da cor para HSB, hue, saturation, brightness
  
  for ( int i = 0; i < nobjectos; i++){  // ciclo que começa em i=0 e incrementa de 1 em 1 até o valor da variável nobjectos, que é um valor entre 250 e 500
     
     float x = width/2; // localização central dos circulos definida, em x
     float x2 = 0;  // localização horizontal dos rectangulos, 
     float y = i; // localização vertical dos circulos correspondente ao indicador do ciclo i
     
     float hu = map (i, 0, nobjectos, 100, 0); // mapeia a cor(hue) das ellipses consoante o valor da variável i numa escala do valor de nobjectos, quanto maior o seu valor, mais o hue tende para 0. de verde para vermelho
     float tam = map ( i, 0, nobjectos,800,0); // mapeia o valor do tamanho dos objectos consoante o valor de i, quanto maior o i, mais prqueno o objecto desenhado, de 800 até 0
     
     if (mousePressed) {    // condição executa se o rato tiver pressionado
       fill(hu,50,50);      //   pinta os rectangulos com o hue de 100 até 0 consoante o valor de i, numa escala entre 0 e o valor de nobjectos. com saturacao e brilho a metade.
       noStroke();                 // elimina o contorno desenhado no objecto seguinte
       rect (x2, y, tam, tam);      // desenha rectangulos de tamanho desde 800 até 0, consoante o aumento da variavel i numa escala até ao valor da variavel nobjectos
       textSize(50);                // define o tamanho do texto
       fill(0,0,0);                 // pinta o texto seguinte de preto, HSB
       text(texto, x, height*0.90);  // desenha o texto definido pela string texto, a partir do centro do ecrã horizontal, e a 9/10 da altura total do ecrã
     } else {                     // caso não se verifique a condição acima "If", executa o que está abaixo, "senao", ou seja, quando o rato nao está pressionado executa o seguinte:
       fill(hu,100,100);          // pinta as ellipses com um desde o tom hue 100 até hue 0, consoante o nr de ellipses desenhadas
       stroke(0);                 //pinta o contorno das ellipses de preto, luminosidade
       ellipse (x, y, tam, tam); // desenha ellipses nas coordenadas x e y  
       
     }                      // fecho da estrutura condicional IF
       
       
  }   // fecho do ciclo For
  
} // fecho da função void draw

