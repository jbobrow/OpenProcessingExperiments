
class Photograph {
  
  // instance variables
  int yearTaken;
  float x, y, z, w, h;
  float startX, startY, startZ, startAngle;
  float endX, endY, endZ, endW, endH, endAngle;
  float thumbWidth, thumbHeight, fullWidth, fullHeight;
  String format;
  String url;
  PImage photo;
  PFont caption;
  Boolean isZoomed = false;
  Boolean isHovered = false;
  float opacity = 0;
  float angle;
  float damping = 0.09;

  // "outbound" relations
  Structure structure;
  
  // constructor
  Photograph(int yearTaken_, String format_, Structure structure_, String url_, float thumbWidth_, float fullWidth_, float x_, float y_, float z_, float angle_) {
    yearTaken = yearTaken_;
    format = format_;
    url = url_;
    thumbWidth = thumbWidth_;
    fullWidth = fullWidth_;
    structure = structure_;
    x = x_;
    y = y_;
    z = z_;
    angle = angle_;
    
    startAngle = angle_;
    startX = x_;
    startY = y_;
    startZ = z_;
    
    endX = x_;
    endY = y_;
    endZ = z_;
    endAngle = angle_;
    
    caption = loadFont("HelveticaNeue-Bold-11.vlw");
    textFont(caption);
  }
  
  void load() {
    photo = loadImage(url, "png");
     
    // calculate height after image has been loaded to get the full image height from file
    thumbHeight = (thumbWidth / photo.width) * photo.height; // calc thumbnail height from width
    fullHeight = (fullWidth / photo.width) * photo.height; // calc fullsize height from width
    
    // set initial size
    w = thumbWidth;
    h = thumbHeight;
  }
  
  void display() {

    x = x + (endX - x) * damping;
    y = y + (endY - y) * damping;
    z = z + (endZ - z) * damping;
    angle = angle + (endAngle - angle) * damping;
    
    pushMatrix();
    
    translate(x, y, z);
    rotateY(radians(angle));
    image(photo, 0, 0, w, h);
    
    /*
    // draw caption
    fill(255);
    String txt = structure.itemName + "\n" + structure.city + "\n" + yearTaken;
    text(txt, 0, 0); //x, y + h + 20
    */
    
    popMatrix();
  }
  
  void position(float x_, float y_, float z_, float angle_) {
    endX = x_;
    endY = y_;
    endZ = z_;
    endAngle = angle_;
  }
  
  Boolean isMouseDown() {
    
    if ((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)) {
       // scale photo
       if (!isZoomed) {   
         isZoomed = true;
       } else {
         isZoomed = false;
       }
       return true;
    }
    return false;
  }
  
  Boolean isMouseOver() {
    if ((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)) {
      isHovered = true;
      return true;
    } else {
      isHovered = false;
      return false;
    }
  }
}

