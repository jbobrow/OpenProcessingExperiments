

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer Maroon5Maps;
FFT         fft;       

 
void setup(){
  size(650, 650,P3D); //AGREGAMOS P3D
   minim = new Minim(this); //PARA AUDIO
   Maroon5Maps = minim.loadFile("Maroon5Maps.mp3", 1024); //audio
   Maroon5Maps.loop();//audio
   fft = new FFT( Maroon5Maps.bufferSize(),Maroon5Maps.sampleRate() );//audio
  
}
void draw()
{
 filter(INVERT);
  background(random(500),10,70);//fondo principal(rojo,azul,morado)
  fft.forward( Maroon5Maps.mix );

   for(int i = 0; i < fft.specSize(); i++)
  {
                                                                                
    ellipse(width/2, height/2, 50 + Maroon5Maps.left.get(i)*50, 50 + Maroon5Maps.right.get(i)*50);
    fill (#F3FC03);
      }
      
      
      for(int i = 50; i < fft.specSize(); i++)
  {
                                                                                
     fill (#0DF6FC);
    ellipse(width/2, height/2, 50 + Maroon5Maps.left.get(i)*50, 50 + Maroon5Maps.right.get(i)*50);
      }
      
      for(int i = 50; i < fft.specSize(); i++)
  {
                                                                                
     fill (#AF1EA6);
    ellipse(width/3, height/3, 50 + Maroon5Maps.left.get(i)*50, 50 + Maroon5Maps.right.get(i)*50);
      }
      
      for(int i = 50; i < fft.specSize(); i++)
  {
                                                                                
     fill (#FFAA00);
    ellipse(width/0.1, height/0.1, 50 + Maroon5Maps.left.get(i)*25, 50 + Maroon5Maps.right.get(i)*50);
      }
      
  
  for(int y = 0; y < fft.specSize(); y++)
  
  {
                                                                                
     line( y, height, y, height - fft.getBand(y)*45 );
     
    ellipse(width/10, height/10, 50 + Maroon5Maps.left.get(y)*50, 50 + Maroon5Maps.right.get(y)*50);
    fill (#F3FC03);
      }

  translate(width/2, height/2);
   
  for (int i =0; i <8; i++ ){

}
 if (mousePressed && (mouseButton == LEFT)) {
    fill(random(#000205)); //COLOR DEL TEXTO
    textSize(100);//tamaño del texto (new)
text("NEW",-100, -30);


textSize(160);
//fill(#023B95); //COLOR DEL TEXTO
filter(GRAY);
filter(INVERT);
text("CANVAS",-320, 100); 

textSize(20);
fill(random(#000205));
text("INTERACTIVO",-50, 130);
    
    
    
    textSize(50);
fill(random(#000205));
text("@New Canvas",-170, 170);
    
  } 
  else if (mousePressed && (mouseButton == RIGHT)) {
    fill(random(#000205),69);
    filter(INVERT);
    textSize(100);
text("ARTE",-135, 10);
textSize(50);
text("INTERACTIVO",-170, 100);
  } else {
    fill(126);
  }

}



