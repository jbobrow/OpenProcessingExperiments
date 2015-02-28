
class ShakingCircle {

  color c; 
  float cx, cy, r, v;


  // default values
  ShakingCircle() {
    c = color(255);
    cx = width/2;
    cy= width/2;
    r= width/4; //radius
    v= 36; //number of vertex
  }

  //constructor
  ShakingCircle(color tempC, float tempCX, float tempCY, float tempR, float tempV ) {
    c = tempC; //color(255);
    cx = tempCX; //width/2;
    cy= tempCY; //width/2;
    r= tempR; //width/4; //radius
    v=tempV; //36; //number of vertex
  }

  void display() {

    noFill();
    stroke(c);

    // begin drawing a new shape
    beginShape();

    //draw circles
    for (int i=1; i<v; i++) {
      float x, y;

      x = cos( radians(360/v*i) )*r + random(12)+ cx;
      y = sin( radians(360/v*i) )*r + random(12)+ cy;

      // start drawing
      vertex( x, y);

      //center
      point( 0, 0);
    }
    endShape(CLOSE);
  }
}


