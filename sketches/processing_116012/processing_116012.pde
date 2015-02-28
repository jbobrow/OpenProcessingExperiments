
import ddf.minim.*;

Minim minim;

Dot[] d = new Dot[3];
 
//Setup does not change
void setup() {
  size(700, 280);
  smooth();
  
  minim = new Minim(this);
  
  d[0] = new Dot(0.6, 19, width*1/4, height/2, "drum1.wav");
  d[1] = new Dot(0.6, 19, width*2/4, height/2, "drum2.wav");
  d[2] = new Dot(0.6, 19, width*3/4, height/2, "drum3.wav");

}
 
void draw() {
  background(0);
  for (int i=0; i<3; i++)
  {
    d[i].infinitMoving();
    d[i].display();
  }
}
 
 
void mouseReleased() {
  for (int i=0; i<3; i++)
  {
    d[i].dotmouseReleased();
  }
}
 

void stop()
{
  for (int i=0; i<3; i++)
  {
    d[i].over();
  }
  
  minim.stop();
  
  super.stop();
}
 
class Dot {
  int circleNumber = 15;
  int dotColor = 60;
  int circleColor = 0;
  float gap;
  float radiusgap; //the statistic gap between radius
  float xpos;
  float ypos;
  float[] radius = new float[circleNumber];
  float[] activeAlpha= new float[circleNumber];
  AudioPlayer dotSoundPlayer;

 
  Dot(float tempgap, float tempradiusgap, float tempxpos, float tempypos, String soundFileName) {
    gap = tempgap;
    radiusgap = tempradiusgap;
    xpos = tempxpos;
    ypos = tempypos;
    
    dotSoundPlayer = minim.loadFile(soundFileName);

    dotSoundPlayer.mute();
        
    dotSoundPlayer.loop();

    for (int i=0;i<circleNumber;i++) {
      radius[i] = radiusgap*(i+1);
    }
  }
 
 
 
  void infinitMoving() {
    for (int i=0;i<circleNumber;i++) {
      radius[i] += gap;
      activeAlpha[i] = 255 - radius[i];
      if (radius[i] > radiusgap*circleNumber) {
        radius[i] = radiusgap;
      }
      stroke(circleColor, activeAlpha[i]);
      noFill();
      ellipse(xpos, ypos, radius[i], radius[i]);
    }
  }
 
 
void dotmouseReleased() {
 
    if (dist(mouseX, mouseY, xpos, ypos)<15) {
      if (dotColor == 60) {
        dotColor = 255;
        circleColor = 255;
        dotSoundPlayer.unmute();
      }
      else {
        dotColor = 60;
        circleColor = 0;
        dotSoundPlayer.mute();
      }
    }
}
 
 
  void display() {
    fill(dotColor);
    ellipse(xpos, ypos, 15, 15);
  }
  
  void over(){
    dotSoundPlayer.close();
    minim.stop();
   }
}



