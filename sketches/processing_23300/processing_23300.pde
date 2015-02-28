
import gifAnimation.*;
PImage b;
Gif sonic, zelda, current;

void setup(){
  size(302,450);
  frameRate(12);
  sonic = new Gif(this, "cellphone3.gif");
  zelda = new Gif(this, "alarmoff.gif");
  current = sonic;
  current.play();
  b = loadImage("bed.png");
  fill(0);
}

void draw() {
  background(b);
  image(current, 10,10);
}

void keyPressed(){
  if(keyCode == DELETE || keyCode == BACKSPACE){
    current=zelda;
    current.play();
  }
  if(key==' '){
    current.stop();
  }
}


