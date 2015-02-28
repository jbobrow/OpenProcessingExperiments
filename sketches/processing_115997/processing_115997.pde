


Dot[] d = new Dot[3];

//Setup does not change
void setup() {
  size(700, 280);
  smooth();
  for (int i=0; i<3; i++) {
    d[i] = new Dot(0.6, 19, width*(i+1)/4, height/2);
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
  }
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
      if (radius[i] > radiusgap*circleNumber) {
        radius[i] = radiusgap;
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



