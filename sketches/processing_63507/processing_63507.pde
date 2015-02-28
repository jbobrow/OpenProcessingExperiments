
import ddf.minim.*; //importa as bibliotecas do minim
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim; // Chama a classe da livraria
Minim micro; // cria uma nova variavel associada à biblioteca minim
AudioSample som_segundos; // Carrega o ficheiro de som dos segundos
AudioSample som_minutos; // Carrega o ficheiro de som dos minutos
AudioSample som_horas; // Carrega o ficheiro de som das horas

AudioInput in; //atribui á variavel in um novo input de som

float escala; //declara a variavel escala
float volume; //declara a variavel volume
float getIn; //declara a variavel getIn

int segundos; // Declara a variavel dos segundos
int secondsBeat; // Com a variavel seconds e a lastSeconds Declara a variavel que verifica quando as duas se encontram
int lastSecond; // Variavel que verifica quando acabam os segundos

int minutos; // Declara a variavel dos minutos
int minutesBeat; // Com a variavel seconds e a lastSeconds Declara a variavel que verifica quando as duas se encontram
int lastMinute; // Variavel que verifica quando acabam os minutos

int horas; // Declara a variavel das horas
int hoursBeat; // Com a variavel hours e a lastHours Declara a variavel que verifica quando as duas se encontram
int lastHour; // Variavel que verifica quando acabam as horas

void setup() { //funçao que armazena as definiçoes gerais do programa
  size(500,500); //define o tamanho da janela
  background(255); //define a cor de fundo
  smooth (); //suaviza os objectos desenhados usando para isso o antialiasing
  
  minim = new Minim(this); // Declara uma nova variavel onde vao ser inseridos sons carregados pelo minimo
  micro = new Minim(this); // Declara uma nova variavel onde vao ser inseridos sons carregados pelo minimo
  som_segundos = minim.loadSample("claves.wav"); // o processo de gravação da musica dos segundos
  som_minutos = minim.loadSample("plim.wav"); // o processo de gravação da musica dos minutos
  som_horas = minim.loadSample("clown.wav"); // o processo de gravação da musica das horas
  
  escala=100; //atribui á variavel escala o valor 100
  in = micro.getLineIn(Minim.MONO, 128); //atribui a variavel in um input de som de microfone com buffersize de 128
  
segundos = 0; // atribui á variavel "segundos" o valor "0"
minutos = 0; // atribui á variavel "minutos" o valor "0"
horas = 0; // atribui á variavel "horas" o valor "0"

secondsBeat =1; // atribui á variavel "secondsBeat" o valor "1"
minutesBeat =1; // atribui á variavel "minutesBeat" o valor "1"
hoursBeat =1; // atribui á variavel "hoursBeat" o valor "1"

}

void draw() { //função de que desenha os objectos

segundos = second(); // atribui à variavel "segundos" a função de contagem de segundos
minutos = minute(); // atribui à variavel "minutos" a função de contagem de minutos
horas = hour(); // // atribui à variavel "horas" a função de contagem de horas

getIn = abs(in.left.get(0)); //atribui a variavel getin o valor absoluto do volume recebi do microfone
volume = abs (getIn*escala); //atribui a varioavel volume o valor absoluto da multiplicaçao da escala pelo input do micro

if (lastSecond+1 == segundos) { //condiçao que verifica a passagem do segundo para assim fazer acontecer o som
  som_segundos.trigger(); //dispara o som do segundo
  
} 

 lastSecond = segundos; //actualiza a variavel last second


if (lastMinute+1 == minutos) { //condiçao que verifica a passagem do minuto para assim fazer acontecer o som
  som_minutos.trigger(); //dispara o som do minuto
  
}
 
 lastMinute = minutos; //actualiza a variavel last minute
 
 if (lastHour+1 == horas) {
  som_horas.trigger();
  
} 

 lastHour = horas;

 
 float h = hour(); //atribui à variavel h as horas do sitema
 float m = minute(); //atribui à variavel m os minutosdo do sitema
 float s = second(); //atribui à variavel s os segundos do sitema
   
  float m2 = (TWO_PI*m)/60;//atribui à variavel m2 o valor da area do circulo definida por 2PI*m/60, para que seja feita uma distribuiçao correcta dos minutos pelo relogio, sendo que 2PI * X = area de um circulo
  float h2 = (TWO_PI*h)/24;//atribui à variavel h2 o valor da area do circulo definida por 2PI*h/24, para que seja feita uma distribuiçao correcta das horas pelo relogio, sendo que 2PI * X = area de um circulo
  float s2 = (TWO_PI*s)/60;//atribui à variavel h2 o valor da area do circulo definida por 2PI*h/60, para que seja feita uma distribuiçao correcta dos segundos pelo relogio, sendo que 2PI * X = area de um circulo
 
 stroke(255); // cor da linha do objecto
 strokeWeight(2); //espessura da linha do objecto
  fill(255, 0, 0); //cor do preenchimento do objecto
  arc(width/2, height/2, 400, 400, 0, h2); //desenha um arco - coordenadas da posiçao do objecto (x,y) e tamanho do mesmo
  fill(255); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 300, 300); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  fill(255, 90, 90); //cor do preenchimento do objecto
  arc(width/2, height/2, 300, 300, 0, m2); //deenha um arco - coordenadas da posiçao do objecto (x,y) e tamanho do mesmo
  fill(255); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 200, 200); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  fill(255, 180, 180); //cor do preenchimento do objecto
  arc(width/2, height/2, 200, 200, 0, s2); //desenha um arco - coordenadas da posiçao do objecto (x,y) e tamanho do mesmo
  fill(255); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 100, 100); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  
  fill(0); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 100+volume, 100+volume); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  
  stroke (0); // cor da linha do objecto
  strokeWeight (2); //espessura da linha do objecto
  line (width/2, height/2, 480, height/2); //linha - coordenadas da posição inicial e final do objecto
  
  PFont agency; //cria a variavel agency que armazena o tipo de letra
  agency = loadFont("AgencyFB-Bold-20.vlw"); //carrega a variavel agency com o tipo de letra agency e o tamanho 20
  fill(0); //cor do preenchimento do objecto
    text("H", 423, 240); //texto "H", posição em x, posição em y
    text("M", 371, 240); //texto "M", posição em x, posição em y
    text("S", 322, 240); //texto "S", posição em x, posição em y
}
 void stop() // para o som introduzido
{
  som_segundos.close(); // fecha todos os elementos do minim e liberta os de memoria
  som_minutos.close();
  som_horas.close();
  
  minim.stop(); //
  super.stop(); //
       
}

//CÁTIA PIRES _ 25554 LABORATORIO MULTIMEDIA _ 2012


