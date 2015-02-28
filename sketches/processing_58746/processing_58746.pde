
/*********************************
 composição Iteration
 
 objectivo - criar uma paleta de core que va do vermolho ao ver e do ver ao vermelho. e enquanto isto acontece
 os quadrados vao-se transformando em circulos
 
 Parte da ideia do codigo que o professor colocou na internet na secção do metodo iterativo,
 em baixo esta mencionado a parte do codigo que copiei.
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/


int ntotaldeobjectos; //numero inteiro - nº total de objectos(para os circulos e rectangulos)
/*converte um dado primitivo é um representação inteira
neste caso o numero total de objectos*/

/*variaveis*/

float pX, pY; //sao as variaveis para a posição horizontal e vertical dos objectos
float t; // variavel para o tamanho dos rectangulos e circulos 
float r, g, b; // a variavel para a palete de cores dos objectos

/*definições de setup*/
void setup() { //dentro deste codigo irei estabelecer o que quero como base

  size(600, 500);//tamanho da janela
  background (0); //cor de fundo, neste caso, preto
  smooth();//torna o traço suave - suaviza o desenho.
  noLoop();//nao fazer loop, portanto fica uma imagem estatica

  ntotaldeobjectos = 300;// numero total de objectos que quero, neste caso 300 circulos e rectangulos.
  //tendo assim o controlo do loop, predefenindo o numero de objectos.
}//fechar setp


void draw() { // o que vou desenhar 

  colorMode(HSB, 360, 100, 100); /* o colormode altera a forma como o programa processa a interpretação
  dos dados das cores. onde o utilizo deste caso o fill() e assim valores que atribuir serao de acordo
  a este sistema--  HSB - Hue Saturation Brightness*/

   for ( int i = 0; i <ntotaldeobjectos; i++) { /* criei um ciclo for, para que cada vez que fizer
   um objecto, o faça da maneira como pretendo, neste caso vou criar o rectangulos, onde da esquerda 
   para a direita aumentam de tamanho e ao mesmo tempo criam uma paleta de cor desde o vermelho 
   ate ao verde*/

    /*o valor das variaveis*/

    /********************codigo identico ao exercico do prf. Rudolfo*******************/

    // gerar uma posição com base na iteração "i"
    pX = i;// criar um numero para posição horizonral 
    pY = random (height/2-200, height/2+200 ); // criar um numero para posição vertical
    t = map ( i, 0, ntotaldeobjectos, 0, 100); /*o map é um codigo que concebe um numero de um 
    intervalo para o outro, neste caso o intervalo vai de 0.. a 100, em um valor que varia da
    esqueda para a direita, neste caso quando varia de cor vai aumentando*/

    /******************************fim de codigo copiado*****************************/

    noStroke(); //objectos sem traço (stroke)

    fill(t, 100, 100, 80); /*tendo em conta o sistema de cor HSB os valores 100 é para a 
     saturação e o brilho, o 80 é para o alpha, o d esta defenido em cima como map*/

    rectMode(CENTER);//o ponto central do rectanculo é o que importa, e nao onde começa o rectangulo 
    rect ( pX, pY, t, t); /* desenho dos rectangulos com os valores criados pela variavel d, com as posiçoes
     das variaveis pX e pY*/
  } //fechar ciclo

  for ( int i = 0; i <ntotaldeobjectos; i++) { /* criei outro ciclo for, para os circulos, assim o processo
   serao ao contrario, ou seja, os circulos diminuem de tamanho da esquerda para a direita, enquando que 
   a cor vai ficando vermelha, no sentido da paleta de cores*/

    /*o valor das variaveis*/
    
    /********************codigo identico ao de cima*******************/

    pX = i+width/2; // numero para posição horizonral 
    pY = random (height/2-200, height/2+200); // numero para posição vertical
    t = map ( i, 0, ntotaldeobjectos, 100, 0); /* repetindo o que disse em cima o map é um codigo 
    que concebe um numero de um intervalo para o outro, neste caso o intervalo vai de 100.. a 0,
    em um valor que varia da esqueda para a direita, neste caso quando varia de cor vai diminuindo*/

    /******************************fim de codigo copiado*****************************/

    noStroke();// repetindo o que disse em cima, objectos sem traço (stroke)
    fill(t, 100, 100, 80);/*repetindo o que disse em cima, tendo em conta o sistema de cor
     HSB os valores 100 é para a saturação e o brilho, o 80 é para o alpha, o d esta defenido
     em cima como map*/
    ellipse ( pX, pY, t, t); /* desenha das elipses com os valores criados pela variavel d, com as posiçoes
     das variaveis pX e pY*/
  } //fechar ciclo

  saveFrame("Iteration.jpg"); //codigo para guardar a imagem, apenas uma

}//fechar draw


