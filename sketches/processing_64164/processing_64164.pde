

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer audio;
float SMOOTHING = 0.5;
float vol = 0;
int currentArrayIndex = 0;
Particle[] ps = new Particle[200];
 
void setup()
{
  size(400, 400);
  smooth();
  noStroke();
  setAudio();
}
 void setAudio(){
   minim = new Minim(this);
  audio = minim.loadFile("Overjoyed 60.mp3");
  audio.loop(); 
  
}
 
void draw()
{
  background(0);
  vol = lerp(vol, audio.mix.level(), SMOOTHING);
  println(120*vol);
  for (int i = 0; i < ps.length; i++) {
    Particle p = ps[i];
    if (p != null)
    {
      p.trans = p.trans - 1.2;
      p.sz=vol*120;
      fill(p.r, p.g, p.b, p.trans);
      ellipse(p.x, p.y, p.sz, p.sz);
    }
  }
 
  if (frameCount%10==0){
    makeNewParticle();}
}
 
void makeNewParticle() {
  Particle newP = new Particle();
  newP.x = random(10,490);
  newP.y =random(20,400);
  newP.trans = 250;
 
  ps[currentArrayIndex] = newP;
  currentArrayIndex++;
  if (currentArrayIndex == ps.length-1)
    currentArrayIndex = 0;
}


