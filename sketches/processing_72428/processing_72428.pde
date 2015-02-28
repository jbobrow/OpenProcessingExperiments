
class Eyes {
  float x, y, xs, ys;
  color c;
  float d;
  float f;

  //constructor
  Eyes(float xPos, float yPos, float xSize, float ySize, color eyeColor, float eyeDist, float freq){
    x = xPos;
    y = yPos;
    xs = xSize;
    ys = ySize;
    c = eyeColor;
    d= eyeDist;
    f = freq;
  }

  void display() {
    if (frameCount % f <8) {
      ellipse(x-d/2, y, xs, ys/10);
      ellipse(x+d/2, y, xs, ys/10);
    }
    else {
      //RIGHT EYE
      //white
      fill(255);
      ellipse(x-d/2, y, xs, ys);
      //iris
      fill(c);
      ellipse(x-d/2, y, 15, 15);
      // pupil
      fill(c);
      ellipse(x-d/2, y, 5, 5);
      //center reference
      
      //LEFT EYE
      //white
      fill(255);
      ellipse(x+d/2, y, xs, ys);
      //iris
      fill(c);
      ellipse(x+d/2, y, 15, 15);
      // pupil
      fill(c);
      ellipse(x+d/2, y, 5, 5);
      //center reference
      //fill(0, 255, 0);
     // rect(x, y, 5, 5);
    }
    }

}


