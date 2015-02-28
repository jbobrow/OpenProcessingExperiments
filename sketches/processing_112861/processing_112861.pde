
Bar [] bars = new Bar[1000];

void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);

  for (int i = 0; i<bars.length; i++) {
    bars[i] = new Bar(0, i*2, random(20), random(20));
  }
}

void draw() {
  background(255, 198, 108);
  for (int i =0; i<bars.length; i++) {
    bars[i].rollover(mouseX, mouseY);
    bars[i].display();
  }
}

class Bar {

  float xpos;
  float ypos;
  float wideness;
  float longness;

  boolean vertical = false;
  boolean mouse;

  Bar(float xpos_, float ypos_, float wideness_, float longness_) {

    xpos = random(width);
    ypos = random(height);
    wideness = random(11, 21);
    longness = random(8, 200);

    if (random(1) <0.5) {
      vertical = true;
    }

    mouse= false;
  }

  void display() {
    stroke(0);
    strokeWeight(2);

    if (mouse) {
      fill (random(240, 255), random(180, 211), random(90, 120));
      //strokeWeight(random(8));
      rect(xpos, ypos, wideness + 2, longness + 2);
  
    } 
    else {
      fill (255, 198, 108);
    }

    if (vertical) {
      rect (xpos, ypos, wideness, longness);
    }
    else {
      rect(xpos, ypos, longness, wideness);
    }
  }
    void rollover(int mx, int my) {
      if (mx > xpos && mx < xpos + wideness && my > ypos && my < ypos + longness) {
        mouse = true;
      } 
      else {
        mouse = false;
      }
    }
  }



