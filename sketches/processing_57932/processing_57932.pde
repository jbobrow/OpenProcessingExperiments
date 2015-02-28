
PShape rob;
PImage landscape;
PFont agent;

void setup() {
size(500, 333);
landscape = loadImage("name.jpg");
rob = loadShape("Untitled-2.svg");
agent = loadFont ("AgencyFB-Reg-48.vlw");
textFont (agent);

smooth();
}


void draw() {
  //textsize(200);

  background (landscape);
  //image (name, 0, 0);
  shape (rob, -200, -150);
    text ("space", 100, 100);
}

