
Thingy[] myThingy = new Thingy[150];

void setup() {
  size(600, 600);
  background(0);
  smooth();
  noStroke();

  for (int i = 0; i < myThingy.length; i++) {
    myThingy[i] = new Thingy();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < myThingy.length; i++) {
    myThingy[i].updateThingy();
    myThingy[i].drawThingy();
  }
}

class Thingy {

  //Properties
  float x = 10;
  float y = 10;
  float w = int(random(10,50));
  float h = int(random(10,50));
  color c = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 130);
  float bigX = int(random(width));
  float bigY = int(random(height));

  float thingyDistance = 100;
  float thingyRotation = 0;
  float thingyRotationMod = 0;
  float thingyDistFromCenter = w;

  void drawThingy() {
    pushMatrix();
    fill(this.c);

    translate(bigX, bigY);
    rotate(this.thingyRotation);

    ellipse(-this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse(this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse(this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( -this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    popMatrix();
  }

  void updateThingy() {
    //captures the distance from thingyX and thingyY to mouseX/MouseY
    this.thingyDistance = dist (bigX, bigY, mouseX, mouseY);

    //maps distance to a value that can be used for rotation
    this.thingyRotationMod = map (this.thingyDistance, 0, width, 10, .1);

    //maps distance to a value that can be used for the size of circle
    this.thingyDistFromCenter = map(this.thingyDistance, 0, width, 60, 20);

    //determines rotation
    this.thingyRotation += radians (this.thingyRotationMod);
  }
}
