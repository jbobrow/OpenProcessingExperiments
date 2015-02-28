
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
  float tx;
  float ty;

  //Constructor
  Thingy (float x, float y, float w, float h, color c, float tx, float ty) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.tx = tx;
    this.ty = ty;

    //arbitrary numbers to give initial instance information
    this.thingyDistance = 100;
    this.thingyRotationMod = 0;
    this.thingyRotation = 0;
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

  void drawThingyPolygon(float xPos, float yPos, int sides) {

    pushMatrix();
    fill(this.c);

    translate(xPos, yPos);
    rotate(this.thingyRotation);

    // using custom sided polygons instead of circles
    if (sides>2) {
      beginShape();
      float x;
      float y;
      for (int i=0;i<sides;i++) {
        vertex(-(this.x+(float)(this.thingyDistFromCenter*Math.sin((i+1) * ((2*PI) / sides)))), -(this.y+(float)(this.thingyDistFromCenter*-Math.cos((i+1) * ((2*PI) / sides)))));
      }
      endShape();
    }

    if (sides>2) {
      beginShape();
      float x;
      float y;
      for (int i=0;i<sides;i++) {
        vertex((this.x+(float)(this.thingyDistFromCenter*Math.sin((i+1) * ((2*PI) / sides)))), -(this.y+(float)(this.thingyDistFromCenter*-Math.cos((i+1) * ((2*PI) / sides)))));
      }
      endShape();
    }

    if (sides>2) {
      beginShape();
      float x;
      float y;
      for (int i=0;i<sides;i++) {
        xPos += (float)(this.thingyDistFromCenter*Math.sin((i+1) * ((2*PI) / sides)));
        yPos += (float)(this.thingyDistFromCenter*-Math.cos((i+1) * ((2*PI) / sides)));
        vertex((this.x+(float)(this.thingyDistFromCenter*Math.sin((i+1) * ((2*PI) / sides)))), (this.y+(float)(this.thingyDistFromCenter*-Math.cos((i+1) * ((2*PI) / sides))))
          );
      }
      endShape();
    }

    if (sides>2) {
      beginShape();
      float x;
      float y;
      for (int i=0;i<sides;i++) {
        vertex(-(this.x+(float)(this.thingyDistFromCenter*Math.sin((i+1) * ((2*PI) / sides)))), (this.y+(float)(this.thingyDistFromCenter*-Math.cos((i+1) * ((2*PI) / sides))))
          );
      }
      endShape();
    }
    popMatrix();
  }

  void updateThingy(float xPos, float yPos) {
    //captures the distance from thingyX and thingyY to mouseX/MouseY
    this.thingyDistance = dist (xPos, yPos, mouseX, mouseY);

    //maps distance to a value that can be used for rotation
    this.thingyRotationMod = map (this.thingyDistance, 0, width, 10, .1);

    //maps distance to a value that can be used for the size of circle
    this.thingyDistFromCenter = map(this.thingyDistance, 0, width, 60, 20);

    //determines rotation
    this.thingyRotation += radians (this.thingyRotationMod);
  }
}


