
//MaioAlvear_Final Sketch


float mango;
float ala;
float ala2;
float pelo;
float mar;
float arena;

int traducir=3;
PImage mosca;
PImage codigo;
PImage ilusion;//from http://www.guardian.co.uk/music/musicblog/2008/oct/23/animalcollective-popandrock
import ddf.minim.*;
import ddf.minim.signals.*;


WhiteNoise wn;  // from http://code.compartmental.net/minim/examples/AudioOutput/WhiteNoiseSignal/WhiteNoiseSignal.pde

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
TriangleWave tri;


void setup(){
  background(0);
  size (800,600);
  smooth();
  codigo = loadImage("codigo.gif");
  ilusion = loadImage("ilusion.png");
  mosca = loadImage("mosca2.gif");
  imageMode (CENTER);
  //colorMode(HSB,360,290,100,100);
  mango = 2;


   
 } 

  void draw(){
     
    //background(0);
  stroke(255);
  fill(255);
  line (400,1,400,600);
  rect(10,550,20,30); //button 1
  rect(35,550,20,30);// button 2
  rect(60,550,20,30);//button 3
  rect(85,550,20,30);//button 4
  rect(110,550,20,30);//button 5
 
 
  fill(35,72,139);
  rect(355,550,100,30);
  fill(random(300));
  text ("TRANSLATE", 365, 570); //button translate
  
 
 //button 1  
if (mouseX > 10 && mouseX < 30 && mouseY > 550 && mouseY < 580 && mousePressed){
  if(mousePressed = true){
     minim = new Minim(this); // from http://code.compartmental.net/minim/examples/AudioOutput/WhiteNoiseSignal/WhiteNoiseSignal.pde
  out = minim.getLineOut();
  // makes a WhiteNoise signal with an amplitude of 0.2
  wn = new WhiteNoise(0.2);
  // adds the signal to the output
  out.addSignal(wn);
  for(int i = 0; i < out.bufferSize()-1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 10 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
    line(x1,300 + out.right.get(i)*20, x2, 150 + out.right.get(i+1)*200);
  }
  
    
   }
} //button 2
  else if(mouseX > 35 && mouseX < 55 && mouseY > 550 && mouseY < 580 && mousePressed){
  if(mousePressed = true){
    for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 50; y ++){
       
      fill(random(255));
      noStroke();
 
     //quad(300,100,x*2,y*2,x*2,y*2,y*5,100);       
    rect(x*10,y*100,100,5);
  ellipse(x*10,y*10,5,5);

    }
  }
}
}//button 3
else if (mouseX > 60 && mouseX < 80 && mouseY > 550 && mouseY < 580 && mousePressed){
  if (mousePressed = true){
    //trigonometry
    float ala = pelo* cos(radians(mango));
  float  ala2= pelo* sin(radians(mango))*cos(radians(mango/10))*sin(radians(500-mango));
   
    

    pushMatrix();
        Filtro();
  colorMode(HSB,360,290,100,100);


    image(codigo,mar*10,pelo+250);
    popMatrix();
    
  mango+=5;
  ala+=100;
  ala2+=.2;
  pelo+=.1;
  mar+=.7;
  arena+=3;
  }
} //button 4
else if (mouseX > 85 && mouseX < 105 && mouseY > 550 && mouseY < 580 && mousePressed){
if (mousePressed = true){
  
  image(ilusion, 400,300);
 }
}//button 5
else if (mouseX > 110 && mouseX < 130 && mouseY > 550 && mouseY < 580 && mousePressed){
  if (mousePressed = true);
   for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 50; y ++){
       
      fill(random(100));
      noStroke();
 
     rect(x*30,y*100,100,5);
  ellipse(x*30,y*10,5,5);
    }
  }
}//button translate
  else if (mouseX > 355 && mouseX < 455 && mouseY > 550 && mouseY < 580 && mousePressed){
  if (mousePressed = true);
  
  minim = new Minim(this); //from http://code.compartmental.net/minim/examples/AudioOutput/TriangleWaveSignal/TriangleWaveSignal.pde
  // get a line out from Minim, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO, 2048);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate to match the output
  tri = new TriangleWave(440, 0.3, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  tri.portamento(200);
  // add the oscillator to the line out
  out.addSignal(tri);
   for(int i = 0; i < out.bufferSize()-1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  Filtros();
  image(ilusion,400,300);
  
  
   float ala = pelo* cos(radians(mango));
  float  ala2= pelo* sin(radians(mango))*cos(radians(mango/10))*sin(radians(500-mango));
   
    image(mosca,mar*10,pelo+250);
Filtro();
  colorMode(HSB,360,290,100,100);
  mango+=5;
  ala+=100;
  ala2+=.2;
  pelo+=.1;
  mar+=.7;
  arena+=3;
  
  println();
}
  
  }
void Filtro(){
  
  codigo.loadPixels();
  int codigoSize = codigo.width * codigo. height;
  for ( int i = 0; i < codigoSize; i ++){
    color cp = codigo.pixels[i];
    float h = hue (cp);
    float s = saturation(cp);
    float b = brightness (cp);
    codigo.pixels[i] = color (random(s*2),random(300), b*1,random(h*2));
    
  }
  codigo.updatePixels();
  
}
void Filtros(){
  ilusion.loadPixels();
  int ilusionSize = ilusion.width * ilusion. height;
  for ( int i = 0; i < ilusionSize; i ++){
    color cp = ilusion.pixels[i];
    float h = hue (cp);
    float s = saturation(cp);
    float b = brightness (cp);
    ilusion.pixels[i] = color (random(s*0),random(300), b*1,random(h*2));
        
  }
  ilusion.updatePixels();
  
}

   
   
  



