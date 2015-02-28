
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;         
AudioPlayer mySound;

int boxSize = 100;
int [] Colors = new color [5];

void setup() {
  smooth();
  size(600,600, P3D);
  minim = new Minim(this);
  mySound = minim.loadFile("BORETA.mp3", 2048);
  mySound.loop();

  Colors[0] = color (38, 37, 38);
  Colors[1] = color (64, 64, 64);
  Colors[2] = color (140, 137, 121);
  Colors[3] = color (242, 242, 242);
  Colors[4] = color (246, 10, 32);
}

void draw() {
  camera(3000,-2000,3000,width/2,height/2,0,0,1,0);
  background(255);


  for(int i = 0; i < mySound.bufferSize() - 1; i+= boxSize + .5*boxSize) {

    pushMatrix();
    translate (i, 0, 0);

    for (int x = 0; x < mySound.bufferSize(); x += boxSize + .5*boxSize) {      
      pushMatrix();

      float Color = map(mySound.mix.get(i), -1, 1, 0, 6);

      if (Color > 0) {
        fill (Colors[0]);
        if (Color > 1) {
          fill (Colors[1]);
          if (Color > 2) {
            fill (Colors[2]);
            if (Color > 3) {
              fill (Colors[3]);
              if (Color > 4) {
                fill (Colors [4]);
              }
            }
          }
        }
      }

      translate(250, -800, x);
      box(boxSize, boxSize + mySound.mix.get(i)*400, boxSize);


      popMatrix();
    }
    popMatrix();
  }
}

// here we provide a way to mute mySound
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
}

void stop()
{
  mySound.close();
  minim.stop();

  super.stop();
}


