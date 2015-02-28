
//I'm using the mininm library, for the sound 
//it has to be installed in order to run the processing sketch



PImage extrude;
int[][] values;
float angle = 0;
float freq =0;


//importing minim
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
AudioPlayer groove;
SineWave sine;

void setup(){
 
  
size(850, 850, P3D);


minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  
  
  
  
  
  // Load the image into a new array
  extrude = loadImage("tor3.jpg");
  
  extrude.loadPixels();
  values = new int[extrude.width][extrude.height];
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      color pixel = extrude.get(x, y);
      values[x][y] = int(brightness(pixel));
    }
  }
}


void draw(){
  background(0);
//So that the sketch is silent while mouse is released  
 freq=0;
  
  
//extruding the image
  
 for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      stroke(values[x][y]);
      point(x, y, -values[x][y]);
    }
  }


//when mousePressed the tornado starts rotating and sound activates
  if (mousePressed){
    
    
    
    
    
  pushMatrix();
  
 angle += 0.01;

  freq=150;
  sine.setFreq(freq);

 
 //while mouse gets closer to the tornado it increases its speed, and frequencies as well
 if(mouseX> width/3&&mouseX< width-width/3 && mouseY >height/3&&mouseY <height-height/3){
   angle+= 0.2;
 freq+=200;
  sine.setFreq(freq);}

   
if(mouseX> width/4&&mouseX< width-width/4 && mouseY >height/4&&mouseY <height-height/4){
   angle+= 0.05;
   freq+=100;
    sine.setFreq(freq);
  }
 

  

  // Rotate around the center axis
  translate(extrude.width/2, 0, 0);
  rotateY(angle);  
  translate(-extrude.width/2, 0, 0);
  
  
  // Display the image mass
   
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
   if  (values[x][y]>1){ 
   stroke(values[x][y]);
   point(x, y, -values[x][y]+185);
 }
      
    }
  
  } 
  popMatrix();   
  
  
  
  //there are 3 extruded images, placed in in diferent anles in space. This is the second image 120 degrees from the anterior 
  pushMatrix();
 

  // Update the angle
  angle += 0.1;
   if(mouseX> width/3&&mouseX< width-width/3 && mouseY >height/3&&mouseY <height-height/3){
   angle+= 0.2;}
   
if(mouseX> width/4&&mouseX< width-width/4 && mouseY >height/4&&mouseY <height-height/4){
   angle+= 0.05;}
  

  // Rotate around the center axis
  translate(extrude.width/2, 0, 0);
  rotateY(angle+120);  
  translate(-extrude.width/2, 0, 0);
  
  
  

  
  // Display the image mass
   
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
   if  (values[x][y]>10){ 
   stroke(values[x][y]);
   point(x, y, -values[x][y]+200);
 }
      
    }
  
  } 
  popMatrix();
  
  //third image that rotates
    pushMatrix();
 

  // Update the angle
  angle += 0.01;
   if(mouseX> width/3&&mouseX< width-width/3 && mouseY >height/3&&mouseY <height-height/3){
   angle+= 0.2;}
   
if(mouseX> width/4&&mouseX< width-width/4 && mouseY >height/4&&mouseY <height-height/4){
   angle+= 0.05;}
  
  

  // Rotate around the center axis
  translate(extrude.width/2, 0, 0);
  rotateY(angle+240);  
  translate(-extrude.width/2, 0, 0);
 
  // Display the image mass
   
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
   if  (values[x][y]>10){ 
   stroke(values[x][y]);
   point(x, y, -values[x][y]+200);
 }
      
    }
  
  } 
  popMatrix();
  

  
  } 
 // so that while the mouse is not pressed scketch is silent 
   else{
    freq+=0;
    sine.setFreq(freq);
  }
    
} 
  


  
  

//stoping mininm
    
void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}



