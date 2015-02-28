
/*Jason Moran
Creativity & Computation
09.19.11
Thanks to Thom Hines and his RadBox sketch and OpenProcessing for help with class structures
*/

ArrayList crosses = new ArrayList();

PImage skull;
PImage crucifix;

void setup() {
  size(370, 550, P2D);
  smooth();
  crucifix = loadImage("crucifix.png");
  skull = loadImage("skull.jpg");
  for (int i = 0; i < 50; i++) {
    crosses.add(new SkullCross());
  }
}


void draw() {
  noCursor();
  image(skull, 0, 0);
  //when you run .size() in an array list, it will return as many elements as are in that array list (structural help from RadBox, Hines)
  for (int i = 0; i < crosses.size(); i++) {
    //YOU MUST USE THIS FOLLOWING LINE IN ANY ARRAY LIST (structural help from RadBox, Hines)
    SkullCross thiscross = (SkullCross) crosses.get(i);
    thiscross.drawcross();
    thiscross.movecross();
  }
}


void mousePressed() {
  for (int i = 0; i < crosses.size(); i++) {
    //YOU MUST USE THIS FOLLOWING LINE IN ANY ARRAY LIST (structural help from RadBox. Hines)
    SkullCross thiscross = (SkullCross) crosses.get(i);
    thiscross.randomize(mouseX, mouseY);
  }
  crosses.add(new SkullCross());
}




class SkullCross {
  int xpos;
  int ypos;
  //int trans;
  float xvel;
  float yvel;


  SkullCross() {
    //trans = tint(random(0, 255));
    xpos = round(random(0, 550));
    ypos = round(random(0, 550));
    //set explosion site
    xpos = constrain(mouseX, 110, 315);
    ypos = constrain(mouseY, 197, 222);
    xvel = round(random(-5, 5));
    yvel = round(random(-5, 5));
    if (xvel == 0) xvel = 1;
    if (yvel == 0) yvel = 1;
  }
  
//structural help from RadBox, Hines
  void movecross() {
    xpos += xvel;
    ypos += yvel;
    if (xpos < 0) {
      xpos = 0;
      xvel *= -1;
      xvel += round(random(-1, 1));
      if (xvel == 0) xvel = 1;
    }
    if (xpos > width) {
      xpos = width;
      xvel *= -1;
      xvel += round(random(-1, 1));
      if (xvel == 0) xvel = 1;
    }
    if (ypos < 0) {
      ypos = 0;
      yvel *= -1;
      yvel += round(random(-1, 1));
      if (yvel == 0) yvel = 1;
    }
    if (ypos > height) {
      ypos = height;
      yvel *= -1;
      yvel += round(random(-1, 1));
      if (yvel == 0) yvel = 1;
    }
  }

  void drawcross() {
    image(crucifix, xpos, ypos);
  }


  void randomize(int x, int y) {
    //trans = tint(random(0, 255));
    xpos = round(random(0, width));
    ypos = round(random(0, height));
    xvel = round(random(-5, 5));
    yvel = round(random(-5, 5));
    if (xvel == 0) xvel = 1;
    if (yvel == 0) yvel = 1;
  }
}


