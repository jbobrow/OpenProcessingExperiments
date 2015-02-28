
import ddf.minim.*;
PImage bg, b1, b1p, b2, b2p, b3, b3p, b4, b4p, b5, b5p, b6, b6p;
int iW=144; int iH=28;
int numButtons=6;
boolean pressed1, pressed2, pressed3, pressed4, pressed5, pressed6 = false;
int screamCount;

Minim minim;

// declares the variable for each scream sound
AudioPlayer scream1,scream2,scream3,scream4,scream5,scream6,tenScreams;

void setup(){
  size(600,300);
  
  // loads all of the images for the interface
  minim=new Minim(this);
  bg=loadImage("bg.jpg");
  b1=loadImage("01.png"); b1p=loadImage("01_.png");
  b2=loadImage("02.png"); b2p=loadImage("02_.png");
  b3=loadImage("03.png"); b3p=loadImage("03_.png");
  b4=loadImage("04.png"); b4p=loadImage("04_.png");
  b5=loadImage("05.png"); b5p=loadImage("05_.png");
  b6=loadImage("06.png"); b6p=loadImage("06_.png");
  
  // loads all of the sounds
  scream1=minim.loadFile("dylan.wav");
  scream2=minim.loadFile("fred.wav");
  scream3=minim.loadFile("lynn.wav");
  scream4=minim.loadFile("mike.wav");
  scream5=minim.loadFile("tom.wav");
  scream6=minim.loadFile("lindsey.wav");
  tenScreams=minim.loadFile("dylanLaugh.wav");
}

void draw(){
  image(bg,0,0);
  
  // displays all buttons (not pressed)
  image(b1,44,186);
  image(b2,232,186);
  image(b3,420,186);
  image(b4,44,236);
  image(b5,232,236);
  image(b6,420,236);

  // checks if button is pressed
  if(pressed1==true){
    image(b1p,44,186);
  }
  
  if(pressed2==true){
    image(b2p,232,186);
  }
  
  if(pressed3==true){
    image(b3p,420,186);
  }
  
  if(pressed4==true){
    image(b4p,44,236);
  }
  
  if(pressed5==true){
    image(b5p,232,236);
  }
  
  if(pressed6==true){
    image(b6p,420,236);
  }
  
  if(screamCount%10==0 && screamCount>0){
    tenScreams.loop(0);
    screamCount=0;
  }
}

void mousePressed(){
  
  if (mouseX > 44 && mouseX < 44+iW
  && mouseY > 186 && mouseY < 186+iH) {
    scream1.loop(0);
    image(b1p,44,186);
    pressed1=true;
    screamCount++;
  }
  
  if (mouseX > 232 && mouseX < 232+iW
  && mouseY > 186 && mouseY < 186+iH) {
    scream2.loop(0);
    image(b2p,232,186);
    pressed2=true;
    screamCount++;
  }
  
  if (mouseX > 420 && mouseX < 420+iW
  && mouseY > 186 && mouseY < 186+iH) {
    scream3.loop(0);
    image(b3p,420,186);
    pressed3=true;
    screamCount++;
  }

  if (mouseX > 56 && mouseX < 56+iW
  && mouseY > 236 && mouseY < 236+iH) {
    scream4.loop(0);
    image(b4p,44,236);
    pressed4=true;
    screamCount++;
  }
  
  if (mouseX > 232 && mouseX < 232+iW
  && mouseY > 236 && mouseY < 236+iH) {
    scream5.loop(0);
    image(b5p,232,236);
    pressed5=true;
    screamCount++;
  }
  
  if (mouseX > 420 && mouseX < 420+iW
  && mouseY > 236 && mouseY < 236+iH) {
    scream6.loop(0);
    image(b6p,420,236);
    pressed6=true;
    screamCount++;
  }
}

void mouseReleased(){
  
  // resets all button to unpressed state
  image(b1,44,186);
  image(b2,232,186);
  image(b3,420,186);
  image(b4,44,236);
  image(b5,232,236);
  image(b6,420,236);
  
  pressed1=false;
  pressed2=false;
  pressed3=false;
  pressed4=false;
  pressed5=false;
  pressed6=false;
}

// necessary to successfully use Minim

void stop(){
  scream1.close();
  scream2.close();
  scream3.close();
  scream4.close();
  scream5.close();
  scream6.close();
  tenScreams.close();
  minim.stop();
  super.stop();
}

