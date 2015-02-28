
class Thingy {

  //Properties
  float x;
  float y;
  float w;
  float h;
  color c;
  float posX;
  float posY;


  float thingyDistance;
  float thingyRotation;
  float thingyRotationMod;
  float thingyDistFromCenter;

  //Constructor
  Thingy (float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    //arbitrary numbers to give initial instance information
    this.thingyDistance = 100;
    this.thingyRotationMod = 0;
    this.thingyRotation = 0;
    this.thingyDistFromCenter = w;
    this.posY=random(600);
    this.posX=random(600);
  }

  // Method or Function
  void drawThingy() {
    pushMatrix();
    fill(this.c);

    translate(random(width), random(height));
    rotate(this.thingyRotation);

    ellipse( -this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( -this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    popMatrix();
  }

  void updateThingy() {
    //captures the distance from thingyX and thingyY to mouseX/MouseY
    this.thingyDistance = dist (random(width), random(height), mouseX, mouseY);
    
    //maps distance to a value that can be used for rotation
    this.thingyRotationMod = map (this.thingyDistance, 0, width, 10, .1);

    //maps distance to a value that can be used for the size of circle
    this.thingyDistFromCenter = map(this.thingyDistance, 0, width, 60, 20);

    //determines rotation
    this.thingyRotation += radians (this.thingyRotationMod);
  }
}


