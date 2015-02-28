
class Photograph {
  
  // instance variables
  int stackOrder = 0;
  float x;
  float y;
  float z;
  float w;
  float h;
  float endX;
  float endY;
  float endZ;
  float endW;
  float endH;
  float thumbWidth;
  float thumbHeight;
  float fullWidth;
  float fullHeight;
  String yearTakenAge;
  String location;
  String persons;
  String url;
  PImage photo;
  Boolean isZoomed = false;
  Boolean isHovered = false;
  float opacity = 0;
  
  // constructor
  Photograph(String yearTakenAge_, String location_, String persons_, String url_, float thumbWidth_, float fullWidth_, float x_, float y_) {
    yearTakenAge = yearTakenAge_;
    location = location_;
    persons = persons_;
    url = url_;
    thumbWidth = thumbWidth_;
    fullWidth = fullWidth_;
    x = x_;
    y = y_;
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
    if (!isZoomed) {
      x = x + (endX - x) * damping;
      y = y + (endY - y) * damping;
      w = w + (thumbWidth - w) * damping;
      h = h + (thumbHeight - h) * damping;
      tint(opacity);
      image(photo, x, y, w, h);
    } else {
      // background
      fill(0, 10, 9, 191);
      rect(0, 0, width, height);
      tint(255);
      image(photo, x, y, w, h);
      x = x + ((width / 2 - fullWidth / 2) - x) * damping;
      y = y + ((height / 2 - fullHeight / 2) - y) * damping;
      w = w + (fullWidth - w) * damping;
      h = h + (fullHeight - h) * damping;
      // draw caption
      fill(255);
      String txt = yearTakenAge + "\n" + location + "\n" + persons;
      textFont(caption);
      text(txt, x, y + h + 20);
    }
    
    if ((!isHovered) && (!isZoomed)) {
      opacity = opacity + (75 - opacity) * damping; 
    } else {
      opacity = opacity + (255 - opacity) * damping; 
    }
  }
  
  Boolean isTweening() {
    if ((!isZoomed) && (w > thumbWidth + 1)) {
      return true;
    } else if ((isZoomed) && (w < fullWidth - 1)) {
      return true;
    } else {
      return false;
    }
  } 
  
  void position(float x_, float y_) {
    endX = x_;
    endY = y_;
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

