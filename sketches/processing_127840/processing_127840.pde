
/*COMMANDS
 
 'c' - Clear image and replace with new background
 'm' - Draw a large moon
 'n' - Draw a small moon
 'd' - Draw space debris
 'z'+dragmouse - Draw a chain of stars/galaxies
 'click' - Constellations.
 Draws a star on click. If distance of next click is
 within 200px, a line will be drawn connecting the two.
 */


void setup() {
  size(1024, 768);
  background(skyPalette());
  stroke(yellowPalette());
  fill(yellowPalette());
  frameRate(8);
  smooth();
}

void draw() {
  //Draw space debris
  int r = int(random(10, 60));
  if (keyPressed) {
    if (key == 'd') {
      fill(#FCFCED, random(80, 100));
      quad(mouseX, mouseY, mouseX+dia_size(), mouseY+dia_size()*2, mouseX, mouseY+dia_size()*4, mouseX-dia_size(), mouseY+dia_size()*2);
    }

  //Clear picture
    if (key == 'c') {
      background(skyPalette());
    }
  }


    
  //Drawing blurry lights
  if (mousePressed) {
    noStroke();
    fill(yellowPalette(), random(50));
    ellipse(mouseX, mouseY, r, r);

    strokeWeight(.5);
    stroke(yellowPalette());
  }
}

void keyPressed() {
  //Draw large moon
  if (key == 'm') {
    int r = int(random(80, 120));
    fill(yellowPalette(), 90);
    strokeWeight(random(6, 9));
    stroke(#FCFCED, 90);
    ellipse(mouseX, mouseY, r, r);
    fill(150, 70);
    noStroke();
    ellipse(mouseX+20, mouseY+20, r/3, r/3);
    ellipse(mouseX-20, mouseY+30, r/10, r/10);
    ellipse(mouseX-3, mouseY+32, r/13, r/13);
    ellipse(mouseX-10, mouseY+25, r/20, r/20);
  }

  //Draw little moon
  if (key == 'n') {
    int r = int(random(50, 80));
    fill(255, 99);
    strokeWeight(random(6, 9));
    stroke(#FCFCED, 90);
    ellipse(mouseX, mouseY, r, r);
    fill(100, 70);
    noStroke();
    ellipse(mouseX+20, mouseY-15, r/4, r/4);
    ellipse(mouseX-20, mouseY+20, r/10, r/10);
    ellipse(mouseX-3, mouseY-22, r/13, r/13);
    ellipse(mouseX-10, mouseY+15, r/20, r/20);
  }
}


Constellation prev;
void mouseDragged() {
  if (keyPressed) {
    //Draws lines of stars
    if (key == 'z') {
      frameRate(30);
      Constellation now = new Constellation(mouseX, mouseY);
      now.display();
      if (prev != null) {
        if (dist(now.x, now.y, prev.x, prev.y) < 10000) {
          line(now.x, now.y, prev.x, prev.y);
        }
      }
      prev = now;
      frameRate(8);
    }
  }
}

void mousePressed() {
  //Draws constellations
  Constellation now = new Constellation(mouseX, mouseY);
  now.display();
  if (prev != null) {
    if (dist(now.x, now.y, prev.x, prev.y) < 200) {
      line(now.x, now.y, prev.x, prev.y);
    }
  }
  prev = now;
}
class Constellation {
  float x, y;
  color c = yellowPalette();
  Constellation(float ax, float ay) {
    x=ax;
    y=ay;
  }

  void display() {
    float r = random(2, 20);
    fill(c, 100);
    rectMode(CENTER);
    rect(x, y, r/3, r/3);
    ellipse(x, y, r, r);
  }
}


//Yellow Palette used in Constellations
color yellowPalette() {
  color[] yellows = new color[5];
  int pickThis = int(random(0, 4));
  yellows[0] = color(#C6C9A0);
  yellows[1] = color(#FCFCED);
  yellows[2] = color(#FFFAC9);
  yellows[3] = color(#FFBC0F);
  yellows[4] = color(#FFFFFF);  
  return yellows[pickThis];
}

color skyPalette() {
  color[] sky = new color[5];
  int pickThis = int(random(0, 4));

  sky[0] = color(#000000);
  sky[1] = color(#3E2A2A);
  sky[2] = color(#121621);
  sky[3] = color(#ffffff); 
  sky[4] = color(#402A2A); 
  return sky[pickThis];
}
//PShape diamond(){
//PShape[] diamonds = new PShape[2];
//int pickThis = int(random(0, 1));
//diamonds[0] = quad(mouseX, mouseY, mouseX+5, mouseY+10, mouseX, mouseY+20, mouseX-5, mouseY+10);
//diamonds[1] = quad(mouseX, mouseY, mouseX+2.5, mouseY+5, mouseX, mouseY+10, mouseX-2.5, mouseY+5);
//   return diamonds[pickThis];
//   }

//Array for size of diamonds

int dia_size() {
  int[] diamonds = new color[3];
  int pickThis = int(random(0, 2));
  diamonds[0] = int(1);
  diamonds[1] = int(3);
  diamonds[2] = int(5);
  return diamonds[pickThis];
}


