
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Audio
//Dia 03 Audio FRECUENCIA

Minim lineaaudio;
AudioInput in;

void setup() {
  size(1024, 1024);
  smooth();
  //background(255);
  lineaaudio = new Minim(this); 
  lineaaudio.debugOn();
  //getlinein obtenemos el audio de minim en estereo con 512 en buffersize
  in=lineaaudio.getLineIn(Minim.STEREO, 1024);
}

void draw() {

  //                          canal izquierdo el numeral en parentesis son hz
  //fill(random(255), random(255), random(255), 100);
  //rect(width/2, height/2, in.left.get(100)*500, in.right.get(300)*200);

  background(255);
  for (int i=0; i<in.bufferSize()-1; i++) {
    //    x1, y1, x2,  y2
    stroke(0);
    line(i, (100+height/2)+in.left.get(i)*150, (i+1), (100+height/2)+in.left.get(i+1)*150);
    noStroke();
    fill(255, 0, 0, 50);
    ellipse(i, (height/2)+in.left.get(i)*150, 40, 40);  
    stroke(0);
    line(i, (-100+height/2)+in.left.get(i)*150, (i+1), (-100+height/2)+in.left.get(i+1)*150);
    fill(255, 0, 0, 50);
    strokeWeight(.25);
    ellipse(i, (300+height/2)+in.left.get(i)*150, 10, 10);  
    fill(255, 0, 0, 50);
    strokeWeight(.25);  
    ellipse(i, (-300+height/2)+in.left.get(i)*150, 10, 10);
  }
}
void stop() {
  //para cerrar la conexion de audio
  in.close();
  lineaaudio.stop();
  super.stop();
}


