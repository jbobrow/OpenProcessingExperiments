
/*
 ** Button.pde
 ** Created by Xiaolan Wang
 ** xiaolanw@sfu.ca
 
 ** This Button class is used to create button elements
 ** It includes eight properties: PImage img, PImage imgOver, int x, int y,int wide, int higt, boolean over and boolean pressed
 ** Besides get and set methods for properties, there are four other methods: press(), display(), update() and disappear().
 */


class Button {

  //properties
  PImage img = loadImage("btn.png");; 
  PImage imgOver = loadImage("btn.png"); 
  int x, y; // The x- and y-coordinates
  int wide, higt; // Dimension (width and height)
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed

  // constructor
  Button(int x, int y, int wide, int higt) {
    this.x = x;
    this.y = y;
    this.wide = wide;
    this.higt = higt;
  }

  // get and set methods for properties
  PImage getImg() {
    return this.img;
  }

  void setImg(PImage img) {
    this.img = img;
  }

  PImage getImgOver() {
    return this.imgOver;
  }

  void setImgOver(PImage imgOver) {
    this.imgOver = imgOver;
  }

  int getX() {
    return this.x;
  }

  void setX(int x) {
    this.x = x;
  }

  int getY() {
    return this.y;
  }

  void set(int y) {
    this.y = y;
  }

  int getWide() {
    return this.wide;
  }

  void setWide(int wide) {
    this.wide = wide;
  }

  int getHigt() {
    return this.higt;
  }

  void setHigt(int higt) {
    this.higt = higt;
  }


  boolean getOver() {
    return this.over;
  }

  void setOver(boolean over) {
    this.over = over;
  }

  boolean getPressed() {
    return this.pressed;
  }

  void setPressed(boolean pressed) {
    this.pressed = pressed;
  }

  // Updates the over field every frame
  void update() {
    if ((mouseX >= x) && (mouseX <= x+wide) &&
      (mouseY >= y) && (mouseY <= y+higt)) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  // detect whether the button is pressed or not
  boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } 
    else {
      return false;
    }
  }

  /*
   * show different states according to the value of pressed and over
   * disappear after it is pressed, show imgOver when it is hover
   */
  void display() {   
    if (pressed == true) {
      this.disappear();
    } 
    else if (over == true) {
      image(imgOver, x, y, wide, higt);
    } 
    else { 
      image(img, x, y, wide, higt);
    }
  }
  // move the button out side of the window
  void disappear() {
    this.x = -500;
  }
}


