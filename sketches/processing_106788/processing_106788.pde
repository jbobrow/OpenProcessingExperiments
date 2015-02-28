
Circle[] bob = new Circle[20];

//minim
import ddf.minim.*;
Minim minim;
AudioInput in;


void setup() {

  //set canvas
  size (1440, 850);
  background (0, 5, 15);

  // getting audio input
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);

  for (int i=0; i<bob.length; i++) {
    bob[i]=new Circle();
    bob[i].prime(random(500, width), random(0, height-300), 255, 255, 255);
  }
}

void draw() {
  for (int i=0;i<bob.length;i++) {
    bob[i].drawCircle();
  }
  
}
  
  void keyReleased() {
    if (key == 's' || key == 'S'){
      save("image.jpg");
    }
  }
  


class Circle {

  //declare variables
  float xPos;
  float yPos;
  float ySpeed;
  float ballSize;
  int colorR;
  int colorG;
  int colorB;

  void prime(float a, float b, int r, int g, int bb) {

    xPos=a;
    ySpeed=b;

    colorR = r;
    colorG = g;
    colorB = bb;
  }

  void drawCircle() {

    noStroke();
    fill(colorR, colorG-in.mix.level()*1000, colorB+in.mix.level()*1000, 2);
    ballSize = in.mix.level()*1500;
    yPos = ySpeed+in.mix.level()*1500;
    ellipse (xPos, yPos, ballSize, ballSize);
    
  }
}



