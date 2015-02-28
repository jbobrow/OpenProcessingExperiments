
import ddf.minim.*; //yw// It's a library named minim i've found from processing official site 
import ddf.minim.effects.*;

Minim minim;
AudioPlayer[] dsound = new AudioPlayer[3];

Dot[] d = new Dot[3];
boolean[] toggle = new boolean[3];

//Setup does not change
void setup() {
  size(700, 280);
  smooth();
  for (int i=0; i<3; i++) {
    d[i] = new Dot(0.6, 19, width*(i+1)/4, height/2);
  }

  minim = new Minim(this);
  dsound[0] = minim.loadFile("drum1.wav");
  dsound[1] = minim.loadFile("drum2.wav");
  dsound[2] = minim.loadFile("drum3.wav");
  for (int i=0; i<3; i++) {
    dsound[i].mute();
    toggle[i] = true;   
  }

  for (int i=0; i<3; i++) {  
    dsound[i].loop();
  }
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
    
    
    
    if (dist(mouseX, mouseY, width*(i+1)/4, height/2)<15) {
      if (toggle[i]) {
        dsound[i].unmute();
        toggle[i] = false;
      }
      else {
        dsound[i].mute();
        toggle[i] = true;
      }
    }
  }
}


void stop()
{
  // always close Minim audio classes when you finish with them
  for (int i=0; i<3; i++)
  {
    dsound[i].close();
  }


  // always stop Minim before exiting
  minim.stop();

  super.stop();
}

class Dot {
  int circleNumber = 15;
  int dotColor = 60;
  int circleColor = 0;
  float gap;
  float radiusgap;
  float xpos;
  float ypos;
  float[] radius = new float[circleNumber];
  float[] activeAlpha= new float[circleNumber];


  Dot(float tempgap, float tempradiusgap, float tempxpos, float tempypos) {
    gap = tempgap;
    radiusgap = tempradiusgap;
    xpos = tempxpos;
    ypos = tempypos;

    for (int i=0;i<circleNumber;i++) {
      radius[i] = radiusgap*(i+1);
    }
  }



  void infinitMoving() {
    for (int i=0;i<circleNumber;i++) {
      radius[i] += gap;
      activeAlpha[i] = 255 - radius[i];
      if (radius[i] > (radiusgap+1)*circleNumber) {
        radius[i] = (radiusgap+1);
      }
      //stroke(255);
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
      } 
      else {
        dotColor = 60;
        circleColor = 0;
        println("it works");
      }
    }
}


  void display() {
    fill(dotColor);
    ellipse(xpos, ypos, 15, 15);
  }
}



