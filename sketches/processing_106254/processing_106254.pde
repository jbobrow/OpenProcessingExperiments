
import controlP5.*;
ControlP5 cp5;
 
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioOutput out;
SineWave sine;
 
float angle = 0;
float Volume = 30;
float col;
float d;
float Temperature;
float freq;
 
int Wavelength;
 
void setup() {
  size (1000, 300);
  background(0);
  noStroke();
  smooth();
   
  cp5 = new ControlP5(this);
   
  Group g1 = cp5.addGroup("g1")
                .setPosition(800, 10)
                .setWidth(200)
                .activateEvent(true)
                .setBackgroundColor(color(0, 70))
                .setBackgroundHeight(110)
                .setLabel("Control")
                ;
   
  cp5.addSlider("Wavelength")
     .setPosition(10, 20)
     .setSize(80, 9)
     .setRange(100, 500)
     .setValue(250)
     .setGroup(g1)
     ;
      
  cp5.addSlider("Volume")
     .setPosition(10, 40)
     .setSize(80, 9)
     .setRange(0, 40)
     .setGroup(g1)
     ;
   
  cp5.addSlider("Temperature")
     .setPosition(10, 60)
     .setSize(80, 9)
     .setRange(10, 600)
     .setValue(273)
     .setGroup(g1)
     ;
   
  cp5.addButton("By_GBS_Jinbaek")
     .setPosition(0, 285)
     .setSize(160, 15)
     .getCaptionLabel().align(CENTER, CENTER)
     ;
   
  minim = new Minim(this);
  out = minim.getLineOut();
  sine = new SineWave(250, Volume * 0.7/30, 44100);
  out.addSignal(sine);
  }
 
void draw() {
   
  sine.setFreq(250 * 250/Wavelength + (Temperature - 273)/20);
  sine.setAmp(Volume * 0.7/30);
   
  for(int t=0; t<1000; t += 1){
  col = 135 - (3*Volume * sin((angle + t) * 2*PI/Wavelength - PI/2));
  fill(col);
  rect(t, 0, 1, 200);
  }
  fill(255, 204, 0);
   
  for(float k = -2; k < 3; k +=1){
     for(int t = 1; t < 20; t +=1){
     d = t*50 + Volume * sin((angle + t*50) * 2*PI/Wavelength);
     ellipse(d, 200*(0.5+k/5), 15, 15);
     }
  }
     
  fill(0);
  rect(0, 200, 1000, 100);
  fill(255, 204, 0);
  rect(0, 250, 1000, 1);
    
  for(int t = 0; t < 1000; t +=1){
     d = 250 + Volume * sin((angle + t) * 2*PI/Wavelength);
     ellipse(t, d, 1, 1);
  }
     
  for(int t = 1; t < 20; t +=1){
     d = Volume * sin((angle + t*50) * 2*PI/Wavelength);
     rect(t*50, 250 + Volume * sin((angle + t*50) * 2*PI/Wavelength), 1, -Volume * sin((angle + t*50) * 2*PI/Wavelength));
  }
   
  angle = angle + 3 + (Temperature - 273)/550;
}


