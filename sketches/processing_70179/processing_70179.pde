
class Thingy {

  //Properties
  float x;
  float y;
  float w;
  color c;

  float thingyRotation;
  float thingyDistFromCenter;

  //Constructor
  Thingy (float x, float y, float w, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.c = c;

    //arbitrary numbers to give initial instance information
    this.thingyRotation = radians(random(360));
    this.thingyDistFromCenter = w;
  }

  // Method or Function
  void drawThingy(float xPos, float yPos) {
    pushMatrix();
    fill(this.c);

    translate(xPos, yPos);
    rotate(this.thingyRotation);

    ellipse( -this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.x, -this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( -this.x, this.y, this.thingyDistFromCenter, this.thingyDistFromCenter );
    popMatrix();
  }
}


