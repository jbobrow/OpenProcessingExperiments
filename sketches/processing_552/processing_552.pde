
import krister.Ess.*;

import traer.physics.*;
int numSines = 2;
AudioChannel myChannel;
AudioStream myStream; // Audio stream to write into
SineWave[] myWave; // Array of sines
FadeOut myFadeOut; // Amplitude ramp function
FadeIn myFadeIn; // Amplitude ramp function
ParticleSystem physics;
Particle a, b;


void setup(){
  size (400,400);
  Ess.start(this);
   myStream = new AudioStream(); // Create a new AudioStream
  myStream.smoothPan = true;
  myWave = new SineWave[numSines]; // Initialize the oscillators
  for (int i = 0; i < myWave.length; i++) {
    float sinVolume = (1.0 / myWave.length) / (i + 1);
    myWave[i] = new SineWave(0, sinVolume);
  }
  myFadeOut = new FadeOut(); // Create amplitude ramp
  myFadeIn = new FadeIn(); // Create amplitude ramp
  myStream.start(); // Start audio
  //myChannel=new AudioChannel("jingle.mp3");
  physics= new ParticleSystem (0,.05);
  a=physics.makeParticle (3.0, random (0,width),random (0, height),0);
  b=physics.makeParticle (3.0, random (0,width),random (0, height),0);
  physics.makeSpring (a,b,1.0,.01,.01);
  physics.makeAttraction (a,b,-20.0,0.11);
}

void draw(){

  outOfBounds(a);
  outOfBounds(b);
  physics.tick();
  background (12, 23, 60);
  noStroke();
  fill (50+random(30), 100-random(50), int(100/1+random(60))); 
  ellipse (a.position().x(),a.position().y(), random(width),random(height));
  fill (140, 200, 150+random(100));   
  ellipse (b.position().x(),b.position().y(), 50,50);
  noFill();
  strokeWeight(random(300)/100);
  float d = distance(a, b);
  for (int i = 0; i < (int)d/10; i++){
    stroke (20, random(d), 100+i); 
    bezier(random(width), random(height), a.position().x(), d, d,
    b.position().y(), random(width), random(height));
  }   
}

void mousePressed(){
  //a.setVelocity( 0, 0, 0);    
  a.moveTo(mouseX, mouseY,0);
}

void mouseDragged(){
  a.setVelocity( (mouseX - pmouseX), (mouseY - pmouseY), 0 );    
}

void outOfBounds( Particle p ){
  if ( p.position().x() < 0 || p.position().x() > width )
    p.setVelocity( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.setVelocity( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.moveTo( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 ); 
}

float distance (Particle pa, Particle pb){
  float d;
  d=sqrt (pow(pa.position().x()-pb.position().x(),2)+pow(pa.position().y()-pa.position().y()-pb.position().y(),2));
  return (d);
}

void audioStreamWrite(AudioStream s) 
{
  // Figure out frequencies and detune amounts from the mouse
  // using exponential scaling to approximate pitch perception
  float d = distance(a, b);
  float yoffset = a.position().y();
  float frequency = pow(100*yoffset, d/height) + 150;
  myWave[0].generate(myStream); // Generate first sine, replace Stream
  myWave[0].phase += myStream.size; // Increment the phase
  myWave[0].phase %= myStream.sampleRate;
  for (int i = 1; i < myWave.length; i++) { // Add remaining sines into the Stream
    myWave[i].generate(myStream, Ess.ADD);
    myWave[i].phase = myWave[0].phase;
  }
  myFadeOut.filter(myStream); // Fade down the audio
  for (int i = 0; i < myWave.length; i++) { // Set the frequencies
    myWave[i].frequency = frequency;
    myWave[i].phase = 0;
  }
  myFadeIn.filter(myStream); // Fade up the audio
}



