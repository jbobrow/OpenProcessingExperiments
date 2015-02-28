
// global variables
int n;
int blocksize = 40;
//minim library oproepen
import ddf.minim.*;
//object
Minim minim;
//nieuwe audiosamples en knoppen maken
AudioSample [] AudioSamples = new AudioSample[8];
sample [] mySamples = new sample [16*8];

// het laden van audio van de harde schijf duurt lang, dus laad ik ze in setup() om de snelheid in draw() niet te vertragen
void setup(){
  size(640,320);
  colorMode(HSB);
  frameRate(800);
  //start minim
  minim = new Minim(this);
  AudioSamples[0] = minim.loadSample("plop.wav");
  AudioSamples[1] = minim.loadSample("kiss.wav");
  AudioSamples[2] = minim.loadSample("tss.wav");
  AudioSamples[3] = minim.loadSample("touch it.wav");
  AudioSamples[4] = minim.loadSample("harder.wav");
  AudioSamples[5] = minim.loadSample("better.wav");
  AudioSamples[6] = minim.loadSample("faster.wav");
  AudioSamples[7] = minim.loadSample("stronger.wav");
  
//ellipsen
  for (int z=0;z<8;z++){
    for (int i = 0; i< 16; i++){
      mySamples[i+(z*16)] = new sample(i*blocksize,z*blocksize,z*30,z);
    }
  }
}
void draw(){
  //teken ellipsen 
  background(0);
  for (int i = 0; i<128; i++)  {
    mySamples[i].display();
    mySamples[i].trigger(n);
  }
  // de lijn die aangeeft waar de drummachine speelt
  stroke(255,255,255);
  line(n,0,n,height);
  n+=1;
  if (n>width) n=0;
}

//class voor ellipsen
class sample{
  int x, y, c, s;
 boolean active;
  int R = 20;
  sample(int x, int y, int c, int s)  {
    this.x = x+(R/2);
    this.y = y+(R/2);
    this.c = c;
    this.s=s;
  }
  void display()  {
    stroke(c,255,255);
    if (active) fill(c,255,127);
    else fill(c,255,50);
   ellipse(x,y,R,R);
  }
  //als de speellijn over een actieve ellipse gaat, dan wordt het bijbehordende geluid afgespeeld en licht de ellipse op
  void trigger(int n)  { 
    if(active){
      if (n==x) AudioSamples[s].trigger();
      if (n>=x && n<=(x+blocksize)){
        fill(c,255,255);
        stroke(c,255,255);
        ellipse(x,y,R,R);
      }
    }
  }
  //check of de cursor op de ellipse is die je aan wilt klikken
  void checkMouse(int xpos, int ypos) {
    if (abs(xpos-x)< R && abs(ypos-y)<R) {
      if(mousePressed)     {
        if (active) active = false;
        else active = true;
      }
    }
  }
}
//als een ellipse wordt aangeklikt, speel dan het geluid
void mousePressed(){
  for (int i=0;i<128;i++)  {
    mySamples[i].checkMouse(mouseX,mouseY);
  }
}
void stop(){
//minim audio classes altijd sluiten als je klaar bent)
  for (int i = 0; i<8 ; i++)  {
    AudioSamples[i].close();
  }
  minim.stop();
  super.stop();
}

