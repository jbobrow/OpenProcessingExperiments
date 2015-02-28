
//Briefing_2 - Relógio
//Guilherme Bentes

int s; //declara uma variável "s"do tipo int.
int m; //declara uma variável "m"do tipo int. 
int h; //declara uma variável "h"do tipo int.
PFont myFont; //cria uma fonte com o nome "myFont".

void setup(){ //função que define as propriedades iniciais da aplicação.
  size(660,200); //função que define o tamanho da janela, em pixeis.
  smooth(); //função de suavização daas margens dos objectos.
   
  myFont = createFont("Aharoni-Bold-48",50);  //função que carrega a fonte criada.
  textFont(myFont, 20); //função que define a fonte que vai ser usada no texto e o seu tamanho.
  
}  

void draw(){
  background(240); //função que define a cor de fundo.
 
  s=second(); //associação da variável "s" à função second(), que dá o valor actualizado dos segundos.
  m=minute();//associação da variável "m" à função minute(), que dá o valor actualizado dos minutos.
  h=hour(); //associação da variável "h" à função hour(), que dá o valor actualizado das horas.
    
  //Segundos:
  //é criado um ciclo for que começa em x=1 e vai criando elipses até x<60.
  for (int x=1; x<60; x=x+1)
  {
    //dentro do ciclo é criada uma condição através das funções if/else.
    //se o valor de x for maior que o de s, as elipses não têem preenchimento.
        if( x > s)
        {
          noFill(); //função que retira o preenchimento das elipses.
        }
    //à medida que o valor de "s" aumenta, as elipses vão sendo preenchidas com uma cor verde.
        else
        {
             fill(30,200,100); //função que atribui a cor verde às elipses.
        }   
        
          ellipse(x*10 +40,height/4*3,8,8); //função que cria as elipses.  
  }
   
  //Minutos: 
  //o processo usado nos segundos é igual para os minutos.
  //é criado o ciclo for até x<60, que cria 59 elipses, uma para cada minuto.
  for (int x=1; x<60; x=x+1)
  {
   //é criada a condição para o preenchimento das elipses, desta vez relacionando x com m.   
  if( x > m )
  {
    noFill();
  }
  
  else{
       fill(30,200,150);
     }
    ellipse(x*10+40,height/2,8,8);
  }
  
  //horas:
  //o processo é semelhante para as horas. Cria-se o ciclo for até x<24, para que sejam criadas apenas 23 elipses, uma para cada hora.
  //as elipses vão sendo preenchidas à medida que h (a variável das horas) aumenta.
  for (int x=1; x<24; x=x+1)
  {
  if( x > h )
  {
    noFill();
  }
  
  else{
       fill(30,150,200);
     }
     ellipse(x*26+28,height/4,12,12); 
    }
    
//texto:   
//utiliza-se a função text(), para mostrar o valor de "s","m" e "h" em números. 
//as funções fill() definem a cor de cada texto.

    fill(30,200,100);
    text(s,10,height/4*3+5);
    
    fill(30,200,150);
    text(m,10,height/2+5);
    
    fill(30,150,200);
    text(h,10,height/4+5);

//com a função line(), cria-se uma linha vertical para marcar o fim das linhas de elipses.
    stroke(200); //define a cor do traço.
    strokeWeight(4); //define a grossura do traço.
    line(640,height/5*4,640,height/5);
    
    noStroke(); //esta função retira o traço dos outros objectos.
    
}  

