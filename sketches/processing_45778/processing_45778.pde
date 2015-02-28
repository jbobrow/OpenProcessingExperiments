
/**
 * Test form interactions
 */
 

public int y_inc = 15;
public int x_inc = 10;

public int lz = 7;
public int hz = 5;

float dist = 1.29;

void setup() {
  background(0);
  size(400,400);
  noStroke();
  smooth();
  colorMode(HSB);
  // drawUI();
}

void draw() {
  background(0);
  for (int y= 0; y <= 400; y += y_inc) {
    for (int x = 0; x <= 400; x += x_inc) {
      float h = map(y, 0, 400, 0, 250);
      fill(h, 255, 255);
      float s = map(x, 0, 400, lz, hz);
      rect(x + y/dist, y + x/dist, s, s);  
    }
  }
}

void newDistValue(float v) {
  dist = v; 
}

void drawUI() {
  // Alt-h to toggle vis/invis
  //controlP5 = new ControlP5(this);
  //ControlGroup ui = controlP5.addGroup("Controls", 250, 20);
  //controlP5.addSlider("dist", 0.1, 15.0, 1.29, 0, 0, 100, 20).setGroup(ui); 
  //controlP5.addSlider("lz", 1, 100, 7, 0, 20, 100, 20).setGroup(ui); 
  //controlP5.addSlider("hz", 1, 100, 5, 0, 40, 100, 20).setGroup(ui); 
  //controlP5.addSlider("y_inc", 1, 100, 15, 0, 60, 100, 20).setGroup(ui);
  //controlP5.addSlider("x_inc", 1, 100, 10, 0, 80, 100, 20).setGroup(ui);  
  //ui.close();
  //ui.setPosition(400 - ui.getWidth() - 50, ui.getHeight());
}

//void keyPressed() {
//  if (keyCode == ENTER) {
//    saveFrame("thumb-####.png");
//  }
//}



