
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

Minim minim;
AudioOutput out;
SineWave sine;
FFT fft;

float X = 1;
int S = 100;
int c =255;
int fps = 25;

float vals[];
float cx, cy;

void setup()
{
  size(600,300,P2D);
  frameRate(fps);
  smooth();
   
  cx = width/2;
  cy = height/2;
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(220, 0.5, out.sampleRate());
  out.addSignal(sine);
  
  vals = new float[1025];
  
  fft = new FFT(out.bufferSize(), out.sampleRate());
  
  
    println("sampling reate is " +out.sampleRate());
  println("spec size is " +fft.specSize());
  println("bandwidth is: " +fft.getBandWidth());
  
  for (int i = 0; i < fft.specSize(); i++) {
    println(i + " = " + fft.getBandWidth()*i);
      }
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(60);
 
    
    
  //background(0);
}

void draw()
{
  background(0);
  noFill();
  stroke(255);
  
  fft.forward(out.mix);
  
  for(int i = 0; i < out.mix.size()-1; i++){
    if(c > 0){
      c -= 1;
    }else{
      c = 255; 
    }
    noStroke();
    float x = (i + out.mix.get(i)*200)*2;
    float y = random(0,450) + ( out.mix.get(i+1)*200);
    fill(c, c, c, 80);
    ellipse(x, y, out.mix.get(i)*100, out.mix.get(i)*100);
    }


  
 
  
 if(keyPressed){
  
   if(key == 'q'){
     X = 2; 
   }
   if(key == 'w'){
     X = 2.2; 
   }
   if(key == 'e'){
     X = 2.4; 
   }
   if(key == 'r'){
     X = 2.6; 
   }
   if(key == 't'){
     X = 2.8; 
   }
   if(key == 'y'){
     X = 3; 
   }
   if(key == 'u'){
     X = 3.2; 
   }
   if(key == 'i'){
     X = 3.4; 
   }
   if(key == 'o'){
     X = 3.6; 
   }
   if(key == 'p'){
     X = 3.8; 
   }
   if(key == 'l'){
     X = 4; 
   } 
   if(key == 'k'){
     X = 4.2; 
   }
   if(key == 'j'){
     X = 4.4; 
   }
   if(key == 'h'){
     X = 4.6; 
   }
   if(key == 'g'){
     X = 4.8; 
   }
   if(key == 'f'){
     X = 5; 
   }
   if(key == 'd'){
     X = 5.2; 
   }
   if(key == 's'){
     X = 5.4; 
   }
   if(key == 'a'){
     X = 5.6; 
   }
   if(key == 'z'){
     X = 5.8; 
   }
   if(key == 'x'){
     X = 6; 
   }
   if(key == 'c'){
     X = 6.2; 
   }
   if(key == 'v'){
     X = 6.4; 
   }
   if(key == 'b'){
     X = 6.6; 
   }
   if(key == 'n'){
     X = 6.8; 
   }
   if(key == 'm'){
     X = 7; 
   }
    
    sine.setFreq(S*X); 
    
    //fill(200);
    //ellipse(100,100,X*10,X*10);
  
   println(X);
 }
}
void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


