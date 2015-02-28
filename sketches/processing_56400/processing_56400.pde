
class Circle {
  
  boolean mouseOver = false;
  color col;
  int index;
  int circleSize = 8;
  int circleHover = 12;
  float x;
  float y;
  String songName;
  String plotPoint;
  PShape moment;
  AudioPlayer player;
  Label label;
  
  Circle(int index_, color col_, String url, String songName_, String plotPoint_) {
    index = index_; // index maps to a point on the plot
    col = col_;
    songName = songName_;
    plotPoint = plotPoint_;

    // initialize audio player and load file    
    player = minim.loadFile(url);
    
    // initialize label
    label = new Label(songName);
  }
  
  void display(float x_, float y_) {
    
    x = x_;
    y = y_;
    
    fill(255);
    stroke(col);
    strokeWeight(2);
    
    int r;
    if (mouseOver) {
      r = circleHover;
    } else {
      r = circleSize;
    }
    
    ellipse(x, y, r, r);
  }
  
  void onMouseOver(float mx, float my) {
    if (dist(mx, my, x, y) <= circleSize) {
      mouseOver = true;
      player.play(); // play audio file on mouse over
      displayLabel(mouseX, mouseY);
      displayDescription();
    } else {
      mouseOver = false;
      player.pause(); // pause audio file on mouse out
    }
  }
  
  void displayLabel(float mx, float my) {
    if (mouseOver) {
     label.display(mx, my);
    }
  }
  
  void displayDescription() {
   if (mouseOver) {
    moment = loadShape(plotPoint);
    shape(moment, 664, 0);
   } 
  }

}

