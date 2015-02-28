
//Eye class

class Eyes {

  float eyeX; //eye postion in x
  float eyeY; //eye postion in y
  float eyeS; //eye size
  float eyeGap; //gap between eyes

  Eyes(float eyeX_, float eyeY_, float eyeS_, float eyeGap_) {
    eyeX = eyeX_;
    eyeY = eyeY_;
    eyeS = eyeS_;
    eyeGap = eyeGap_;
  }

  public void display() {
    noStroke();
    fill(0);
    ellipseMode(CENTER);

    //left eye
    ellipse(eyeX - eyeGap, eyeY, eyeS, eyeS);
    //right eye
    ellipse(eyeX + eyeGap, eyeY, eyeS, eyeS);
  }

  public void update(float eyeGap_) {
    eyeGap = eyeGap_;
  }

}



