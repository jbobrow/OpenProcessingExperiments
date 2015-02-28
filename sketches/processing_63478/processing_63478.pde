
import ddf.minim.*;
Minim minim;
AudioSample player_1; 
AudioSample player_2;
AudioSample player_3;
int s; // criacao de uma variavel para os segundos
int m; // criacao de uma variavel para os minutos
int h; // criacao de uma variavel para os horas

int hours;
int lasthours;
int hoursbeat;
int minutes;
int lastminutes;
int minutesbeat;
int seconds; 
int lastSecond; 
int secondsBeat; 


PFont myfont; // criaçao de uma variavel para o nome do tipo de letra utilizado

void setup() // abertura de um ficheiro
{
  size(500,500); //tamanho do ficheiro
  background(0); // fundo do ficheiro
  smooth(); //torna as superficies mais suavizadas
  
  minim = new Minim(this);
  player_1 = minim.loadSample("2084__opm__cp-set5.wav", 512);
  player_2 = minim.loadSample("atomwrath.wav", 512);
  player_3 = minim.loadSample("hardstyle-73.wav", 512);
  myfont = createFont("DanubeBold-48",50); // criaçao do tipo de letra
  
  s =0; // atribuimos o valo de inicio
  m =0; // atribuimos o valo de inicio
  h =0; // atribuimos o valo de inicio
  textFont(myfont,50); // definimos o tamanho da letra
  
  hours=0;
  hoursbeat=0;
  minutes=0;
  minutesbeat=1;
  seconds = 0; 
  secondsBeat = 1;
}

void draw() // abertura de uma zona de espaço
{
  background(0);
 
  // definimos novamente o fundo do ficheiro para que este se mantanha
  // o S vai guardar o actual valor do segundo
  // o  valor vai de 0 a 59
  seconds = second();
  minutes = minute();
  hours = hour();
  s=second(); // definimos qual a funçao das variaveis
  println(s); // definimos que queremos ver os valores do objecto especifico
  m = minute(); // definimos qual a funçao das variaveis
  h = hour(); // definimos qual a funçao das variaveis
  
  if (lastSecond+1 == seconds){
    player_1.trigger();
    
  }
    if (lastminutes+1 == minutes){
    player_2.trigger();
    
  }
      if (lasthours+1 == hours){
    player_3.trigger();
    
  }
  
if(seconds == secondsBeat) {
   player_1.trigger();
       // println("ttttt");
        
    secondsBeat = secondsBeat +1; 
  }
 
  lastSecond = seconds; 
  
  if(minutes == minutesbeat) {
   player_2.trigger();
       // println("ttttt");
        
    minutesbeat = minutesbeat +1; 
  }
 
  lastminutes = minutes;
  
    if(hours == hoursbeat) {
   player_3.trigger();
       // println("ttttt");
        
    hoursbeat = hoursbeat +1; 
  }
 
  lasthours = hours;
  
  
  
  noStroke(); // definimos que nao queremos linha de contorno
  fill(255,0,255,75); // definimos a cor a utilizar
  text( "H",  200-50, height/4-50); // definimos o que ira ser mostrado no texto
  fill(255,0,255); // definimos a cor a utilizar
  text( h,  200-60, height/4); // definimos o que ira ser mostrado no texto
  fill(255,0,255,75); // definimos a cor a utilizar
  stroke(random(255),random(255),random(255)); // definimos a cor do traço
  ellipse(width/4, height/2, h*10,h*10); // criamos uma ellipse 
  
  strokeWeight(1); // definimos a espessura do traço
  fill(255,0,0,75); // definimos a cor a utilizar
  text( "M",  260-40, height/4-50); // definimos o que ira ser mostrado no texto
  fill(255,0,0); // definimos a cor a utilizar
  text( m, 260-50, height/4); // definimos o que ira ser mostrado no texto
  fill(255,0,0,75); // definimos a cor a utilizar
  stroke(random(255),random(255),random(255));// definimos a cor do traço
  ellipse(width/2, 500-m*8, 100,100);  // criamos uma ellipse
  
  stroke(random(255),random(255),random(255));// definimos a cor do traço
  fill(255,175,0,75); // definimos a cor a utilizar
  text( "S", 330-40, height/4-50); // definimos o que ira ser mostrado no texto
  fill(255,175,0); // definimos a cor a utilizar
  text( s, 330-50, height/4); // definimos o que ira ser mostrado no texto
  fill(255,175,0,85); // definimos a cor a utilizar
  ellipse(width-width/4, 0+s*8, 200,200); // criamos uma ellipse

}
  
  



