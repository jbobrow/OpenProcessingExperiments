
int buttonX = 150;
int buttonY = 150;
int buttonW = 150;
int buttonH = 50;
boolean lightOn = false;
import ddf.minim.*;

Minim myMinim;
AudioPlayer myPlayer;

void setup() {
  size(500,500);
  fill(0,200,255);
  myMinim = new Minim(this);
  myPlayer = myMinim.loadFile("ukelele.wav");
}

void draw()  {
  if (lightOn) {
    background(255,255,0);
  } else {
    background(0,220,20);
  }
  rect(buttonX,buttonY,buttonW,buttonH);
}

void mousePressed() {
  if (mouseX > buttonX && mouseX < buttonX + buttonW && mouseY > buttonY && mouseY < buttonY + buttonW) {
    lightOn = !lightOn;
    fill(255,255,0);
  }
  myPlayer.rewind();
  myPlayer.play();
}

void mouseReleased() {
  fill(0,200,255);
}



