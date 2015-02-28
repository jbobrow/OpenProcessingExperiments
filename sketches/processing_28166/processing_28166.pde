
import ddf.minim.*;

Minim minim;
AudioSample stomp;

PImage jungle;
PImage [] eleph;
int frame = 0;
int x = 250;
int y = 250;
float rot = 0;
float desiredRot = 0;

void setup() {
  size (500, 500);
  minim = new Minim(this);
  stomp = minim.loadSample("BD.mp3", 2048);
  eleph = new PImage[3];
  for(int i = 0; i<eleph.length; i++) {
    eleph[i] = loadImage("Atlas"+ (i+1) +".png");
  }
  jungle = loadImage("jungle.jpg");
}


void draw() {
  
  if(frame > 2) frame = 0;
  
  rot += (desiredRot-rot)*0.1;
  
  image(jungle, 0,0, 500, 500);

  pushMatrix();
  translate(x, y);
  rotate(rot);
  image(eleph[frame], -38, -30, 75, 100);
  popMatrix();
}


void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      x += 5;
      desiredRot = -.5*PI;
      frame++;
      stomp.trigger();
    }
    else if(keyCode==LEFT) {
      x-= 5;
      desiredRot = .5*PI;
      frame++;
      stomp.trigger();
    }
    else if(keyCode == UP) {
      y-= 5;
      desiredRot = PI;
      frame++;
      stomp.trigger();
    }
    else if (keyCode == DOWN) {
      y+= 5;
      desiredRot = 0;
      frame++;
      stomp.trigger();
    }
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  stomp.close();
  minim.stop();
  
  super.stop();
}

