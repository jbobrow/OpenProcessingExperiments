
class ColorDrop {
  float initPosX = 0.0, initPosY = 0.0; // initial position of each drop
  float posY = 0.0; // variable to set and get position of painting drop (if initPosY+posY < initPosY+lengthDrop then move the drop down)
  float lengthDrop = random(50, 200); // length of the drop line
  float diameterDrop = random(1.1, 3.0); // diameter of the drop
  float dropSpeed = random(0.1, 5);
  color colorDrop; // color of the drop

    ColorDrop(float initPosX_, float initPosY_, color colorDrop_) { // position & color
    initPosX = initPosX_;
    initPosY = initPosY_;
    colorDrop = colorDrop_;
  }

  ColorDrop(float initPosX_, float initPosY_, color colorDrop_, float lengthDrop_) { // position, color & length
    initPosX = initPosX_;
    initPosY = initPosY_;
    lengthDrop = lengthDrop_;
    colorDrop = colorDrop_;
  }

  ColorDrop(float initPosX_, float initPosY_, color colorDrop_, float lengthDrop_, float diameterDrop_) { // position, color, length & width
    initPosX = initPosX_;
    initPosY = initPosY_;
    lengthDrop = lengthDrop_;
    diameterDrop = diameterDrop_;
    colorDrop = colorDrop_;
  }

  boolean moveDrop() {
    if (posY <= lengthDrop) {
      posY += noise(1) * dropSpeed;
      return true;
    } 
    else {
      return false;
    }
  }

  void drawDrop() {
    noStroke();
    fill(colorDrop, 255 - int(posY / lengthDrop * 250));
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(initPosX, initPosY + posY, diameterDrop, diameterDrop * 2);
  }
}


