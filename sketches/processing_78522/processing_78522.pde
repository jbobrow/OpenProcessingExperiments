
//Yanahuihernandez Cruz
//Felipe Torres Torres
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput salida;
SineWave seno;

void setup()
{ 
size(400,200);
minim=new Minim(this);
salida=minim.getLineOut(Minim.STEREO);//por la linea de salida saca los datos
seno=new SineWave(440,0.9,salida.sampleRate());//frecuancia de muestreo estandar es lo que esta dentro de salida.sampleRate

//el rango audible es de 20 a 20000 ciclos, en este caso iniciaremos desde 440, los primeros no se escuchan, 0.8 es la amplitud de la onda

seno.portamento(200);//la velocidad en milisegundos con la que osilara
salida.addSignal(seno); //para sacar el sonido
}

void draw()
{
  float frec=map(mouseY,0,width,440,14400);
  float frec1=map(mouseX,0,height,440,14400);
  seno.setFreq(frec);
  seno.setFreq(frec1);
  
background(0);
stroke(255,0,100);
for(int i=0;i<salida.bufferSize()-1; i++)
{
float x1=map(i,0,salida.bufferSize(),0,width);
float x2=map(i+1,0,salida.bufferSize(),0,width);
line(x1,50+salida.left.get(i)*50,x2,50+salida.left.get(i+1)*50);
line(x1,150+salida.right.get(i)*50,x2,150+salida.right.get(i+1)*50);
}
}

