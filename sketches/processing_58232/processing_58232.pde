
//PS3-4
//Georgina Yeboah
//falling raindrops using arrays
float [] y= new float [100];
float [] x = new float [100];
float [] speed = new float [100];
//---------------------------------------------------------------
void setup () {
  size (600, 300);
  smooth();
  noStroke();

  for (int i = 0; i < y.length; i++) {
    x[i] = random (width);
    y[i] = random (height);
    speed[i] = random(0.1, 1);
  }
}

void draw () {
  background(222, 235, 247);
  fill(84, 167, 252, 116);
  // creating the raindrop shape (complex shape)
  for (int r = 0; r < 8; r++) 

    //---------------------------------------------------------------

    for (int i = 0; i < y.length; i++) {
      // now putting that raindrop shape into this array loop
      ellipse(x[i], y[i]+r*4, r*2, r*2);
      y[i] += speed[i];
      if (y[i] > height) y[i] = -5;
    }
}


