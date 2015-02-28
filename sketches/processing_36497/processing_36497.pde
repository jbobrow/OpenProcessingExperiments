
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

int counter;
 
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}
 
void draw() {  //draw function loops
  counter++;
  stroke(0);
  strokeWeight(5);
  noFill();
  beginShape();
vertex(100, 20);
vertex(140, 20);
vertex(225, 225);
vertex(170, 225);
vertex(150, 170);
vertex(95, 170);
vertex(75, 225);
vertex(20, 225);
vertex(100, 20);
endShape();
fill(255);
beginShape();
vertex(145,130);
vertex(100,130);
vertex(120,70);
vertex(145,130);
endShape();
  noStroke();
  fill(mouseX,mouseY,150);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
    mouseMoved();
  }
  else {
 //   ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
void mouseMoved(){
  float freq = map(mouseY,0,height,1500,60);
  sine.setFreq(freq);
  float pan = map(mouseX,0,height,-1,1);
  sine.setPan(pan);
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}

