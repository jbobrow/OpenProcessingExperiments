
/*********************************
 composição relogio
  
 Carlos Pereira - nª26539 - Design Multimedia
 o relogio esta com problemas quando chega a meia noite.. 0 0 0 os valores dao problemas
 o codigo torna-se muito repititivo, nao consegui simplificar
 *********************************/

/*difinições do setup*/
void setup() {//dentro deste codigo irei estabelecer o que quero como base
  size (700, 700);//tamanho da janela predefenido
  smooth();//suavizar o traço
}//fechar setup

void draw() {//o que vou desenhar

  background (255);//cor do brackground
  colorMode(HSB, 360, 100, 100);/* o colormode altera a forma como o programa processa a interpretação
  dos dados das cores. onde o utilizo deste caso o fill() e assim valores que atribuir serao de acordo
  a este sistema--  HSB - Hue Saturation Brightness*/

  int s=second();// numero inteiro designado para os segundos
  int m=minute();// numero inteiro designado para os minutos
  int h=hour();// numero inteiro designado para as horas
  int d=day();// numero inteiro designado para os dias


  s=(int) map (s, 0, 59, 0, width);/*o map é onde é atribuida a cor para os segundos
  e indica que existem 60 segundos*/
  m=(int) map (m, 0, 59, 0, width);/*o map é onde é atribuida a cor para os minutos
  e indico que existem 60 minutos*/
  h=(int) map (h, 0, 23, 0, width);/*o map é onde é atribuida a cor para as horas
  e indico que existem 24 horas*/
  d=(int) map (d, 0, 30, 0, width);/*o map é onde é atribuida a cor para aos dias
  e indico que existem 30 dias*/

  
  int sh= (int) map (s, 0, width, 0, 120);/* crio outra varivel com o segundos, para colocar
  uma nova cor enquanto os segundos "andam"*/
  fill(sh, 100, 100);//atribu-o a cor de acordo com o HSB
  noStroke();//sem traço
  rectMode(CENTER);//o ponto de referencia do rectangulo é o centro
  rect(width/2, height/2, 700, 700);//crio o rectangulo

  int mh= (int) map (m, 0, 360, 120, 240);/* crio outra varivel com o minutos, para colocar
  uma nova cor enquanto os minutos "se vai criando"*/
  fill(mh, m*750, m*750);//atribu-o a cor de acordo com o HSB
  stroke(0);//com traço
  strokeWeight(10);//espessura do traço
  rect(width/2, height/2, 520, 520);//o que vou fazer .. rectangulo

  int hh= (int) map (h, 0, 360, 240, 360);/* crio outra varivel com as horas, para colocar
  uma nova cor enquanto as horas "se desenvolvem"*/
  fill(hh, h*1000, h*1000);//atribu-o a cor de acordo com o HSB
  rect(width/2, height/2, 342, 342);//crio mais um rectangulo

  int dh= (int) map (d, 0, 360, 0, 360);/* crio outra varivel com os dias, para colocar
  uma nova cor enquanto passam os dia*/
  fill(dh, d*1000, d*1000);//atribu-o a cor de acordo com o HSB
  rect(width/2, height/2, 200, 200);//crio o rectangulo mais central

  noFill();//sem preenchimento
  strokeWeight(2);//tamanho da espessura do traço
  
//*********segundos

  for ( int x = 1; x < 16; x++)/*se x for igual a um este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 15, conforme os segundos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem da esquerda para a direita*/
  { if (x > s) //se x maior que s acontece isto : cor de fundo igual
    { fill(sh, 100, 100); //cor como indiquei
  } else// se nao for faz isto :
    {fill(360); //rectangulos brancos
    rect ((x*35)+70, 42, 40, 90);/*atribuindo o x para fazer o intervalo entre os rectangulos,
    como possisao de x, width*/
    println(s);//imprimir valores dos segundos
  }} //fechar for

  for ( int x = 16; x < 31; x++)/*se x for igual a 16 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 30, conforme os segundos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de cima para a baixo*/
  {if (x > s) //se x maior que s acontece isto : cor de fundo igual
    {fill(sh, 100, 100);//cor como indiquei
    } else// se nao for faz isto :
    {fill(360);//rectangulos brancos
    rect (height-40, (x*35)-width+245, 90, 40);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de y, height, para ir descendo*/
    }}//fechar for
  for ( int x = 31; x < 46; x++)/*se x for igual a 31 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 45, conforme os segundos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de esquerda para a direita(embora nao o consegui fazer, o que pretendia
  era que fosse da direita para a esquerda*/
  {if (x > s) //se x maior que s acontece isto : cor de fundo igual
    {fill(sh, 100, 100);//cor como indiquei
    }else// se nao for faz isto :
    { fill(360);//rectangulos brancos
    rect ((x*35)-980, 660, 40, 90);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de x width*/
  }}//fechar for

  for ( int x = 46; x < 60; x++)/*se x for igual a 45 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 59, conforme os segundos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de cima para a baixo(embora nao o consegui fazer, o que pretendia
  era que fosse de baixo para a cima*/
  {if (x > s) //se x maior que s acontece isto : cor de fundo igual
    { fill(sh, 100, 100); }//cor como indiquei HSB
    else// se nao for faz isto :
    { fill(360); //rectangulos brancos 
   rect (height-660, (x*37)-width-890, 90, 40);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de y height*/
    }}//fechar for
    
    //minutos
  for ( int x = 1; x < 16; x++)/*se x for igual a 1 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 15, conforme os minutos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de esquerda para a direita*/
  {if (x > m) //se x maior que m acontece isto : cor de fundo igual
    {fill(mh, m*750, m*750);//cor como indiquei
    } else// se nao for faz isto :
    {fill(360);//rectangulos brancos 
    rect ((x*23)+166, 135, 30, 80);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de x width*/
  }}//fechar for
  
  for ( int x = 16; x < 31; x++)/*se x for igual a 16 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 30, conforme os minutos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de cima para baixo*/
  {if (x > m) //se x maior que m acontece isto : cor de fundo igual
    {fill(mh, m*750, m*750);//cor como indiquei HSB
    }else// se nao for faz isto :
    {fill(360);//rectangulos brancos 
    rect (height-134, (x*23)-width+522, 80, 30);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de y,height*/
  }}//fechar for
  
  for ( int x = 31; x < 46; x++)/*se x for igual a 31 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 14, conforme os minutos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem da esquerda para a direita(embora pretendesse que fosse ao contrario, 
  mas n consegui)*/
  {if (x > m) //se x maior que m acontece isto : cor de fundo igual
    {fill(sh, 100, 100);//cor como indiquei
    }else// se nao for faz isto :
    { fill(360);//rectangulos brancos 
    rect ((x*23)-523, 565, 30, 80); /*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de x, width*/
  }}//fechar for

  for ( int x = 46; x < 60; x++)/*se x for igual a 46 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 59, conforme os minutos.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de cima para baixo(embora pretendesse que fosse ao contrario, 
  mas n consegui)*/
  {if (x > m) //se x maior que m acontece isto : cor de fundo igual
    { fill(sh, 100, 100); }//cor como indiquei HSB
    else// se nao for faz isto :
    { fill(360);  //rectangulos brancos 
   rect (height-565, (x*25)-width-262, 80, 30);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de y,height*/
  }}//fechar for

//horas
  for ( int x = 1; x < 7; x++)/*se x for igual a 1 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 6, conforme as horas.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de esquerda para a direita*/
  {if (x > h) //se x maior que h acontece isto : cor de fundo igual
    {fill(hh, h*1000, h*1000);//cor como indiquei
    }else // se nao for faz isto :
    {fill(360);//rectangulos brancos 
    rect ((x*34)+231, 216, 40, 62);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de x ,width*/
  }}//fechar for

  for ( int x = 7; x < 13; x++)/*se x for igual a 7 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 12, conforme as horas.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de cima para baixo*/
  {if (x > h) //se x maior que h acontece isto : cor de fundo igual
    {fill(hh, h*1000, h*1000);//cor como indiquei
    }else// se nao for faz isto :
    {fill(360);//rectangulos brancos 
    rect (height-214, (x*34)+27, 62, 40);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de y, height*/
  }}//fechar for
  
  
   for ( int x = 13; x < 19; x++)/*se x for igual a 13 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 18, conforme as horas.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de esquerda para a direita(embora pretendesse que fosse ao contrario, 
  mas n consegui)*/
  {
    if (x > h) //se x maior que h acontece isto : cor de fundo igual
    {fill(sh, 100, 100);//cor como indiquei HSB
    }else// se nao for faz isto :
    { fill(360);//rectangulos brancos 
    rect ((x*34)-176, 485, 40, 62); /*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de x ,width*/
  }}//fechar for

  for ( int x = 19; x < 24; x++)/*se x for igual a 19 este for faz um rectangulo, 
  onde o mando colocar e assim sucessivamente ate 24, conforme as horas.
  se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
  indo numa ordem de cima para a baixo(embora pretendesse que fosse ao contrario, 
  mas n consegui)*/
  {if (x > h)//se x maior que h acontece isto : cor de fundo igual
    { fill(sh, 100, 100); }//cor como indiquei HSB
    else// se nao for faz isto :
    { fill(360);  //rectangulos brancos 
   rect (height-485, (x*40)-495, 62, 45);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
    como possiçao de y, height*/
    }}}//fechar for e void draw


