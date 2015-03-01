
boolean dragging = false;
MeasuringTape one, two;

void setup() {
  size(600,480);
  smooth();
  one = new MeasuringTape();
  one.pos.x = 200.0;
  one.pos.y = 400.0;
  two = new MeasuringTape();
  two.pos.x = 400.0;
  two.pos.y = 400.0;
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  one.update();
  one.draw();
  two.update();
  two.draw();
  pushStyle();
  //noStroke();
  rect(width*0.5, height - 20.0, width, 40.0);
  popStyle();
}

class MeasuringTape {
  PVector pos, size, offset;
  boolean dragged = false;
  float min, max;
  float targetY = 0.0;
  
  MeasuringTape() {
    size = new PVector(40.0, 280.0);
    min = height - 140.0 - 20.0;
    max = height - 20.0 + 80.0;
    pos = new PVector();
    offset = new PVector();
  }
  
  void update() {
    // start dragging
    if(!dragged) {
      if(mousePressed) {
        offset = PVector.sub(pos, new PVector(mouseX, mouseY));;
        if(abs(offset.x) < size.x*0.5 && abs(offset.y) < size.y) {
          dragged = true;
          dragging = true;
        }
      }
      
    } else {
      pos.y = mouseY + offset.y;
      if(pos.y < min) pos.y = min;
      if(pos.y > max) pos.y = max;
      if(!mousePressed) {
          dragged = false;
          dragging = false;
      }
    }
  }
  
  void draw() {
    //rect(pos.x, pos.y, size.x, size.y);
    pushStyle();
    fill(0);
    for(float i = 0.0; i < size.y; i+= size.x) {
      ellipse(pos.x, pos.y + i + size.x*0.5 - size.y*0.5, size.x, size.x);
    }
    popStyle();
  }
  
}
