
/*********************************
 composição Layers
 
 objectivo - criar 3 bounding boxes, onde a primeira sera preenchida por rectangulos,
 a sugunda por circulos e a terceiro por rectangulos de igual forma
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/
 
 int a; // numero total de objectos rectangulos e circulos
 
 /*converte um dado primitivo é um representação inteira
 neste caso o numero total de objectos - a*/
 
/*variaveis*/
float pX, pY; // variaveis para a posição horizontal e vertical dos circulos
float c; // variavel para o tamanho dos circulos e dos rectangulos
float r, g, b; // variaveis para a cor
float d, e, d2, h; // variaveis para controlar os limites horizontais e verticais
float f; // variavel para controlar a espessura da linha (traço)

/*difinições do setup*/
void setup() { //dentro deste codigo irei estabelecer o que quero como base

   size (800, 500);//define o tamanho da janela
  background (0);//define a cor de fundo, neste caso preto
  //igual se fosse (0,0,0)
  smooth ();//torna o traço suave, suaviza o desenho
  noLoop(); //apenas um imagem estactica.nao fazer loop

  a = 300; //numero total de objectos 200
  d = 50; //numero que controla o limite horizontal 50
  h = 120; //numero que controla o limite horizontal 120
  e = 220; //numero que controla o limite vertical 220
  d2 = 150; //numero que controla o limite horizontal 150
}//fechar setuo


void draw() { //o que vou desenhar
  for ( int i = 0; i <a; i++){ /*faço um ciclo for para criar a primeira caixa de rectangulos
  onde ira desenhar rectangulos grandes e pequenos com cores e posiçoes aleatorias, mas os 
  rectangulos mais pequenos estarao no centro dos maiores e com a cor branca*/
    
    pX = random ((width/10)-d,(width/10)+h); //variavel para aposição aleatoria de X mais a esquerda para os rectangulos
    pY = random (height/2-e,height/2+e); //variavel para a posição aleatoria de Y mais a esquerda para os rectangulos
    c = random (5,50);//variavel com o tamanho varia entre 5 e 50
    r = random(255); //variavel com o valor para a cor vermelha entre 0 e 255
    g = random(255); //variavel com o valor para a cor verde entre 0 e 255
    b = random(255); //variavel com o valor para a cor azul entre 0 e 255
    f = random (1, 5); //variavel com o valor para a espessura da linha (outline/stroke)
 
 
 strokeWeight(f);//determina a espessura do traço, ou seja de 1 a 5
     fill(r,g,b); //cor atribuida aos rectangulos maiores
     rectMode(CENTER); //o ponto central do rectanculo é o que importa, e nao onde começa o rectangulo 
     rect(pX,pY,c,c);// desenho rectangulo, tendo em conta aos valores das variveis em cima
     fill(255);// cor atribuida para os rectangulos mais pequenos, branco
     rect(pX,pY,c/2,c/2); // desenho rectangulo, tendo em conta aos valores das variveis em cima
  }//fechar ciclo
  
  /* a partir de aqui alguns codigos sao semelhantes aos de cima*/
  
   for ( int i = 0; i <a; i++){ /* crio outro ciclo for para os circulos, onde se encontraram 
   de uma maneira aleatoria no centro da janela.. ou seja mais ou menos height /2 e width /2.
   onde os circulos terao outlines de espessuras diferentes e todos os objectos tera 50 % de alpha*/
    
    pX = random (width/2-d2,width/2+d2); //variavel para aposição aleatoria no centro de X para os circulos
    pY = random (height/2-e,height/2+e); //variavel para aposição aleatoria no centro de Y para os circulos
    c = random (5,50);//variavel com o tamanho varia entre 5 e 50
    r = random(255); //variavel com o valor para a cor vermelha entre 0 e 255
    g = random(255); //variavel com o valor para a cor verde entre 0 e 255
    b = random(255); //variavel com o valor para a cor azul entre 0 e 255
    f = random (1, 10); //variavel com o valor para a espessura da linha (outline/stroke)
 
 
 strokeWeight(f);//determina a espessura do traço, ou seja de 1 a 10
     fill(r,g,b,50);//cor atribuida aos circulos com 50% de alpha
     ellipse ( pX,pY, c, c);// desenho circulo, tendo em conta aos valores das variveis em cima
  }//fechar ciclo
  
  /***codigo que vai fazer exactamente o mesmo que o primeiro ciclo for so que noutra posição*/
  for ( int i = 0; i <a; i++){/* semelhante ao primeiro ciclo for, apenas se diferenciara nas posiçoes dos rectangulos
  serao mais a direita, nao saindo da janela e nao tocando nos circulos que se encontram no centro*/
    
    pX = random (d+(width-width/4)-d,d+(width-width/4)+120);//variavel para aposição aleatoria de X mais a deireita para os rectangulos
    pY = random (height/2-e,height/2+e); //variavel para a posição aleatoria de Y mais a direita para os rectangulos
    c = random (5,50);//variavel com o tamanho varia entre 5 e 50
    r = random(255); //variavel com o valor para a cor vermelha entre 0 e 255
    g = random(255); //variavel com o valor para a cor verde entre 0 e 255
    b = random(255); //variavel com o valor para a cor azul entre 0 e 255
    f = random (1, 5); //variavel com o valor para a espessura da linha (outline/stroke)
 
 
 strokeWeight(f);//determina a espessura do traço, ou seja de 1 a 5
     fill(r,g,b); //cor atribuida aos rectangulos maiores
     rectMode(CENTER); //o ponto central do rectanculo é o que importa, e nao onde começa o rectangulo 
     rect(pX,pY,c,c);// desenho rectangulo, tendo em conta aos valores das variveis em cima
     fill(255);// cor atribuida para os rectangulos mais pequenos, branco
     rect(pX,pY,c/2,c/2); // desenho rectangulo, tendo em conta aos valores das variveis em cima
  }//fechar ciclo
   saveFrame("Bounding_Boxes.jpg"); //codigo para guardar a imagem, apenas uma
}//fechar draw

