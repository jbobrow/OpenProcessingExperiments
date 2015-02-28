
class Photo{
  float x, y;
  float h = 50;
  float w;
  PImage img;
  String url;
  float speed = -2;
  float endX;
  float endY;
  
  
  Photo(String url_, float x_, float y_) {
  url = url_;
  x = x_;
  y = y_;
  }
  
  void display() {
    image(img, x, y, w, h);
  }
  
  void load(){
    img = loadImage(url);
    w = img.width/2;
  }
  
  void position() {
    x += speed;    
  }
}

