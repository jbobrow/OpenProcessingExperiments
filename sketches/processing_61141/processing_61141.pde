
void setup(){  // definições do stage
  size(500,500); // tamanho da janela
  smooth(); // suaviza as formas


} 

void draw() {  // desenho das formas
  
  translate (width/2, height/2); // redefine os 0 das coordenadas, neste caso para o centro da janela
  background(255); // cor de fundo
  
  
  float s = second(); // atribui uma variavel para s que está associada aos segundos fornecidos pelo computador e assim sendo irá de 0 a 59
  float m = minute(); // atribui uma variavel para m que está associada aos minutos fornecidos pelo computador e assim sendo irá de 0 a 59 
  float h = hour(); // atribui uma variavel para h que está associada às horas fornecidos pelo computador e assim sendo irá de 0 a 12   
 
  int escala = 360; // define uma variavel para escala e indica qe o seu valor é 360
  s = map (s, 0, 59, 0, escala); //indica o alcance de s, que vai de 0 a 59 e de 0 a 360
  m = map (m, 0, 59, 0, escala); //indica o alcance de m, que vai de 0 a 59 e de 0 a 360
  h = map (h, 0, 12, 0, escala); //indica o alcance de h, que vai de 0 a 12 e de 0 a 360  


//  aqui vou criar uns ponteiros como um relogio convencional e associar uma elipse à extremidade do ponteiro, posteriormente coloco os ponteiros da cor do fundo para que se vejam só as elipses e assim conseguir o relogio minimalista que pretendo
  
  
  // S
  // vou criar estas variaveis de posições para poder associar o centro das elipses à posição do ponto da extremidade do ponteiro
  float pos1 = 0; // atribui uma variavel para uma posição que é igual a zero
  float pos2 = -200; //atribui uma variavel para uma posição  que é igual a menos duzentos
  float pos3; // atribui uma variavel para uma posição
  float pos4; // atribui uma variavel para uma posição
  
  pos3 = pos1; // indica que a pos3 vai coincidir com a posição de pos1
  pos4 = pos2; // indica que a pos4 vai coincidir com a posição de pos2
  strokeWeight(1); // indica a expessura da linha do ponteiro
  stroke(255); // indica a cor da linha do ponteiro 
  float angleSeconds = radians(s); //define uma variavel para angleSeconds e converte-a para radianos
  
pushMatrix(); //indica que vai ser imposto um novo sistema de coordenação
  rotate(angleSeconds); // indica a rotação
  line (0,0, pos1, pos2); // desenho da linha do ponteiro
  
  fill(0); // cor de preenchimento da elipse
  noStroke(); // indica que a elipse nao terá linha de contorno
  ellipse (pos3,pos4,10,10); // desenho da elipse
popMatrix();//indica que vai voltar ao sistema de coordenação anterior

 // M
  // vou criar estas variaveis de posições para poder associar o centro das elipses à posição do ponto da extremidade do ponteiro
  float pos5 = 0; // atribui uma variavel para uma posição que é igual a zero
  float pos6 = -160; // atribui uma variavel para uma posiçao que é igual a menos cento e sessenta
  float pos7;  // atribui uma variavel para uma posição
  float pos8; // atribui uma variavel para uma posição
 
  pos7 = pos5; // indica que a pos7 vai coincidir com a posição de pos5
  pos8 = pos6; // indica que a pos8 vai coincidir com a posição de pos6
  
  strokeWeight(2); // indica a expessura da linha do ponteiro
  stroke(255); //indica a cor da linha do ponteiro
  float angleMinuts = radians(m); //define uma variavel para angleMinuts e converte-a para radianos
  
pushMatrix(); //indica que vai ser imposto um novo sistema de coordenação
  rotate(angleMinuts); //indica a rotação
  line (0,0, pos5, pos6); // desenho da linha do ponteiro
  fill (0); // cor da linha do ponteiro
  noStroke (); // indica que a elipse nao terá linha de contorno
  ellipse (pos7, pos8, 15,15); // desenho da elipse
popMatrix (); //indica que vai voltar ao sistema de coordenação anterior


  // horas
  // vou criar estas variaveis de posições para poder associar o centro das elipses à posição do ponto da extremidade do ponteiro
  float pos9 = 0; // atribui uma variavel para uma posição que é igual a zero
  float pos10 = -100; // atribui uma variavel para uma posiçao que é igual a menos cem
  float pos11; // atribui uma variavel para uma posição
  float pos12; // atribui uma variavel para uma posição
  
  pos11 = pos9; // indica que a pos11 vai coincidir com a posição de pos9
  pos12 = pos10; // indica que a pos12 vai coincidir com a posição de pos10
  
  strokeWeight(2); // indica a expessura da linha do ponteiro
  stroke(255); // indica a cor da linha do ponteiro
  float angleHours = radians(h); // define uma variavel para angleHours e converte-a para radianos
  
pushMatrix(); //indica que vai ser imposto um novo sistema de coordenação
  rotate(angleHours);
  line (0,0, pos9, pos10); // desenho da linha do ponteiro
  fill(0); // cor de preenchimento da elipse
  noStroke(); // indica que a elipse nao terá linha de contorno
  ellipse (pos11,pos12,20,20); // desenho da elipse
popMatrix(); // indica que vai voltar ao sistema de coordenação anterior


// Aqui vou desenhar pequenos traços na posição das 12, 3, 6 e 9 horas para que facilite a leitura das horas
stroke(0); // indica a cor do traço
strokeWeight(2); // indica a expessura do traço
line (0,-240,0,-235); // desenho do traço

stroke(0); // indica a cor do traço
strokeWeight(2); // indica a expessura do traço
line (0,240,0,235); // desenho do traço

stroke(0); // indica a cor do traço
strokeWeight(2); // indica a expessura do traço
line (-240,0,-235,0); // desenho do traço

stroke(0); // indica a cor do traço
strokeWeight(2); // indica a expessura do traço
line (240,0,235,0); // desenho do traço

}
