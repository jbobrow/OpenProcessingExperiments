
class Ball {
  int diam;       //radius of the ball
  float x;          //how far across the ball is
  float y;          //how far down the ball is
  float changeX;    //amount x is changed
  float changeY;    //amount y is changed
  float elast = -0.7;    //how high the ball bounces
  color Color;    //color of the balls
  
  //constructor for Ball. gives x and y positions plus changeX and changeY and the diameter
  public Ball(float g, float h, float g2, float h2, int d) {
    x = g;
    y = h;
    changeX = g2;
    changeY = h2;    
    diam=d;
    Color = color(random(0,150),random(0,150),random(150,200)); //mainly blue colors
    //Color = color(random(255), random(255), random(255)); //completely random colors
  }

  //moves the ball in the y direction. if the ball is at or below the bottom of the screen it bounces.
  public void moveY() {

    changeY = changeY + grav;
    if(y <= (height-diam/2)) //if the ball is is not off the bottom of the screen
      y = y + changeY;
    else
      this.bounce();
  }

  //moves the ball in the x direction
  public void moveX() {

    x = x + changeX;
  }

  //makes the ball bounce
  public void bounce() {

    this.boing(changeY); //causes a noise to occur
    changeY = changeY * elast;
    y = height-diam/2;    //sets the balls back to the base line
  }

  //makes a sound when the bounce method is called
  public void boing(float vel) {

    if(vel>0) {
      int vel2 = getFreq(vel); 
      Oscillator w = (Oscillator)waves.get(vel2);
      w.setAmp(0.5); //sets the volume to max
      waves.set(vel2, w); //replaces the old sound with the new one
    }
  }
}


