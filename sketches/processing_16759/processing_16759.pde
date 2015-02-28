
//This is a drum machine, if you click on the pictures, the drum machine will play 
//those instruments. If you click on the same picture again, there will be no sound.
//Programming Endassignment 3.


//declare variables
PImage sax;
PImage piano;
PImage tambourine;
PImage drum;
int blocksize = 50;
int n;
import ddf.minim.*;
Minim minim;
//the arrays
AudioSample [] AudioSamples = new AudioSample[4];
sample [] mySamples = new sample [20*4];

void setup(){
 size(blocksize*20,blocksize*8);
 frameRate(400);
//load images
tambourine= loadImage("tambourine.jpg");
piano= loadImage ("piano.jpg");
sax= loadImage ("sax.jpg");
drum= loadImage ("drum.jpg");
imageMode(CORNER);
minim = new Minim(this);
//load audio data
  AudioSamples[0] = minim.loadSample("sax.wav", 2048);
  AudioSamples[1] = minim.loadSample("tambourine.wav",2048);
  AudioSamples[2] = minim.loadSample("drum.wav",2048);
  AudioSamples[3] = minim.loadSample("piano.wav",2048);
  //without these samples, you can not activate the sound
  for (int z=0;z<4;z++){
    for (int i = 0; i< 20; i++){
      mySamples[i+(z*20)] = new sample(i*blocksize,z*blocksize,z*50,z);
    }
  }
}

void draw(){
  int h;


  background(0);
//background images
  for(h=0;h<20;h++){ 
image(sax,h*50,height/5);
  }
   for(h=0;h<20;h++){ 
image(tambourine,h*50,height/5+blocksize);
  }
   for(h=0;h<20;h++){ 
image(drum,h*50,height/5+blocksize*2);
  }
   for(h=0;h<20;h++){ 
image(piano,h*50,height/5+blocksize*3);
  }
  for (int i = 0; i<80; i++)  {
    mySamples[i].display();
    mySamples[i].trigger(n);
  }
  //
  
  // cursor, I also treid a version, were you can decide how fast the curser will be 
  //but if the curser is faster, the audio will not be played, so I left it out.
  stroke(65,0,70);
  line(n,0,n,height);
  n+=1;
  if (n>width) n=0;
  
}


class sample{
  int x, y,s;
  boolean active;
  sample(int x, int y,int c, int s)  {
    this.x = x;
    this.y = y+85;
    this.s=s;
  }
  void display()  {
  //makes the light purple overlay at the pictures, 
  //so that you can see what you have clicked
    if (active) {fill(245,70,255,50);
    rect(x,y+blocksize/10,blocksize,blocksize);
    }
     else { noFill();
     }
 
  }
  //makes the audio be played and the overlay at the moment the sound is played
 void trigger(int n)  { 
    if(active){
      if (n==x) AudioSamples[s].trigger();
      if (n>=x && n<=(x+blocksize)){
        fill(245,70,255,100);
        rect(x,y+blocksize/10,blocksize,blocksize);
      }
    }
  }
  
  void checkMouse(int xpos, int ypos) {
    if ((xpos>x) && (xpos<(x+blocksize)) && (ypos >y) && (ypos < (y+blocksize))) {
      if(mousePressed)     {
        if (active) active = false;
        else active = true;
      }
    }
  }
}
//the mouse inteteaction
void mousePressed(){
  for (int i=0;i<80;i++)  {
    mySamples[i].checkMouse(mouseX,mouseY);
  }
}
void stop(){
  // closes Minim audio classes 
  for (int i = 0; i<4 ; i++)  {
    AudioSamples[i].close();
  }
  minim.stop();
  super.stop();
}

