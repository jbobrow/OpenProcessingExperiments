
class Controller {
  
  // instance variables
  AudioSample controller;
  float x, y, w, h;
 
  // constructor
  Controller(String url, float x_, float y_, float w_, float h_) {
    
    x = x_;
    y = y_;
    w = w_;
    h = h_;

  // initialize audio player and load file    
  controller = minim.loadSample(url);
  }
  
  void display () {
    controller.trigger();
    controller.addListener(waveform);
    fill(239, 61, 62);
    ellipse(x, y, w, h); 
  }
  
    void template() {
    fill(231, 231, 231);
    ellipse(x, y, w, h); 
  }
  
 void position(float x_, float y_) {
   x = x_;
   y = y_;
 }
}

