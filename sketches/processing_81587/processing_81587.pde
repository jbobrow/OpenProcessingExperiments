
class MovableImage {
  //
  // Properties
  //
  PImage img;
  float w, h;
  PVector loc = new PVector(0, 0, 0);
  PVector vel = new PVector(0, 0, 0);
  boolean isMoving = true;
 
  //
  // Constructors 
  //
  // Construct the image object as it is.
  MovableImage(String filename) {
    this.img = loadImage(filename);
    this.w = this.img.width;
    this.h = this.img.height;
    this.setLocation();
    this.setVelocity();
  }
 
  // Construct the image object and resize by max width & height.
  MovableImage(String filename, int maxW, int maxH) {
    this.img = loadImage(filename);
    if (this.img.width > maxW || this.img.height > maxH) {
      float ratioW = maxW / this.img.width;
      float ratioH = maxH / this.img.height;
      if (ratioW < ratioH) {
        this.img.resize(maxW, round(this.img.height * ratioW));
      }
      else {
        this.img.resize(round(this.img.width * ratioH), maxH);
      }
    }
    this.w = this.img.width;
    this.h = this.img.height;
    this.setLocation();
    this.setVelocity();
  }
 
  //
  // Methods
  //
  // Display image
  void display() {
    image(this.img, this.loc.x, this.loc.y);
    // Display text information...
    //fill(50);
    //text(this.w+","+this.h, this.loc.x, this.loc.y);
  }
 
  // Update location and properties
  void update() {
    if (this.isMoving) {  // Do I need to update myself?
      this.loc.add(this.vel);
      // Boundary checking
      if (this.loc.x < 0 || this.loc.x > width-this.w) {
        this.vel.x = -this.vel.x;
      }
      if (this.loc.y < 0 || this.loc.y > height-this.h) {
        this.vel.y = -this.vel.y;
      }
    }
  }
 
  // Set location
  void setLocation() {
    this.loc.set(random(width/2), random(height/2), 0.0);
  }
   
  // Set velocity
  void setVelocity() {
    this.vel.set(random(-3,3), random(-3,3), 0.0);
  }
 
  // Toggle action flag isMoving
  void toggleMoving() {
    this.isMoving = !this.isMoving;
  }
 
  // Is mouse cursor over me?
  boolean mouseOverMe() {
    if ((mouseX >= this.loc.x && mouseX <= this.loc.x+this.w) &&
      (mouseY >= this.loc.y && mouseY <= this.loc.y+this.h)) {
      return true;
    } else {
      return false;
    }
  }
 
} // end of class


