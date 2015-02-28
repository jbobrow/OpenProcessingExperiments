
/*********************************
 composição relogio
 
 Carlos Pereira - nª26539 - Design Multimedia
 o relogio esta com problemas quando chega a meia noite.. 0 0 0 os valores dao problemas
 o codigo torna-se muito repititivo, nao consegui simplificar
 *********************************/
 
import ddf.minim.*;//importa as livrarias
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim; //cria uma nova variavel associada à biblioteca minim 
Minim aumenta; // cria outra nova variavel associada à biblioteca minim 
AudioSample som_1; //exportaççao da musica que escolhi
AudioSample som_2;//exportaççao da musica que escolhi

AudioInput in; //atribui á variavel in um novo input de som

float escala; //declara a variavel escala
float volume; //declara a variavel volume
float getIn; //declara a variavel getIn

int seconds; //variavel para o som para funcionar com os segundos
int secondsBeat;//variavel para o som para a batida do som
int LASTSECOND;

int minutes;//variavel para o som para funcionar com os segundos
int minutesBeat;//variavel para o som para a batida do som
int LASTMINUTE;

/*difinições do setup*/
void setup() {//dentro deste codigo irei estabelecer o que quero como base
  size (700, 700);//tamanho da janela predefenido
  smooth();//suavizar o traço

  background (255);//cor do brackground
 minim = new Minim(this);
 aumenta = new Minim(this);
som_1 = minim.loadSample("click.wav"); // processo para exportar o som
som_2 = minim.loadSample("sax.wav");// processo para exportar o som

escala=400; //atribui á variavel escala o valor 400
in = aumenta.getLineIn(Minim.MONO, 128); //atribui a variavel in um input de som de microfone com buffersize de 128

minim.debugOn();

seconds = 0;// começa no zero
minutes = 0;// começa no zero
secondsBeat =1;//uma batida nos segundos
minutesBeat =1;//uma batida nos minutos
}//fechar setup

void draw() {//o que vou desenhar
  seconds = second();//variavel do som igual aos segundos
minutes = minute();//variavel do som igual aos minutos

getIn = abs(in.left.get(0)); //atribui a variavel getin o valor absoluto do volume recebi do microfone
volume = abs (getIn*escala); //atribui a varioavel volume o valor absoluto da multiplicaçao da escala pelo input do micro

if (LASTSECOND+1 == seconds) {//se os lastsecond mais um foi igual aos segundos faz:
som_1.trigger();// faz este som

} 
LASTSECOND = seconds; //lastSecond

if (LASTMINUTE+1 == minutes) {//se os lastminute mais um foi igual aos segundos faz:
som_2.trigger();//este som que pretendo

}

LASTMINUTE = minutes; //lastMinute
 
  int s=second();// numero inteiro designado para os segundos
  int m=minute();// numero inteiro designado para os minutos
  int h=hour();// numero inteiro designado para as horas
  int d=day();// numero inteiro designado para os dias
  int sm= s;// numero inteiro designado para os segundos segunda vez
  int mm= m;// numero inteiro designado para os minutos segunda vez
  int hm= h;// numero inteiro designado para as horas segunda vez
  int dm= d;// numero inteiro designado para os dias segunda vez
  
 
  colorMode(HSB, 360, 100, 100);/* o colormode altera a forma como o programa processa a interpretação
   dos dados das cores. onde o utilizo deste caso o fill() e assim valores que atribuir serao de acordo
   a este sistema--  HSB - Hue Saturation Brightness*/
  PFont myFont;//fonte carregada
  PFont myFont2;//fonte carregada

  /* variavel*/
  myFont = loadFont ("AvantGardeITCbyBT-Book-48.vlw");//carrega-se a fonte que pretendo usar
  myFont2 = loadFont ("MicrosoftTaiLe-Bold-40.vlw");//carrega-se a fonte que pretendo usar

textAlign(LEFT,BOTTOM); //alinha o texto a esquerda e no fundo, porque mais tarde com a animaçao o texto é alterado

  sm=(int) map (s, 0, 59, 0, width);/*o map é onde é atribuida a cor para os segundos
   e indica que existem 60 segundos*/
  m=(int) map (m, 0, 59, 0, width);/*o map é onde é atribuida a cor para os minutos
   e indico que existem 60 minutos*/
  h=(int) map (h, 0, 23, 0, width);/*o map é onde é atribuida a cor para as horas
   e indico que existem 24 horas*/
  d=(int) map (d, 0, 31, 0, width);/*o map é onde é atribuida a cor para aos dias
   e indico que existem 30 dias*/


  int sh= (int) map (sm, 0, width, 0, 360);/* crio outra varivel com o segundos, para colocar
   uma nova cor enquanto os segundos "andam"*/
  fill(sh, 100, 100);//atribu-o a cor de acordo com o HSB
  noStroke();//sem traço
  rectMode(CENTER);//o ponto de referencia do rectangulo é o centro
  rect(width/2, height/2, 700, 700);//crio o rectangulo

  int mh= (int) map (mm, 0, 360, 120, 240);/* crio outra varivel com o minutos, para colocar
   uma nova cor enquanto os minutos "se vai criando"*/

  rect(width/2, height/2, 620, 620);//o que vou fazer .. rectangulo

  int hh= (int) map (hm, 0, 360, 240, 360);/* crio outra varivel com as horas, para colocar
   uma nova cor enquanto as horas "se desenvolvem"*/

  int dh= (int) map (dm, 0, 360, 0, 360);/* crio outra varivel com os dias, para colocar
   uma nova cor enquanto passam os dia*/

  noFill();//sem preenchimento
  strokeWeight(2);//tamanho da espessura do traço


  /********* SEGUNDOS *****/
  /* numero de segundos */
  for ( int x = 1; x < 16; x++)/*se x for igual a um este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 15, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem da esquerda para a direita*/
  { 
    if (x > s) //se x maior que s acontece isto : cor de fundo igual
    { 
      fill(sh, 100, 100);  //cor como indiquei
    } 
    else// se nao for faz isto :
    {      
      fill(sh, 100, 100);//cor como indiquei
      rect(width/2, height/2, 700, 700);//crio o rectangulo
      fill(360); //rectangulos brancos
      rect ((x*42.5)+10.5, 0, 30.5, 70);/*atribuindo o x para fazer o intervalo entre os rectangulos,
       como possisao de x, width*/
      println(s);//imprimir valores dos segundos
      /*fill (0,0,0);//cor que pretendo para o texto
       textFont(myFont, 10);//tipo de fonte a usar-defenido em cima, e o tamanho da letra
       text(s, (x*42.5)+10.5, 40);*/
      fill (0);//cor preta
      textFont(myFont2, 25);//exporta a fonte pretendida
      text( s, (x*42.5)-4, 34);
    }
  } //fechar for

  for ( int x = 16; x < 31; x++)/*se x for igual a 16 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 30, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para a baixo*/
  {
    if (x > s) //se x maior que s acontece isto : cor de fundo igual
    {
      fill(sh, 100, 100);//cor como indiquei
    } 
    else// se nao for faz isto :
    {
      fill(sh, 100, 100);//cor como indiquei
      rect(width/2, height/2, 700, 700);//crio o rectangulo
      fill(360);//rectangulos brancos
      rect (height, (x*42.5)-width+72, 70, 32);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de y, height, para ir descendo*/
      fill (0);
      textFont(myFont2, 25);
      text( s, 669, (x*42.5)-height+90);
    }
  }//fechar for
  for ( int x = 31; x < 46; x++)/*se x for igual a 31 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 45, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de esquerda para a direita*/
  {
    if (x > s) //se x maior que s acontece isto : cor de fundo igual
    {
      fill(sh, 100, 100);//cor como indiquei
    }
    else// se nao for, faz isto :
    { 
      fill(sh, 100, 100);//cor como indiquei
      rect(width/2, height/2, 700, 700);//crio o rectangulo   
      fill(360);//rectangulos brancos
      rect ((x*-42.5)+1966, 700, 32, 70); /*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de x width*/
      fill (0);
      textFont(myFont2, 25);
      text( s, (x*-42.5)+1951, 700);
    }
  }//fechar for

  for ( int x = 46; x < 60; x++)/*se x for igual a 45 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 59, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para a baixo(embora nao o consegui fazer, o que pretendia
   era que fosse de baixo para a cima*/
  {
    if (x > s) //se x maior que s acontece isto : cor de fundo igual
    { 
      fill(sh, 100, 100);
    }//cor como indiquei HSB
    else// se nao for faz isto :
    { 
      fill(sh, 100, 100);//cor como indiquei
      rect(width/2, height/2, 700, 700);//crio o rectangulo
      fill(360); //rectangulos brancos 
      rect (height-700, (x*-45)+2715, 70, 35);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de y height*/
      fill (0);
      textFont(myFont2, 25);
      text( s, 2, (x*-45)+2732);
    }
  }//fechar for

  //*********Segundos******

  for ( int x = 1; x < 16; x++)/*se x for igual a um este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 15, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem da esquerda para a direita*/
  { 
    noFill(); //rectangulos vazios
    stroke(2);//espessura do traço
    rect ((x*42.5)+10.5, 0, 30.5, 70);/*atribuindo o x para fazer o intervalo entre os rectangulos,
     como possisao de x, width*/
  } //fechar for

  for ( int x = 16; x < 31; x++)/*se x for igual a 16 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 30, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para a baixo*/
  {
    noFill(); //rectangulos vazios
    stroke(2);//espessura do traço
    rect (height, (x*42.5)-width+72, 70, 32);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
     como possiçao de y, height, para ir descendo*/
  }//fechar for
  for ( int x = 31; x < 46; x++)/*se x for igual a 31 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 45, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de esquerda para a direita*/
  {   
    noFill(); //rectangulos vazios
    stroke(2);   //espessura do traço
    rect ((x*-42.5)+1966, 700, 32, 70); /*atribuindo o x para fazer o intervalo entre os rectangulos, 
     como possiçao de x width*/
  }//fechar for

  for ( int x = 46; x < 60; x++)/*se x for igual a 45 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 59, conforme os segundos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para a baixo(embora nao o consegui fazer, o que pretendia
   era que fosse de baixo para a cima*/
  {
    noFill(); //rectangulos vazios
    stroke(2); //espessura do traço
    rect (height-700, (x*-45)+2715, 70, 35);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
     como possiçao de y height*/
  }//fechar for

  //minutos
  int m2 = minute();//variavel nova para os minutos
  for ( int x = 1; x < 16; x++)/*se x for igual a 1 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 15, conforme os minutos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de esquerda para a direita*/
  {
    if (x > m2) //se x maior que m acontece isto : cor de fundo igual
    {
      fill(mh, 100, 100);//cor como indiquei
    } 
    else// se nao for faz isto :
    {
      fill(360);//rectangulos brancos 
      rect ((x*35.9)+63, 64, 30, 37.5);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de x width*/
    }
  }//fechar for

  for ( int x = 16; x < 31; x++)/*se x for igual a 16 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 30, conforme os minutos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para baixo*/
  {
    if (x > m2) //se x maior que m acontece isto : cor de fundo igual
    {
      fill(mh, 100, 100);//cor como indiquei HSB
    }
    else// se nao for faz isto :
    {
      fill(360);//rectangulos brancos 
      rect (636.5, (x*35.9)-476, 37.5, 30);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de y,height*/
    }
  }//fechar for

  for ( int x = 31; x < 46; x++)/*se x for igual a 31 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 14, conforme os minutos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem da esquerda para a direita(embora pretendesse que fosse ao contrario, 
   mas n consegui)*/
  {
    if (x > m2) //se x maior que m acontece isto : cor de fundo igual
    {
      fill(mh, 100, 100);//cor como indiquei
    }
    else// se nao for faz isto :
    { 
      fill(360);//rectangulos brancos 
      rect ((x*-35.9)+1714, 636.5, 30, 37.5); /*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de x, width*/
    }
  }//fechar for
  for ( int x = 46; x < 60; x++)/*se x for igual a 46 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 59, conforme os minutos.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para baixo(embora pretendesse que fosse ao contrario, 
   mas n consegui)*/
  {
    if (x > m2) //se x maior que m acontece isto : cor de fundo igual
    { 
      fill(mh, 100, 100);
    }//cor como indiquei HSB
    else// se nao for, faz isto :
    { 
      fill(360);  //rectangulos brancos 
      rect (63, (x*-38.3)+2360, 38, 32);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de y,height*/
    }
  }//fechar for

  //horas

  int h2 = hour();//variavel nova para as horas
  for ( int x = 1; x < 7; x++)/*se x for igual a 1 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 6, conforme as horas.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de esquerda para a direita*/
  {
    if (x > h2) //se x maior que h acontece isto : cor de fundo igual
    {
      fill(hh, 100, 100);//cor como indiquei
    }
    else // se nao for faz isto :
    {
      fill(360);//rectangulos brancos 
      rect ((x*63)+130, 130, 43, 80);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de x ,width*/
    }
  }//fechar for

  for ( int x = 7; x < 13; x++)/*se x for igual a 7 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 12, conforme as horas.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para baixo*/
  {
    if (x > h2) //se x maior que h acontece isto : cor de fundo igual
    {
      fill(hh, 100, 100);//cor como indiquei
    }
    else// se nao for faz isto :
    {
      fill(360);//rectangulos brancos 
      rect (570, (x*63)-249, 79, 43);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de y, height*/
    }
  }//fechar for


  for ( int x = 13; x < 19; x++)/*se x for igual a 13 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 18, conforme as horas.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de esquerda para a direita(embora pretendesse que fosse ao contrario, 
   mas n consegui)*/
  {
    if (x > h2) //se x maior que h acontece isto : cor de fundo igual
    {
      fill(hh, 100, 100);//cor como indiquei HSB
    }
    else// se nao for faz isto :
    { 
      fill(360);//rectangulos brancos 
      rect ((x*-63)+1325, 570, 43, 79); /*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de x ,width*/
    }
  }//fechar for

  for ( int x = 19; x < 24; x++)/*se x for igual a 19 este for faz um rectangulo, 
   onde o mando colocar e assim sucessivamente ate 24, conforme as horas.
   se nao a cor que faz é igual ao fundo que se encontra dentro dos respectivos rectangulos
   indo numa ordem de cima para a baixo(embora pretendesse que fosse ao contrario, 
   mas n consegui)*/
  {
    if (x > h2)//se x maior que h acontece isto : cor de fundo igual
    { 
      fill(hh, 100, 100);
    }//cor como indiquei HSB
    else// se nao for faz isto :
    { 
      fill(360);  //rectangulos brancos 
      rect (132, (x*-63)+1703, 79, 45);/*atribuindo o x para fazer o intervalo entre os rectangulos, 
       como possiçao de y, height*/
    }//fechar for
  }
  
 // ellipse(height/2,width/2,100+volume,100+volume);

  int d2 = day();//variavel nova para os dias
  fill (0, 0, 0);//cor que pretendo para o texto
  textAlign(CENTER,CENTER);//alinha o texto no centro, neste caso quando aumenta
  textFont(myFont, 50+volume);//tipo de fonte a usar-defenido em cima, e o tamanho da letra que aumenta consoante o input
  text(d2, width/2+50, height/2+100);/*texto que pretendo escrevre os dias,
   juntamente com a sua posição*/
   text("Dia",width/2-50, height/2+100);// onde se insere  palavra dia

  text(h2, width/2-90, height/2-45);/*texto que pretendo escrevre as horas ,
   juntamente com a sua posição*/

  text(m2, width/2+100, height/2-45);/*texto que pretendo escrevre os minutos,
   juntamente com a sua posição*/
  noStroke();
  rectMode(CENTER);//rectangulos a começar no centro e nao na esquerda ou a direita
  rect (height/2, width/2-20, 10+volume, 10+volume);//rectantgulos que aumenta consoante o input
  rect (height/2, width/2-55, 10+volume, 10+volume);//rectantgulos que aumenta consoante o input

  fill(0, 0, 0, 50); // cor para o rectangulo mais escuro, nos segundos
  rect ((10*42.5)+10.5, 0, 30.5, 70); //rectagulo onde esta designado os 10 segundos
  rect (height, (20*42.5)-width+72, 70, 32);//rectagulo onde esta designado os 20 segundos
  rect (height, (30*42.5)-width+72, 70, 32);//rectagulo onde esta designado os 30 segundos
  rect ((40*-42.5)+1966, 700, 32, 70);//rectagulo onde esta designado os 40 segundos
  rect (height-700, (50*-45)+2715, 70, 35);//rectagulo onde esta designado os 50 segundos
  
  
}//fechar for e void draw


