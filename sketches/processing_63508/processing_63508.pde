
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim; // livraria som
Minim micro;
AudioSample somsegundo;

AudioInput in;

float escala1;
float volume;
float getIn;

int seconds;
int secondsBeat;
int lastSecond;


void setup () {

  size (500, 500); // definir o tamanho da janela
  smooth(); // suavizar as arestas dos objectos representados
  micro = new Minim(this);
  minim = new Minim(this); // definir nova livraria de som
  somsegundo = minim.loadSample("segundos.wav"); // atribuir o ficheiro de audio referente aos segundos
  minim.debugOn(); // verificar a placa de som
  seconds = 0;
  secondsBeat = 1;
  escala1= 100;
  in = micro.getLineIn(Minim.MONO, 128);
}

void draw() {

  seconds = second(); // seconds igual a segundos
  
  getIn = abs(in.left.get(0));
  volume = abs (getIn*escala1);
  
  if (lastSecond+1 == seconds){ //declarar a variavel deseconds e lastsecond para definir quando começa a batida do próximo segundo
    somsegundo.trigger(); // reprodução do som
  }
  
    lastSecond = seconds; // variavel second recebe o valor dos segundos
  
  
  background(89,90,87); // definir a cor de fundo da janela

  float raioSegundos, raioHoras; // atribuir os nomes para os raios dos segundos e horas
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; // converter os segundos para a escala de radianos
  float h = map(hour(), 0, 24, 0, TWO_PI * 2) - HALF_PI;  // converter as horas para a escala de radianos

 
  int m = minute(); // valores dos minutos entre 0 e 59
  int cx, cy; // 
  int escala = 200; // valor para a escala dos objectos
  
  m = (int) map (m, 0, 59, 0, escala); // mapear os valores dos minutos de 0 a 59, para o tamanho da janela
  
  cx = width / 2; // centro horizontal da janela
  cy = height / 2; // centro vertical da janela

  raioSegundos = 130; // atribuir o raio para os segundos
  raioHoras = 110; // atribuir o raio para as horas

  strokeWeight(2); // definir aresta do circulo dos segundos e a sua espessura
  fill(24,106,4); // definir a cor de preenchimento do circulo dos segundos
  ellipse(cx + cos(s) * raioSegundos, cy + sin(s) * raioSegundos, 15, 15); // definição da posição dos angulos de acordo com o mapeamento

  strokeWeight(2); // definir aresta do circulo das horas e a sua espessura
  fill(255,115,0); // definir a cor de preenchimento do circulo das horas
  ellipse(cx + cos(h) * raioHoras, cy + sin(h) * raioHoras, 20, 20); // definição da posição dos angulos de acordo com o mapeamento

  strokeWeight (2); // definir aresta do circulo dos minutos e a sua espessura
  fill (225, 226,0); // definir a cor que vai preenchendo o circulo dos minutos
  ellipse (cx, cy, m+volume, m+volume); // definir a posição e o tamanho do circulo de preenchimento dos minutos
  noFill(); // definir que todos os circulos pertencentes ao circulo principal dos minutos não tem preenchimento 
  ellipse (cx, cy, escala, escala); // definir o circulo maior dos minutos
  ellipse (cx, cy, escala*0.5, escala*0.5); // definir o circulo dos 30 minutos
  ellipse (cx, cy, escala*0.25, escala*0.25); // definir o circulo dos 15 minutos
  ellipse (cx, cy, escala*0.75, escala*0.75); // definir o circulo dos 45 minutos
  
  }

 void stop(){ // parar o som nos dados indicados
   
  somsegundo.close(); //  
  
  minim.stop(); //
  super.stop();

 }


