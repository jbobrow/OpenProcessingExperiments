
//visuals by JoaoBras
//importamos a library fullscreen
import fullscreen.*;

//SoftFullScreen é a versão de fullscreen que acede exclusivamente
//ao sistema fazendo, entre outras coisas, o ajuste da janela
SoftFullScreen fs;

//importamos a library de opengl do processing
import processing.opengl.*;


//importamos a library Minim
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



//criamos o objecto minim para termos acesso ao ficheiro de som
Minim minim;
//criamos o objecto AudioPlayer para fazer o streaming do som
AudioPlayer musica;
//criamos o objecto FFT para fazer analise de espectro de som
FFT fft;

//criamos um array para guardar os nosso objectos (pontos)
Ponto [] pontos;
//o tamanho do array de pontos
int numPontos = 800;

// comando para inclusão de texto
PFont myFont;

void setup(){
  //definimos o tamanho da janela e o motor de render de OpenGL 
 //(para desenharmos utilizando aceleraçoes da placa grafica
  size(1024, 768, OPENGL); 
  
 //indicamos que o objecto será apresentado em FS
  fs = new SoftFullScreen(this); 
  
  // iniciamos o modo fullscreen
  // CTRL+F alterna entre FullScreen e janela pre-definida em screen
  fs.enter();
  

  //iniciamos o objecto Minim
  minim = new Minim(this);
  //fazemos load do ficheiro de som
  musica = minim.loadFile("music.mp3");
  //função play
  musica.play();
  //iniciamos o objecto FFT definindo o tamanho do buffer do player de som e o seu sample rate
  //predefiniçao 1024 (/2)
  fft = new FFT(musica.bufferSize(), musica.sampleRate());
  
 
  //iniciamos um novo array com a capacidade definida em numPontos
  pontos = new Ponto[numPontos];
  for(int i=0; i<numPontos; i++){
    //iniciamos cada um dos elementos do array
    pontos[i] = new Ponto(); 
  }
  
}

void draw(){
  background(0);
  //visualização com anti.alias
  smooth();
  
   //condição: se premirmos uma tecla > acção
//acção: se tecla - preenchimento random, se não tecla - preto
if (keyPressed == true) {
  for (int i =0; i <10; i =i+1){
  noStroke();
  fill(random (255), random (255), random (255));
  }
}
else {
    noFill();  }
    
  //analise de espectro de som
  fft.forward(musica.mix);
  //iniciamos uma transformaçao
  pushMatrix();
  //centramos o desenho
  translate(width/2, height/2);
  //"caracterizamos" os elementos
  for(int i=0; i<pontos.length; i++){
   pontos[i].update();
   pontos[i].desenhar();
  }
  //fechamos a transformaçao
  popMatrix();
}

void stop(){
  musica.close();
  minim.stop();
  super.stop();

}


