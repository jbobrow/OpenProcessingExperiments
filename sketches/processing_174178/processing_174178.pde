
//La biblioteca de Processing llamada minim, sirve para poder importar y editar archivos de música desde Processing
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;

 
Minim minim;
AudioInput in;
FFT fft;
 
float loudestFreqAmp = 0;
float loudestFreq = 0;
int timerCounter = 0;
 
void setup()
{
 size(1080, 920);
 frameRate(30);
 
 minim = new Minim(this);
 minim.debugOn();
 background(000);
 noStroke();
 // La profundidad de bits es de 16, por defecto.
 in = minim.getLineIn(Minim.STEREO, 1024);
 fft = new FFT(in.bufferSize(), in.sampleRate());
 
}
 
 
void draw()
{
 fft.window(FFT.HAMMING);
 for(int i = 0; i < fft.specSize(); i++)
 {
     //Ahora se dibujan las lineas de banda de frecuencia.
    
   if (fft.getBand(i) > loudestFreqAmp && fft.getBand(i) > 10)
   {
     loudestFreqAmp = fft.getBand(i);
     loudestFreq = i * 5;
     //Se dibujan formas deacuerdo al filtro de frecuencia.
     fill(loudestFreq * 10, 255 - loudestFreq, loudestFreq * 10, 500 );
     if(loudestFreq < 50)
     {
       rect(random(0,width), random(0,height), loudestFreqAmp, loudestFreqAmp);
     }
     else
     {
       ellipse(random(0,width), random(5,height), loudestFreqAmp,
loudestFreqAmp);
     }
     timerCounter = 0;
   }
 }
 loudestFreqAmp = 0;
 
 //ondas y tamaños.
 
 fft.forward(in.mix);
 timerCounter++;
 if(timerCounter >= 200)
 {
    
   fill(255, 255, 255, (timerCounter - 50) * 2);
   rect(0, 0, width, height);
 }
 
}
 
void stop()
{
 // Se cierra el audio.
 in.close();
 minim.stop();
 
 super.stop();
}


