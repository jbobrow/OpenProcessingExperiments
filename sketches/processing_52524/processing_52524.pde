
class Bg {
  
  PImage photo;
  color photoTint = color(255, 255, 255);
  String url;
  boolean isHovered = false;
  boolean isLoaded = false;
  
  Bg(String url_) {
    url = url_;
  }
  
  void load() {
    if (!isLoaded) {
      photo = loadImage(url);
      isLoaded = true;
    }
  }
  
  void display() {
    tint(photoTint);
    image(photo, 0, 0, 1024, 768);
  }
}

