
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim som;
AudioPlayer musica;
AudioInput microfone;
Minim minim;


void setup () {
  
  size (900,700); // tamanho da tela
  
  som = new Minim (this);
  musica = som.loadFile("02.mp3"); // vai buscar o ficheiro de som
  musica.play();
  
  
   minim = new Minim(this);
   minim.debugOn();
   microfone = minim.getLineIn(Minim.STEREO, 1024);
   
}

void draw () {
  background (random(3)); // cor do fundo
 
  smooth();
  print (musica.bufferSize());
  
 
  
  {
 //BOLA ANIMADA PELO MICRO
float escala; //VARIALVE PARA AUMENTAR A BOLA
 
  escala = microfone.mix.get(microfone.bufferSize()-1)*5000; // utilizamos este metodo para ir buscar o valor de amplitude  
  // como a amplitude varia entre -1 e 1, vamos multimplicar o valor final (escalar)
  // o metodo é o "microfone.mix.get(0)" - o valor de "0"é um apontador para o primeiro valor da lista dos 1024 que decidimos "gravar"/samplar
   
  fill(153,0,153); 
  stroke(255);
  strokeWeight (2); 
  ellipse (width/2, height/2, escala, escala); 


}
  
  
  
  
  //criar a moldura da janela
   noFill ();
  stroke (51,0,102);
  strokeWeight(50);
 
//linha de baixo primeiro
 beginShape();
 
 for (int i=0; i<musica.bufferSize();i++)
{ 
float valor=musica.mix.get(i);
vertex (i,( valor*500) + (width-100));
}
endShape();
//linha da esquerda
beginShape();
  for (int i=0; i<musica.bufferSize();i++)
{ 
float valor=musica.mix.get(i);
vertex (( valor*500) + (-100),i);
}

endShape();

//linha de cima
 beginShape();
 
 for (int i=0; i<musica.bufferSize();i++)
{
float valor=musica.mix.get(i);
vertex (i,( valor*500) + (-100));
}
endShape();
//linha da direita
beginShape();
  for (int i=0; i<musica.bufferSize();i++)
{ 
float valor=musica.mix.get(i);
vertex (( valor*500) + (width+100),i);
}
endShape();


//OUTRO GRUPO DE LINHAS com memor aplitude
 
 
 
 stroke (102,0,102);
  strokeWeight(50);
 //criar a moldura da janela

//linha de baixo primeiro
 beginShape();
 
 for (int i=0; i<musica.bufferSize();i++)
{ 
float valor=musica.mix.get(i);
vertex (i,( valor*500) + (width-10));
}
endShape();

//linha da esquerda
beginShape();
  for (int i=0; i<musica.bufferSize();i++)
{ 
float valor=musica.mix.get(i);
vertex (( valor*500) + (-190),i);
}

endShape();

//linha de cima
 beginShape();
 
 for (int i=0; i<musica.bufferSize();i++)
{
float valor=musica.mix.get(i);
vertex (i,( valor*500) + (-190));
}
endShape();
//linha da direita
beginShape();
  for (int i=0; i<musica.bufferSize();i++)
{ 
float valor=musica.mix.get(i);
vertex (( valor*500) + (width+190),i);
}
endShape(); 


}

