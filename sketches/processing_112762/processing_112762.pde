

class Band {
  float x; 
  float y;
  float w, h;
  int interval;
  color[] colors;
  color[] colorSave;
  
  Cube[] cubes;

  Band(float _x, int _interval, float _h) {
    x = _x;
    interval = _interval;
    h = _h;
    
    w = width / interval;
    y = height - h;
    colors = new color[interval];
    colorSave = new color[interval];
    cubes = new Cube[interval];
  }

  void setColor() {
    for (int i=0; i<interval; i++) {
      float cc = random(130);
      colors[i] = color(cc, cc+120, cc+60);
      colorSave[i] = colors[i];
    }
  }
  
  void checkHit() {
    for (int i=0; i<interval; i++) {
      for (int j=0; j<movers.length; j++) {
        if (movers[j].hitGround == true && movers[j].location.x > cubes[i].x && 
          movers[j].location.x < cubes[i].x+w && movers[j].location.y < (height-h)) {
          float cc = random(130);
          colors[i] = color(cc+120, cc+120, 0);
        }
      }
    }
  }
  
  void colorBack() {
    for (int i=0; i<interval; i++) {
      for (int j=0; j<movers.length; j++) {
        if (movers[j].hitGround == false) {
          colors[i] = colorSave[i];
        }
      }
    }
  }

  void display() {
    float tempX = x;

    for (int i=0; i<interval; i++) {
      cubes[i] = new Cube(tempX, y, w, h, colors[i]);
      cubes[i].display();
      tempX += w;
    }
  }

}


