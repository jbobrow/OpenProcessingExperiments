
class Thingy {

  //Properties
  float x;
  float y;
  float w;
  float h;
  color c;

  float thingyDistance;
  float thingyRotation;
  float thingyRotationMod;
  float thingyDistFromCenter;
  
  float posX;
  float posY;

  //Constructor
  Thingy (float x, float y, float w, float h, color c, float posX, float posY) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    
    this.posX = posX;
    this.posY = posY;

    //arbitrary numbers to give initial instance information
    this.thingyDistance = 10;
    this.thingyRotationMod = 10;
    this.thingyRotation = 100;
    this.thingyDistFromCenter = w*2;
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

  void updateThingy(float xPos, float yPos) {
    //captures the distance from thingyX and thingyY to mouseX/MouseY
    this.thingyDistance = dist (xPos, yPos, mouseX, mouseY);
    
    //maps distance to a value that can be used for rotation
    this.thingyRotationMod = map (this.thingyDistance, 0, width, 10, .01);

    //maps distance to a value that can be used for the size of circle
    this.thingyDistFromCenter = map(this.thingyDistance, 0, width, 60, 20);

    //determines rotation
    this.thingyRotation += radians (this.thingyRotationMod)*4;
  }
}


