
PFont Georgia;
  float y = 600;
  
  void setup() {
    size(400,400);
    Georgia = loadFont ("Georgia-30.vlw");
  }
  
  void draw() {
    background(255);
    fill(0);
    textFont (Georgia, 30);
    String a = "CADO GIU'!";
    text (a, 120, -y, 280, 200);
    
    y -= 3.4;
    if (y < -400) {
      y = height;
    }
  }

                
                
