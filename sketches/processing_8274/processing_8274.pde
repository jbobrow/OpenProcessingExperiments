
/**
 * Hand of Eris by dw@mondonerd.com
 * 
 * Free Software Licensed under GPL v3
 */

//import processing.opengl.*;

PImage cursorImage;

void setup() {
  size(400, 400, P3D);
  cursorImage = loadImage("hand.png");
  imageMode(CENTER);
  noCursor();
  smooth();
  noStroke();
}

int cursorAlpha;

static final int CURSOR_ALPHA = 64;

color[] colors = {
  0xffcc00,
  0xffff00,
  0xff00ff,
  0xff0000 
};

void draw() {
  background(0);
  lights();

  for (int i = flors.size() - 1; i > 0; i--) {
    Flor flor = (Flor) flors.get(i);
    flor.update();
    flor.paint();
    if (flor.loc.z < - 1000.0)
      flors.remove(i);
  }
noLights();
  tint(red(colors[colorIndex]),green(colors[colorIndex]),blue(colors[colorIndex]),cursorAlpha);
  image(cursorImage, mouseX, mouseY, cursorImage.width >> 1, cursorImage.height >> 1);
  mouse.x = mouseX;
  mouse.y = mouseY;
  mouse.z = -200.0;
  if (cursorAlpha < 256) {
    cursorAlpha += 8;
  }
}

ArrayList flors = new ArrayList();
PVector mouse = new PVector();
int colorIndex = 0;
void mousePressed() {
  if (mouseButton == RIGHT) {
    colorIndex++;
    colorIndex %= colors.length;
    cursorAlpha = CURSOR_ALPHA;
  } else if (mouseButton == LEFT) {
    Flor flor = new Flor(mouse, colors[colorIndex]);
    flors.add(flor);
  } 

}

void mouseDragged() {
  
}


class Flor {
  PVector loc;
  float mass = 50.0;

  int type = 0;

  Flor(PVector initialLoc, color initialColor) {
    loc = new PVector(initialLoc.x, initialLoc.y, initialLoc.z);
    florColor = initialColor; 
  }

  void update() {
    loc.z -= 20.0;
    if (florAlpha < 256)
      florAlpha += 16;
  }
  color florColor = 0xff00ff;
  int florAlpha = 0;

  void paint() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);

   fill(red(florColor), green(florColor), blue(florColor), florAlpha);
    /*
     ellipse(0, 0, int(mass), int(mass));
     */
    sphere(mass);
    popMatrix();
  }

}


