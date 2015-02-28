
import ddf.minim.*;
float newtx;
float newty;
float marshX;
float marshY;
PImage newt;
PImage callista;
PImage marsh;
PImage space;
float moonX = 955;
float moonY = 125;

Minim minim;
AudioPlayer player; 

void setup() {
  size(1200, 900);
  noStroke();
  frameRate(50);
  minim = new Minim(this);
  player = minim.loadFile("Evil Laugh.mp3");
  newt = loadImage("newt.png");
  callista = loadImage("Callista.png");
  marsh = loadImage("marshydude2.png");
  space = loadImage("space.png");
  smooth();
}

void draw(){
  newtx = mouseX - 50;
  newty = mouseY - 50;
  marshX = marshX + random(-50, 50);
  marshY = marshY + random(-40, 40);
  marshX = constrain(marshX, 0, width);
  marshY = constrain(marshY, 0, height);
  if (mouseX > moonX +5 && mouseX < moonX +30 && 
      mouseY > moonY - 10 && mouseY < moonY + 20) {
    image(marsh, marshX, marshY);
    translate(random(-50, 50), random(-50, 50));
    player.play();
    player.unmute();
  }
  else {
  image(space, 0, 0);
  image(callista, 500, 400);
  image(newt, newtx, newty);
  player.mute();
  }
}



  


