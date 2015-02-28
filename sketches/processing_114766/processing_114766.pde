

import arb.soundcipher.*;

import oscP5.*;

OscP5 oscP5;

float v_fader1 = 0;
float v_fader2 = 0;


SoundCipher[] scs = new SoundCipher[4]; //Skapar en array för att kunna spela upp flera toner samtidigt.

float volume;
float tone;
float sustain;

int sIndex;

PImage piano;
PImage vit1;
PImage vit2;
PImage vit3;
PImage svart;
float xtangent;
PImage makarov;

HashMap knappar = new HashMap();



void setup() {
  size(800, 600);
  
  oscP5 = new OscP5(this,12000);
  
  volume = 100;
  tone = 60;
  sustain = 1;
  
  sIndex = 0;
  
  piano = loadImage("piano.gif");
  vit1 = loadImage("vit-ton1.gif");
  vit2 = loadImage("vit-ton2.gif");
  vit3 = loadImage("vit-ton3.gif");
  svart = loadImage("svart-ton2.gif");
  makarov = loadImage("makarov.jpg");
  xtangent = 242;
  

  
  
  for(int i = 0; i < scs.length; i++){
  scs[i] = new SoundCipher(this);
}

}

void oscEvent(OscMessage theOscMessage) {

    String addr = theOscMessage.addrPattern();
    float  val  = theOscMessage.get(0).floatValue();
    float  val2  = theOscMessage.get(0).floatValue();
  
    
    if(addr.equals("/1/fader1")) {
       volume = val * 100;
       v_fader1 = val;
       println("volume: " + volume);
     }
     if(addr.equals("/1/fader2")) {
       sustain = val2 * 3 + 0.1;
       v_fader2 = val2;
       println("sustain: " + sustain);
     }

      
}

void draw() {
  //background();
  image(makarov, 100, 100);
  image(piano, 0, 0);
  
  
  
    // fader 1 outlines
    fill(0);
    stroke(255, 237, 0);
    rect(17, 200, 60, 255);
    
    // fader 1 fills
    fill(255, 237, 0);
    text("Volume", 17, 195, 40);
    rect(17,200 + 255 - v_fader1*255, 60, v_fader1*255);
    
    fill(255, 0, 255);
    text(round(v_fader1 * 100) + "%", 20, 325);
    
    // fader 2 outlines
    fill(0);
    stroke(255, 0, 255);
    rect(150, 200, 60, 255);
    
    // fader 2 fills
    fill(255, 0, 255);
    text("Sustain", 150, 195, 40);
    rect(150, 200 + 255 - v_fader2*255, 60, v_fader2*255);
    
    fill(255, 237, 0);
    text(round(v_fader2 * 100) + "%", 153, 325);

    
    if (knappar.containsKey('a') && knappar.get('a').equals(true)) {
      image(vit1, xtangent + 21, 19);
    }
    if (knappar.containsKey('s') && knappar.get('s').equals(true)) {
      image(vit2, xtangent + 55, 19);
    }
     if (knappar.containsKey('d') && knappar.get('d').equals(true)) {
      image(vit3, xtangent + 90, 19);
    }
     if (knappar.containsKey('f') && knappar.get('f').equals(true)) {
      image(vit1, xtangent + 125, 19);
    }
     if (knappar.containsKey('g') && knappar.get('g').equals(true)) {
      image(vit2, xtangent + 159, 19);
    }
     if (knappar.containsKey('h') && knappar.get('h').equals(true)) {
      image(vit2, xtangent + 194, 19);
    }
     if (knappar.containsKey('j') && knappar.get('j').equals(true)) {
      image(vit3, xtangent + 229, 19);
    }
     if (knappar.containsKey('k') && knappar.get('k').equals(true)) {
      image(vit1, xtangent + 263, 19);
    }
    
     if (knappar.containsKey('w') && knappar.get('w').equals(true)) {
      image(svart, xtangent + 46, 19);
    }
     if (knappar.containsKey('e') && knappar.get('e').equals(true)) {
      image(svart, xtangent + 80, 19);
    }
     if (knappar.containsKey('t') && knappar.get('t').equals(true)) {
      image(svart, xtangent + 149, 19);
    }
     if (knappar.containsKey('y') && knappar.get('y').equals(true)) {
      image(svart, xtangent + 184, 19);
    }
     if (knappar.containsKey('u') && knappar.get('u').equals(true)) {
      image(svart, xtangent + 218, 19);
    }
    
  
}

void keyReleased() {
  knappar.put(key,false);
}

void keyPressed() {

  
  if(keyCode == RIGHT) {
    tone = tone + 12;
    xtangent = xtangent + 242;
  }
  if(keyCode == LEFT){
    tone = tone - 12;
    xtangent = xtangent - 242;
  }
  knappar.put(key, true);
  
 
  if(key == 'a' || key == 'A') {
    scs[sIndex].playNote(tone, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'w' || key == 'W') {
    scs[sIndex].playNote(tone + 1, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 's' || key == 'S') {
    scs[sIndex].playNote(tone + 2, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'e' || key == 'E') {
    scs[sIndex].playNote(tone + 3, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'd' || key == 'D') {
    scs[sIndex].playNote(tone + 4, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'f' || key == 'F') {
    scs[sIndex].playNote(tone + 5, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 't' || key == 'T') {
    scs[sIndex].playNote(tone + 6, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'g' || key == 'G') {
    scs[sIndex].playNote(tone + 7, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'y' || key == 'Y') {
    scs[sIndex].playNote(tone + 8, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'h' || key == 'H') {
    scs[sIndex].playNote(tone + 9, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'u' || key == 'U') {
    scs[sIndex].playNote(tone + 10, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
   if(key == 'j' || key == 'J') {
    scs[sIndex].playNote(tone + 11, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
  if(key == 'k' || key == 'K') {
    scs[sIndex].playNote(tone + 12, volume, sustain);
    sIndex = (sIndex + 1) % scs.length;
  }
    
}



