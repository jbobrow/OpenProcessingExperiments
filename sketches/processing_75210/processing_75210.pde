
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioInput in;
int ancho=2;


void setup (){
  size (1400,900);
  smooth();
  stroke (255,242,0);

  frameRate (15);
  //AQUI ES DAR UNA NUEVA INSTANCIA DEL OBJETO, FORMADA PARA RECIBIR AUDIO
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
   player = minim.loadFile("Here Comes The Sun.wav", 2048);  
  player.play();
  
  
}

void draw (){
  background(197,241,255);

  

  float m=0;
  //le estas diciendo que va a crecer todo lo qu este en el espacio del buffer, si no hay nada adentro no va a hacer nada. 
  for (int i=0; i<in.bufferSize()-1;i++){
    //get es agarrar la infomracion de i
    //abs saca el valor absoluto, lo que es positivo lo pasa a negativo y viceversa.
    if(abs(in.mix.get(i))>m){
      //m ya es el valor que se introdujo por el microfono de la computadora
      m=abs(in.mix.get(i));
      
    }
  }
  
  ancho+=int (m*3);
  strokeWeight(ancho);
  
  ellipse((int)width/2,(int)height/2,(int)ancho/2,ancho);
  for(int i = 0; i < player.left.size()-2; i++)
  
    ellipse(i, 50 + player.left.get(i)*200, i+1, 50 + player.left.get(i+1)*50);
    


}



