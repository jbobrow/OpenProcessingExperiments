
class Cube {
  int boxSize;
  float theta;
  float addVal;
  float yTranslate, yTranslateMax;
  float xRotate;
  float colorVal;


  Cube() {
    boxSize = int(random(20, 50));
    theta = 0;
    addVal = random(0, 0.01);
    yTranslateMax = 500;
    yTranslate = random(yTranslateMax);
    xRotate = random(180);
    //xRotate = 0;
  }

  void update() {
    theta = (theta + addVal) % 180;
    colorVal = (colorItr + map(yTranslate, 0, 500, 0, 360)) % 360;
    //println(colorVal + " " + yTranslate);
    fill(colorVal, 360, 360);
    pushMatrix();
    
    //translate to center of screen
    translate(width/2, height/2, 0);
    
    //tilt to give a little better view
    rotateX(-.5);
    
    //move around the y axis, spin
    rotateY(theta);
    
    //piviot up the arc of the z axis
    rotateZ(xRotate);
    
    // move out some distanc eon the x axis and draw teh box
    translate(yTranslate, 0, 0);

    box(boxSize);
    popMatrix();
  }
}


