
/* 

"Omaggio a Kazimir Maljevic" - Crveni Kvadrat

Il "quadrato", nel suo spasmodico tentativo di liberarsi 
dalla sua costrizione Euclidea.

Nicolo' Tedeschi
02/03/2011


*/
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;

void setup() {
  size (500, 500);
 
  minim = new Minim(this);
 
  //load audio file from the data folder
  song = minim.loadFile("space123.wav");
  song.play();
  song.loop(); 
}

void draw () {
  
  background(235-song.mix.get(4)*50);
  fill(#FC0A2E);
  noStroke();
  
  for(int i = 0; i < song.bufferSize() - 1; i++) {
  
    beginShape();
      vertex(50, 50);
      vertex(450+song.left.get(i)*40, 50-song.left.get(i)*40);  //moving vertex
      vertex(450, 450); 
      vertex(50, 450);
    endShape(CLOSE);
  
  }  
}


void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}

