
import ddf.minim.*; // importar livrarias de sons

Minim minim; // variáveis globais
AudioSample player_1; // variável do som 1
AudioSample player_2; // variável do som 2

int s; // segundos
int m; // minutos 
int h; // horas

int seconds; // variável para os segundos
int lastSecond;  // variável do último segundo
int lastMinut; // variável do último minuto

void setup(){ // definições de setup
  size(500,500); // tamanho da janela de fundo
  
  minim = new Minim(this);  // onde se importam os sons
  player_1 = minim.loadSample("15024^Calidris.minuta.mp3", 512); // o 1º é o nome do ficheiro e o segundo parametro é o buffersize, quanto maior for mais delay há.

minim = new Minim(this); // onde se importam os sons
player_2 = minim.loadSample("54634^dogdrum.mp3", 512); // o 1º é o nome do ficheiro e o segundo parametro é o buffersize, quanto maior for mais delay há.
  
}

void draw(){ // definições do desenho
  
  background(0); // cor do fundo
  smooth(); // suaviza o desenho 
  
  seconds = second(); //
  s=second(); // variável dos segundos
  m=minute(); // variável dos minutos
  h=hour(); // variável das horas
  
   if(lastSecond+1 == seconds){ // condição em que o som se volta a repetir em todos os segundos
player_1.trigger(); // toca o som 1

}

if(lastMinut+1 == m){ // condição em que o som se volta a repetir em todos os minutos
  player_2.trigger(); // toca o som 2
  
}

lastSecond = seconds; // último segundo
lastMinut = m; // último minuto
  
  
  int x=width/2; // centro de X do arco
  int y=height/2; // posição de Y do arcoc
  
  float  angulo1=0; // variável do ângulo do arco
  float angulo2=PI+PI; // variável do ângulo do arco
  
   
  noStroke(); // não tem contorno
  
  fill(234.234,234); // cor de preenchimento da circunferência dos segundos
  ellipse(x,y, 300,300); // posição e tamanho da circunferência
  fill(255); // cor de preenchimento do arco dos segundos
  arc(x,y, 300,300, angulo1+s*0.053, angulo2-s*0.053); // posição X e Y dos arcos, tamanho de X e Y e a primeira  e segunda posição do ângulo que varia por segundo, respectivamente.
  
  fill(150,0,0); // cor de preenchimento da circunferência dos minutos
  ellipse(x,y, 200,200); // posição e tamanho da cincunferência
  fill(255,0,0); // cor de preenchimento do arco dos minutos
  arc(x,y, 200,200, angulo1+m*0.053,angulo2-m*0.053); // posição X e Y dos arcos, tamanho de X e Y e a primeira  e segunda posição do ângulo que varia por minuto, respectivamente.
  
  fill(0,0,150); // cor de preenchimento da circunferência das horas
  ellipse(x,y, 100,100); // posição e tamanho da circunferência
  fill(0,0,255); // cor de preenchimento do arco das horas
  arc(x,y, 100,100, angulo1+h*0.130,angulo2-h*0.130); // posição X e Y dos arcos, tamanho de X e Y e a primeira  e segunda posição do ângulo que varia por hora, respectivamente.


PFont minhaFonte; // fonte = ao nome minha Fonte
minhaFonte = loadFont("Helvetica-48.vlw"); // importa a fonte que pretendemos utilizar

fill(255); // cor de preenchimento
textFont(minhaFonte, 30); // fonte utilizada e tamanho
text (s, 405, 260); // segundos e posição na janela

fill(250,0,0); // cor de preenchimento
textFont(minhaFonte, 30); // fonte utilizada e tamanho
text (m, 355, 260); // minutos e posição na janela

fill(0,0,250); // cor de preenchimento
textFont(minhaFonte, 30); // fonte utilizada e tamanho
text (h, 305, 260); // horas e posição na janela

  
}
