
Flock flock = new Flock ();

void setup () {
  size (300, 300);
  flock.prime();

} 


void draw () {
  background(0,10,20);
  flock.update();

}

class Object {
  float circSize; //circle dimensions
  float xPos; 
  float yPos;
  float randX;
  float randY;
  float accX;
  float accY;

  void prime (float _xPos, float _yPos, float _circSize) {
    smooth();
    fill(255, 255, 155, 20);
    noStroke();
    circSize = _circSize;
    xPos=_xPos;
    yPos=_yPos;
    accX=.9;
    accY=.9;
  }

  void update () {
    randX = random (-3, 3);
    randY = random (-3, 3);
    xPos += randX;
    yPos += randY;
    ellipse(xPos, yPos, circSize, circSize);
    xPos = constrain(xPos, 0, width);
    yPos = constrain(yPos, 0, height);
  }
}

class Flock {
  Object[] dot = new Object [10];

  void prime () {
    for (int i = 0; i<dot.length; i++) {
      dot[i] = new Object ();
      dot[i].prime(width/2, height/2, 10);
    }
  }


  void update () {
    for (int i = 0; i<dot.length; i++) {
      for (int j = 1; j<dot.length; j++) {
        dot[i].update();
        print (dist(dot[i].xPos, dot[i].yPos, dot[j].xPos, dot[j].yPos)) ;
      
      }
    }
  }
}



//mapping

