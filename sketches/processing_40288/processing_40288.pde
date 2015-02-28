
PImage foo;
HashMap chm;

boolean inColor;

int[] cTable = {
  #500a9c, #0a0d9c, #5b9c0a, #ed5f21, #fae300, #cc0000
};


void setup() {
  foo = loadImage("JA.jpg");
  size(483, 568);
  smooth();
  frameRate(30);

  inColor = true;

  foo.filter(GRAY);
  foo.filter(POSTERIZE, 6);
  foo.loadPixels();

  chm = new HashMap();

  // build color mappings...
  for (int j=0; j<foo.height; j++) {
    for (int i=0; i<foo.width; i++) {
      color tck = foo.pixels[j*foo.width+i];
      if (chm.containsKey(tck) == false) {
        color tcv = color(cTable[chm.size()]);
        chm.put(tck, tcv);
      }
    }
  }
  background(0);
  strokeWeight(4);
}


void draw() {
  // the line drawings...
  for (int c=0; c<50; c++) {
    int r = (int)random(5, 16);
    int x = (int)random(0, foo.width);
    int y = (int)random(0, foo.height);
    color tck = foo.pixels[y*foo.width+x];
    int ii = Integer.parseInt(chm.get(tck).toString());


    if (inColor == false) {
      if (dist(x, y, mouseX, mouseY) < 100) {
        fill(color(ii));
        stroke(color(ii));
      }
      else {
        fill(color(tck));
        stroke(color(tck));
      }
    }
    else if (inColor == true) {
      if (dist(x, y, mouseX, mouseY) < 50) {
        fill(color(tck));
        stroke(color(tck));
      }
      else {
        fill(color(ii));
        stroke(color(ii));
      }
    }


    int swi = (int) random(0, 4);
    if (swi == 0) {
      line(x-r/2, y-r/2, x+r/2, y+r/2);
    }
    if (swi == 1) {
      line(x-r/2, y+r/2, x+r/2, y-r/2);
    }
    if (swi == 2) {
      line(x-r/2, y, x+r/2, y);
    }
    if (swi == 3) {
      line(x, y+r/2, x, y-r/2);
    }
  }
}

void mousePressed() {
  inColor = !inColor;
}


