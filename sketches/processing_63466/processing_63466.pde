
PImage horas2;//dar nome à imagem que irei carregar

//importar biblioteca de reconhecimento de som
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
AudioInput in;


//importar biblioteca para importar samples
import ddf.minim.*;
Minim minim;
AudioSample player_drop; 

float volume;//variável para o volume
int seconds; //variável para o som dos segundos
int lastSecond; //variável para o som dos segundos
int secondsBeat; //variável para o som dos segundos

void setup()//definições do Setup
{
  size(1245,300);//tamanho da janela
  horas2 = loadImage("horas3.png");//carregar imagem
  
  minim = new Minim(this);//instanciamos o objecto minim
 player_drop = minim.loadSample("drop.wav", 512);//fazemos upload do ficheiro drop
 

in=minim.getLineIn(Minim.MONO,2);//para termos o nosso som reproduzido em MONO ou STEREO

volume=0;//valor para volume

seconds = 0; //valor para segundos
secondsBeat = 1;//valor para o som dos segundos
}
 
void draw() {//executar o código

 seconds = second();//dizemos que o som irá coincidir com os segundos

 volume=in.left.get(0)*100;//volume

 
 if (lastSecond+1 == seconds){//condição que permite que a cada segundo
    player_drop.trigger();//o som drop seja executado
    
 }
 lastSecond = seconds; //para parar o som entre reproduçoes

 

  int s = second();//variável para os segundos
  int m = minute(); //variável para os minutos
  int h = hour(); //variável para as horas
  
  background(1,111,136);//cor do background

  fill(255);//cor do preenchimento do rectângulo das horas
  rect(0, 10, h*21, 30);//dimensões do rectângulo para as horas
  fill(255);//cor do preenchimento do rectângulo dos minutos
  rect(0, 93, m*21, 30);//dimensões do rectângulo para os minutos
  fill(255);//cor do preenchimento do rectângulo dos segundos
  rect(0,186, (s*21), 30);//dimensões do rectângulo para os segundos   

   image(horas2, 0+volume, 0+volume);//posicionar a imagem

}



