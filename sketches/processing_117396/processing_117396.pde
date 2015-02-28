
class yarnStitch {
  boolean gridEnabled = false;
  boolean debug = false;
  float sizeCub = 10;
  color yarn0 = color (255, 255, 255);
  color yarn1 = color (255, 255, 255);
  color colorDebug = color (255, 102, 0);

  yarnStitch() {
  }

  yarnStitch( int _sizeCub) {
    sizeCub = _sizeCub;
  }

  void drawPieceModelUnit(int x, int y, color _yarn0, color _yarn1, Boolean firstRow, Boolean lastRow) {
    yarn0 = _yarn0;
    yarn1 = _yarn1;

    pushMatrix();
    translate(x*(sizeCub*2), y*(sizeCub*2));
    if (gridEnabled)drawGrid(sizeCub);
    strokeWeight(2);
    stroke(255, 0, 0);
    if (!firstRow) {
      drawSec3();  
      drawSec4();
    }
    //
    if (!lastRow) {
      drawSec_1();
      drawSec_2();
      drawSec_3();
      drawSec_4();
    }
    if (!firstRow) {
      drawSec1();
      drawSec2();
    }
    popMatrix();
  }

  void drawGrid(float sizeCub) {
    // draw grid
    stroke(30);
    strokeWeight(1);
    for (int x=0; x<3;x++) {
      line(float(x)*sizeCub, 0, float(x)*sizeCub, sizeCub*2 );
    }
    for (int y=0; y<3;y++) {
      line(0, float(y)*sizeCub, sizeCub*2, float(y)*sizeCub );
    }
  }

  void drawSec1() {
    float x1 = sizeCub*0.4;
    float y1 = 0;
    float x2 = sizeCub*0.6;
    float y2 = sizeCub*0.5;
    float x3 = sizeCub*0.7;
    float y3 = sizeCub*0.3;
    float x4 = sizeCub*0.75;
    float y4 = sizeCub;
    noFill();
    stroke(yarn0);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      stroke(colorDebug);
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec2() {
    float x1 = sizeCub*1.6;
    float y1 = 0;
    float x2 = sizeCub*1.4;
    float y2 = sizeCub*0.5;
    float x3 = sizeCub*1.3;
    float y3 = sizeCub*0.3;
    float x4 = sizeCub*1.25;
    float y4 = sizeCub;
    noFill();
    stroke(yarn0);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec3() {
    float x1 = sizeCub*0.75;
    float y1 = sizeCub;
    float x2 = sizeCub*0.75;
    float y2 = sizeCub*1.7;
    float x3 = sizeCub*0.2;
    float y3 = sizeCub*1.8;
    float x4 = 0;
    float y4 = sizeCub*1.8;
    noFill();
    stroke(yarn0);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);

    if (debug) {

      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec4() {
    float x1 = sizeCub*1.25;
    float y1 = sizeCub;
    float x2 = sizeCub*1.25;
    float y2 = sizeCub*1.7;
    float x3 = sizeCub*1.8;
    float y3 = sizeCub*1.8;
    float x4 = sizeCub*2;
    float y4 = sizeCub*1.8;
    noFill();
    stroke(yarn0);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      stroke(colorDebug);
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec_1() {
    float x1 = sizeCub;
    float y1 = sizeCub*0.2;
    float x2 = sizeCub*0.25;
    float y2 = sizeCub*0.25;
    float x3 = sizeCub*0.25;
    float y3 = sizeCub*0.8;
    float x4 = sizeCub*0.25;
    float y4 = sizeCub;
    noFill();
    stroke(yarn1);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      stroke(colorDebug);
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec_2() {
    float x1 = sizeCub;
    float y1 = sizeCub*0.2;
    float x2 = sizeCub*1.75;
    float y2 = sizeCub*0.25;
    float x3 = sizeCub*1.75;
    float y3 = sizeCub*0.8;
    float x4 = sizeCub*1.75;
    float y4 = sizeCub;
    noFill();
    stroke(yarn1);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      stroke(colorDebug);
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec_3() {
    float x1 = sizeCub*0.25;
    float y1 = sizeCub;
    float x2 = sizeCub*0.3;
    float y2 = sizeCub*1.7;
    float x3 = sizeCub*0.3;
    float y3 = sizeCub*1.8;
    float x4 = sizeCub*0.4;
    float y4 = sizeCub*2;
    noFill();
    stroke(yarn1);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      stroke(colorDebug);
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }

  void drawSec_4() {
    float x1 = sizeCub*1.75;
    float y1 = sizeCub;
    float x2 = sizeCub*1.7;
    float y2 = sizeCub*1.7;
    float x3 = sizeCub*1.7;
    float y3 = sizeCub*1.8;
    float x4 = sizeCub*1.6;
    float y4 = sizeCub*2;
    noFill();
    stroke(yarn1);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    if (debug) {
      stroke(colorDebug);
      line(x1, y1, x2, y2);
      line(x3, y3, x4, y4);
    }
  }
}

class yarnRender {

  yarnStitch[] myYarn;
  int stitchSize;
  int widthYarn;
  PImage img;

  yarnRender() {
    stitchSize = 7;
  }

  void setStitchSize(int _stitchSize) {
    stitchSize = stitchSize;
    loadPattern(img);
  }

  void loadPattern(PImage _img) {
    img = _img;
    img.loadPixels();
    int totalStitch = img.height*img.width;
    widthYarn = img.width;
    myYarn = new yarnStitch[totalStitch];
    for (int i=0; i<myYarn.length;i++) {
      myYarn[i] = new yarnStitch(stitchSize);
    }
 }

  void draw() {
    img.loadPixels();
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        int loc = x + y*img.width;

        // posicion in garment
        Boolean lastRow = false;
        Boolean firstRow = false;
        if ((loc/widthYarn)==0) firstRow = true;
        if (ceil(loc/widthYarn)==ceil((myYarn.length-1)/widthYarn)) lastRow = true;

        // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
        float r1 = red(img.pixels[loc]);
        float g1 = green(img.pixels[loc]);
        float b1 = blue(img.pixels[loc]);
        float a1 = 1;

        float r2 =0; 
        float g2 =0;
        float b2 =0;
        float a2 =0;

        if (!lastRow) {
          r2 = red(img.pixels[loc+widthYarn]);
          g2 = green(img.pixels[loc+widthYarn]);
          b2 = blue(img.pixels[loc+widthYarn]);
          a2 = 1;
        }
        color c1 = color (r1, g1, b1);
        color c2 = color (r2, g2, b2);
        if (firstRow) {
          myYarn[loc].drawPieceModelUnit(loc%widthYarn, loc/widthYarn, c1, c1, true, lastRow);
          myYarn[loc].drawPieceModelUnit((loc%widthYarn), (loc/widthYarn)+1, c1, c2, false, lastRow);
        }
        else {
          myYarn[loc].drawPieceModelUnit((loc%widthYarn), (loc/widthYarn)+1, c1, c2, firstRow, lastRow);
        }
      }
    }
  }
}

// global variables
ControlP5 cp5;
ColorPicker cp;

yarnRender myYarnRender;

Boolean exportTransparentPattern = true;

void setup() {
  size(1600, 600);
  smooth();
  loadNewpattern("user1img.png");
  noStroke();
}

void draw() {
  background(80,80,79);
  myYarnRender.draw();
  noLoop();
}

void loadNewpattern(String imagePath) {
  println("load:"+imagePath);
  PImage img = loadImage(imagePath);
  myYarnRender = new yarnRender();
  myYarnRender.loadPattern(img);
}


