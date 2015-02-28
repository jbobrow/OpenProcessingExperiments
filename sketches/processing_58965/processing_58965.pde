
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
ArrayList sines;

int padding = 100;
int numParticles = 6;
ArrayList particles;
float G_CONST = .2;

void setup(){
  size(800,600);
  smooth();
  background(0);
  
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  
  // init ArrayLists
  particles = new ArrayList();
  sines = new ArrayList();
  
  for( int i=0; i<numParticles; i++){
    Particle a =  new Particle();
    a.setPosition(random(padding,width-padding), random(padding,height-padding));
    float s = random(5, 20);
    a.setMass( s*s );
    a.setRadius( s );
    a.addFriction( 1/s );
    if(random(1)>.5){
      a.setColor(color(51,102,102,51));
      a.setStatic(true);
    }
    else{
       // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
      SineWave sine = new SineWave(440+i*100, 0.5, out.sampleRate());
      // set the portamento speed on the oscillator to 200 milliseconds
      sine.portamento(200);
      // add the oscillator to the line out
      sines.add(sine);
      out.addSignal(sine);
    }
    particles.add(a);
  }
  
  // add gravity between all particles
  for(int i=0; i<particles.size(); i++){
    Particle a = (Particle) particles.get(i);
    if(!a.isStatic){
      for(int j=0; j<particles.size(); j++){
        Particle b = (Particle) particles.get(j);
        if(i!=j)
          a.addGravity(b);
      }
    }
  }
}

void draw(){
   fill(0,0,0,5);
   rect(0,0,width,height);
   
   int index = 0;
   
   for(int i=0; i<particles.size(); i++){
     Particle a = (Particle) particles.get(i);
     a.update();
     a.display();
     if(!a.isStatic){
       // with portamento on the frequency will change smoothly
       SineWave sine = (SineWave) sines.get(index);
       float freq = map(a.position.y, 0, height, 2000, 100);
       sine.setFreq(freq);
       float pan = map(a.position.x, 0, width, -1, 1);
       sine.setPan(pan);
       float amp = map(a.velocity.getAmp(), 0, 20, 0, 1);
       sine.setAmp(amp);
       index++;
     }
   }
}

float distance( vec2D a, vec2D b){
  float d;
  d = sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
  
  return d;
}

void mousePressed(){
  dragParticles();
}

void mouseReleased(){
  for(int i=0; i<particles.size(); i++){
    Particle a = (Particle) particles.get(i);
    a.isDragged = false;
  }
}

void dragParticles(){
  for(int i=0; i<particles.size(); i++){
    Particle a = (Particle) particles.get(i);
    if( distance(a.position, new vec2D(mouseX,mouseY)) < a.rad *2 )
      a.isDragged = true;
  }
}

