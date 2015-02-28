
color c;

Eyes eyes[];
void setup () {
  size (500, 500);
  fill(0);
  smooth();
  eyes = new Eyes[15];
  for (int i=0; i<eyes.length; i++) {
    color c= color(random(255), random(255), random(255));
    eyes[i] = new Eyes (random(0, width), random(0, height), (int)random(15, 100), (int)random(5, 10), (int)random(5, 10), c);
  }
}

void draw () {
  background(0);
  for (int i=0; i<eyes.length; i++) {
    eyes[i].around ();
    eyes[i].display ();
  }
  if (mousePressed==true) {
    c = 0;                //tried to get them to blink when th mouse is pressed
  }
}

class Eyes {
  color eyeColor;
  float x;
  float y;
  int eyeSize;
  int blink;
  int xSpeed;
  int ySpeed;



  Eyes(float _x, float _y, int _eyeSize, int _xSpeed, int _ySpeed, color _eyeColor) {
    x=_x;
    y=_y;
    eyeSize= _eyeSize;
    eyeColor= _eyeColor;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    blink = 0;
  }

  void around() {
    x=x+xSpeed;
    y=y+ySpeed;

    if (x>width || x<0) {
      xSpeed*=-1;
    }

    if (y>height || y<0) {
      ySpeed*= -1;
    }
  }

  void display () {
    fill(eyeColor);


    //eyes
    ellipse (x, y, eyeSize, eyeSize-10);  //so that they are like opals
    ellipse (x+eyeSize +10, y, eyeSize, eyeSize-10); //second eye

    //eyeballs
    ellipseMode (CENTER);
    fill(0);
    ellipse(x+5, y, eyeSize/3, eyeSize/3);
    ellipse(x+eyeSize+15, y, eyeSize/3, eyeSize/3);

   
  }
}

