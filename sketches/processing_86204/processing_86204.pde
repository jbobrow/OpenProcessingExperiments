
/*
 * Classic demo hack: Star Journey.
 *
 * I've always wanted to do one of these ever since I saw
 * this bullshit on a Commodore 64 back in the day.
 * Now, I just sat down and goddamn wrote it. And when I
 * consider how *easy* this was to write, I'm just
 * bloody flabbergasted.
 *
 * (c) Urpo Lankinen 2013-01-20. CC BY-SA 3.0/GNU GPL
 */

class Star {
  // How big the star is.
  protected int size;
  // Where it is.
  protected PVector pos;
  // How fast the star is moving.
  protected PVector speed;
  
  // Construct a new star.
  public Star() {
    // Make new vector objects.
    pos = new PVector();
    speed = new PVector();
    
    // Put the star a bit left off the screen
    pos.x = (int)random(-(width*0.2),0);
    // It can be anywhere on the Y axis, really.
    pos.y = (int)random(0,height);
    
    // Make up a random size or something.
    size = (int)random(0,20);
    // Speed is based on size.
    speed.x = size;
    speed.y = 0;
  }
  // Move the star. Called every frame.
  public void move() {
    // Basically just add position vector to speed vector.
    pos.add(speed);
  }
  // Draw the star on screen.
  public void draw() {
    stroke(255);
    fill(255);
    ellipse(pos.x,pos.y,size,size);    
  }
  // Is the star ripe to be removed from screen?
  public boolean isDead() {
    // If it's past the margin, yes. Otherwise, no.
    if(pos.x > width+(int)((float)width*0.2))
      return true;
    return false;
  }
}

// Array of our stars.
Star[] stars;
// How many stars do we have?
final int nStars = 50;

void setup() {
  // The basics.
  size(640,480);
  frameRate(30);
  // Populate star array.
  stars = new Star[nStars];
  for(int i = 0; i < nStars; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  // Go through our star array.
  for(int i = 0; i < nStars; i++) {
    // Draw the star.
    stars[i].draw();
    // Move the star.
    stars[i].move();
    // Is it dead? If so, replace it with a new star.
    if(stars[i].isDead()) {
      stars[i] = new Star();
    }
  }  
}



