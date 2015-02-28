
 // Coloured_Ripples_Interactive_Display
 
  Ripple[] rip;
int numRipples = 60; 
int currentRipple = 0; 
color bg = 0;
 
int c1 = 255;
int c2 = 127;
color[] c = {
  color(c1, c2, 0), color(c1, 0, c2), color(c2, c1, 0), color(c2, 0, c1), color(0, c2, c1), };
 
void setup() {
  size(600, 400);
  smooth();
  stroke(255);
  strokeWeight(3);
  noFill();
  rip = new Ripple[numRipples]; 
  for (int i = 0; i < numRipples; i++) {
    rip[i] = new Ripple();
  }
}
 
void draw() {
  background(0);
  for (int i = 0; i < numRipples; i++) {
    rip[i].resize(); 
    rip[i].display(); 
  }
}
 
void mousePressed() {
  int which = round(random(4)); 
  rip[currentRipple].xy(mouseX, mouseY, which); 
  currentRipple++; 
  if (currentRipple >= numRipples) { 
    currentRipple = 0;
  }
}
 
class Ripple {
  float x, y;
  float diameter, alph;
  boolean on = false;
  color colors;
 
  void xy(float xpos, float ypos, color shade) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
    colors = shade;
     
  }
 
  void resize() {
    if (on == true) {
      if (diameter < 200) {
      diameter++;
      alph = abs((diameter*1.275)-255);
      } else {
        on = false;
      }
    }
  }
 
  void display() {
    noFill();
    stroke(c[colors], alph);
    strokeWeight(3);
    ellipse(x, y, diameter, diameter);
  }
}
 
void keyPressed() {
  if (keyCode == ' ') {
    if (bg == 0) {
      bg = 255;
    } else {
      bg = 0;
    }
    draw();
  }
}

// Albert Cordero

