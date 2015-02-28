
class Album {
  
  // instance variables
  int yearReleased;
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
  float thumbScale = 1;
  float opacity = 0;
  String title;
  String url;
  String mood;
  PImage photo;
  Boolean isZoomed = false;
  Boolean isHovered = false;
  Boolean isCaption = false;
  Boolean visible = true;


  // "outbound" relations
  Artist artist;
  
  // constructor
  Album(int yearReleased_, String title_, Artist artist_, String mood_, String url_, float thumbWidth_, float fullWidth_,  float x_, float y_, float z_) {
    yearReleased = yearReleased_;
    title = title_;
    url = url_;
    mood = mood_;
    thumbWidth = thumbWidth_;
    fullWidth = fullWidth_;
    artist = artist_;
    x = x_;
    y = y_;
    z = z_;
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
  
  void display(float offsetX, float offsetY) { // offsetX, offsetY are to offset the zoomed-in photo if the view has been dragged

    if (!isZoomed) {
      x = x + (endX - x) * damping;
      y = y + (endY - y) * damping;
      z = z + (endZ - z) * damping;
      w = w + (thumbWidth * thumbScale - w) * damping;
      h = h + (thumbHeight * thumbScale - h) * damping;
    } else {
      x = x + ((width / 2 - offsetX - fullWidth / 2) - x) * damping;
      y = y + ((height / 2 - offsetY - fullHeight / 2) - y) * damping;
      z = z - z * damping;
      w = w + (fullWidth - w) * damping;
      h = h + (fullHeight - h) * damping;
    }
    
    if ((!isHovered) && (!isZoomed)) {
      opacity = opacity + (100 - opacity) * damping; 
    } else {
      opacity = opacity + (255 - opacity) * damping; 
    }
    
    tint(opacity);
    
    pushMatrix();
    
    float zFactor = 0.01 * (stackOrder + 1); // prevents z-axis overlapping, which causes flickering in 3D if objects are on the same plane
    translate(x, y, z + zFactor);
    
    noStroke();
    fill(0);
    rect(0, 0, w, h); // <-- it is necessary to draw a rectangle behind the image (invisible to the user) to enable 3d picking. 
    image(photo, 0, 0, w, h);
    
    if ((isCaption) || (isZoomed)) {
      // draw caption
      fill(255);
      String txt = artist.groupName + "\n" + artist.country + "\n" + yearReleased;
      textFont(caption);
      text(txt, 0, h + 20);
    }
    
    popMatrix();
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
  
  void position(float x_, float y_, float z_, float thumbScale_, Boolean isCaption_, String displayMode) {
    
    thumbScale = thumbScale_;
    isCaption = isCaption_;
    
    if (displayMode == "CORNER") {
      endX = x_;
      endY = y_;
      endZ = z_;
    } else if (displayMode == "CENTER") {
      endX = x_ - thumbWidth * thumbScale / 2;
      endY = y_ - thumbHeight * thumbScale / 2; 
      endZ = z_;
    }    
  }
  
  /*
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
  
  */
}

