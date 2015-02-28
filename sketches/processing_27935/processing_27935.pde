
import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer groove;
BandPass bpf;


float beginX = 20.0;  
float beginY = 10.0;  
float endX = 500.0;     
float endY = 400.0;     
float distX;           
float distY;           
float exponent = 4;    
float x = 0;         
float y = 0;          
float step = 0.01;      
float percentage = 0.0; 
boolean called = true;

void setup() 
{
  minim = new Minim(this);
    groove = minim.loadFile("My Song.mp3");
  groove.loop();
  size(550, 450);
  noStroke();
  smooth();
  distX = endX - beginX;
  distY = endY - beginY;
   bpf = new BandPass(440, 20, groove.sampleRate());
  groove.addEffect(bpf);
}

void draw() 
{
  fill(0,1);
  rect(0, 0, width, height);
  
  
  percentage += step;
  if (percentage < 1.0) {
    x = beginX + (percentage * distX);
    y = beginY + (pow(percentage, exponent) * distY);
  }
  if(round(endX) == round(x) && round(endY) == round(y)){
    called = false;
  }
  
  if (called == false){
     percentage = 0.0;
  called = true;
  beginX = x;
  beginY = y;
  endX = random(width);
  endY = random(height);
  distX = endX - beginX;
  distY = endY - beginY;
  }
    
  fill(255);
  ellipse(x, y, 20, 20);
  println(called);
}

void mousePressed() {
  percentage = 0.0;
  called = true;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}
void mouseMoved()
{
  float passBand = map(endX,0 , width, 0, 2000);
  bpf.setFreq(passBand);
  float bandWidth = map(endY ,0, height, 500, 1000);
  bpf.setBandWidth(bandWidth);
  bpf.printCoeff();
  
}

void stop()
{
  groove.close();
  minim.stop();
  
  super.stop();
}

