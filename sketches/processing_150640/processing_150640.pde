
/*  BASIC ROTATING LINE WITH ELLIPSES
    uses a class and an object
    by R Knight 03-06-2014
    twitter: @dukidog
*/


// initialize a rotating line object
RotatingLine rLine = new RotatingLine
  (
    150,  // set the x position of the rotating green line
    150,  // set the y position of the rotating green line
    100,  // set the length of the rotating green line
    0     // set the starting gngle of the rotating green line
  );


// start of main routine

void setup() {
  // general processing setup
  size ( 300, 300 );
  frameRate(60);
  noFill();
}



void draw() {

  // clear the display every loop
  background ( 255 );

  // draw yellow ellipse that the line will rotate within
  stroke ( 255, 255, 0 );
  ellipse ( width/2, height/2, rLine.lineLength*2, rLine.lineLength*2 );

  // draw magenta ellipse at the centre of the rotating green line
  stroke (255, 0, 255 );
  ellipse ( rLine.posX, rLine.posY, 10, 10 );

  // draw blue ellipse at one end of the green rotatin line
  stroke ( 0, 0, 255 );
  ellipse
    (
      rLine.posX - cos( radians( rLine.angle )) * rLine.lineLength,
      rLine.posY - sin( radians( rLine.angle )) * rLine.lineLength,
      10,
      10
    );

  // draw red ellipse at the other end of the green rotating line
  stroke ( 255, 0, 0 );
  ellipse
    (
      rLine.posX + cos( radians( rLine.angle )) * rLine.lineLength,
      rLine.posY + sin( radians( rLine.angle )) * rLine.lineLength,
      10,
      10
    );

  // draw green rotating line (see class RotatinLine below for the .Draw function)
  rLine.Draw();

  // increase the angle (see class RotatinLine below for the .ChangeAngle function)
  rLine.ChangeAngle();

  // display frame rate
  // NOTE: This follwing line causes the sketch to fail in javascript mode
  // frame.setTitle(int(frameRate)+" fps");

}

// end of main routine




class RotatingLine {

  // declare class variables
  int posX, posY, lineLength;
  float angle;
  
  // declare which variables are required upon initalization
  RotatingLine( int x, int y, int l, float a )
  {
    posX = x;
    posY = y;
    lineLength = l;
    angle = a;
  }
  
  void Draw() {

    // set the line colour to green
    stroke ( 0, 255, 0 );

    // draw the line
    line
      (
      this.posX - cos( radians( this.angle )) * this.lineLength,
      this.posY - sin( radians( this.angle )) * this.lineLength,
      this.posX + cos( radians( this.angle )) * this.lineLength,
      this.posY + sin( radians( this.angle )) * this.lineLength
      );
  }
  
  void ChangeAngle() {

    // increase angle variable by one
    this.angle++;

    // if the angle variable is greater than 360 then reset to zero
    if (this.angle>360) {
      this.angle=0;
    }
  }
}


