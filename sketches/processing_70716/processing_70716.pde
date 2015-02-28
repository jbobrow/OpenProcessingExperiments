
//Pat Mooney
//CC Lab Homework

Thingy[] myThingy;
float color1;
float color2;
float color3;
float thingyStartX;
float thingyStartY;

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();
  color1 = 0;
  color2 = 0;
  color3 = 0;
  thingyStartX = 0;
  thingyStartY = 0;

  myThingy = new Thingy[153];

  for (int i = 0; i < myThingy.length; i++) {
    float thingySize = random (0, 100);
    float thingyPos = random(0, 20);

    if (color1 < 249) {
      color1 +=5;
    }
    
    if (color1 > 249 && color3 == 0) {
      color2 +=5;
    }
    if (color1 > 249 && color2 > 249) {
      color3 +=5;
    }

    thingyStartX += 50;

    if (thingyStartX > 600) {
      thingyStartY += 50;
      thingyStartX = 0;
    }

    myThingy[i] = new Thingy(thingyPos, thingyPos, thingySize, thingySize, color(color1, color2, color3, 150), thingyStartX, thingyStartY);
  }
}


void draw() {
  background(0);

  for (int i = 0; i < myThingy.length; i++)
  {
    myThingy[i].updateThingy();
    myThingy[i].drawThingy();
  }
}

class Thingy {

  //Properties
  float x;
  float y;
  float w;
  float h;
  color c;
  float startY;
  float startX;

  float thingyDistance;
  float thingyRotation;
  float thingyRotationMod;
  float thingyDistFromCenter;

  //Constructor
  Thingy (float _x, float _y, float _w, float _h, color _c, float _startX, float _startY) {
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.c = _c;
    this.startX = _startX;
    this.startY = _startY;

    //arbitrary numbers to give initial instance information
    this.thingyDistance = 100;
    this.thingyRotationMod = 0;
    this.thingyRotation = 0;
    this.thingyDistFromCenter = w;
  }

  // Method or Function
  void drawThingy() {
    pushMatrix();
    fill(this.c);

    translate(startX, startY);
    rotate(this.thingyRotation);

    ellipse( -this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( -this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    popMatrix();
  }

  void updateThingy() {
    //captures the distance from thingyX and thingyY to mouseX/MouseY
    this.thingyDistance = dist (startX, startY, mouseX, mouseY);
    
    //maps distance to a value that can be used for rotation
    this.thingyRotationMod = map (this.thingyDistance, 0, width, 10, .1);

    //maps distance to a value that can be used for the size of circle
    this.thingyDistFromCenter = map(this.thingyDistance, 0, width, 60, 20);

    //determines rotation
    this.thingyRotation += radians (this.thingyRotationMod);
  }
}
