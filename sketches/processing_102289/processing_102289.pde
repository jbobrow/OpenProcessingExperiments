
// Humberto Rodrigues (Beto Collin)
// betocollin@gmail.com


Maxim maxim;
AudioPlayer  f0, g0, a0, b0, c, d, e, f, g, a;
int numberOfKeys = 10;
int realTimeKeyCounter = 1;
boolean steppingOnKey = false;
int curMousePosY;
String keyCurrentlyPlaying;
String keyPreviouslyPlayed;
int[] test = {(int)random(255), (int)random(255), (int)random(255)};


void setup() {
  size(960, 640);
  
  maxim = new Maxim(this);
  
  f0 = maxim.loadFile("f0.wav");
  f0.setLooping(false);
  
  g0 = maxim.loadFile("g0.wav");
  g0.setLooping(false);
  
  a0 = maxim.loadFile("a0.wav");
  a0.setLooping(false);
  
  b0 = maxim.loadFile("b0.wav");
  b0.setLooping(false);
  
  c = maxim.loadFile("c.wav");
  c.setLooping(false);
  
  d = maxim.loadFile("d.wav");
  d.setLooping(false);
  
  e = maxim.loadFile("e.wav");
  e.setLooping(false);
  
  f = maxim.loadFile("f.wav");
  f.setLooping(false);
  
  g = maxim.loadFile("g.wav");
  g.setLooping(false);
  
  a = maxim.loadFile("a.wav");
  a.setLooping(false);
 
 
}


void draw() {
  
  background(255);
  
  line(0, height-100, width, height-100);
  
  
  //Avoid sound to played many times on the same second
  //We better wait until the user leaves the feet off the keyboard before the note plays again 
  if(mouseY < curMousePosY - 50) {
    steppingOnKey = false;
  }
  
  realTimeKeyCounter = 1;
  isItCurrentlyPlaying("f0");
  rect(0, height-20, width/numberOfKeys, 20);
  playKey(f0, "f0");
  
  isItCurrentlyPlaying("g0");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(g0, "g0");
  
  isItCurrentlyPlaying("a0");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(a0, "a0");
  
  isItCurrentlyPlaying("b0");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(b0, "b0");
  
  isItCurrentlyPlaying("c");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(c, "c");
  
  isItCurrentlyPlaying("d");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(d, "d");
  
  isItCurrentlyPlaying("e");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(e, "e");
  
  isItCurrentlyPlaying("f");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(f, "f");
  
  isItCurrentlyPlaying("g");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(g, "g");
  
  isItCurrentlyPlaying("a");
  rect(width/numberOfKeys * realTimeKeyCounter, height-20, width/numberOfKeys, 20);
  realTimeKeyCounter++;
  playKey(a, "a");
  
  
  imageMode(CENTER);
  PImage tom = loadImage("tom.gif");
  image(tom, mouseX, mouseY);
  
  
  
  
}


void isItCurrentlyPlaying(String s){
  if (keyCurrentlyPlaying == s){
    if (keyPreviouslyPlayed != keyCurrentlyPlaying)
    {
      test[0] = (int)random(255);
      test[1] = (int)random(255);
      test[2] = (int)random(255);
      keyPreviouslyPlayed = keyCurrentlyPlaying;
    }
    fill(test[0], test[1], test[2]);
  }
  else
  {
    fill(255);
  }
}


void playKey(AudioPlayer k, String s){
  if(mouseY > height-120 
      && mouseX > width/numberOfKeys * (realTimeKeyCounter-1) 
      && mouseX < width/numberOfKeys * realTimeKeyCounter
      && steppingOnKey == false)
  {
        k.play();
        k.cue(10);
        
        //store the key currently playing
        keyCurrentlyPlaying = s;
        
        //gets current mouse position so we will know when he releases the key
        curMousePosY = mouseY;
        steppingOnKey = true;
  }
  
}
