
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer out;    // create an output object
SineWave sine;      // create a sine wave object

void setup(){
  size(600,400);

 minim = new Minim(this);                      //  load Minum
  out = minim.loadFile("a6.2_GoodQuality.mp3");   //  load your sound into Minum
  out.play();
  frameRate(32);
  smooth();
  background(0);
}



void draw(){
  fill(255,75); // fill(grayscale,alpha);
  rect(0,0,width,height);
  
  //bufferSize = the number of samples we're displaying at once
  for(int i = 0; i < out.bufferSize() - 1; i +=5){
    stroke(abs(out.mix.get(i)*255));
    fill(abs(out.mix.get(i)*255),abs(out.mix.get(i)*255),abs(out.mix.get(i)*255));
    ellipseMode(CENTER);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    ellipse(height/2 + out.mix.get(i)*100, i, height/2 + out.mix.get(i+1)*100, i+1);
  }
}

// here we provide a way to mute out
void keyPressed(){
  if ( key == 'm' ){
    if ( out.isMuted() ){
      out.unmute();
    } else {
      out.mute();
    }
  }
}

void stop(){
  out.close();
  minim.stop();

  super.stop();
}


