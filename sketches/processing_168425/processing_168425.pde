
/* @pjs preload="1.png"; */

PImage photo;



float pencil, eraser;
float c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21;
int sw;
int r, g, b;
int D = 56;
int penState = 0;

void setup() {

  photo = loadImage("1.png");

  size(600, 600);

  sw = 1;
  r = 0;
  g = 0;
  b = 0;


  image(photo, 0, 0);
}

void draw() {


  pencil = dist(56, 83, mouseX, mouseY);
  eraser = dist(145, 83, mouseX, mouseY);
  c1 = dist(46, 242, mouseX, mouseY);
  c2 = dist(46, 242+D, mouseX, mouseY);
  c3 = dist(46, 242+D*2, mouseX, mouseY);
  c4 = dist(46, 242+D*3, mouseX, mouseY);
  c5 = dist(46, 242+D*4, mouseX, mouseY);
  c6 = dist(46, 242+D*5, mouseX, mouseY);
  c7 = dist(46, 242+D*6, mouseX, mouseY);
  c8 = dist(46+D, 242, mouseX, mouseY);
  c9 = dist(46+D, 242+D, mouseX, mouseY);
  c10 = dist(46+D, 242+D*2, mouseX, mouseY);
  c11 = dist(46+D, 242+D*3, mouseX, mouseY);
  c12 = dist(46+D, 242+D*4, mouseX, mouseY);
  c13 = dist(46+D, 242+D*5, mouseX, mouseY);
  c14 = dist(46+D, 242+D*6, mouseX, mouseY);
  c15 = dist(46+D*2, 242, mouseX, mouseY);
  c16 = dist(46+D*2, 242+D*1, mouseX, mouseY);
  c17 = dist(46+D*2, 242+D*2, mouseX, mouseY);
  c18 = dist(46+D*2, 242+D*3, mouseX, mouseY);
  c19 = dist(46+D*2, 242+D*4, mouseX, mouseY);
  c20 = dist(46+D*2, 242+D*5, mouseX, mouseY);
  c21 = dist(46+D*2, 242+D*6, mouseX, mouseY);

  if (mousePressed) {



    if (mouseX>200 && mouseX<568 && mouseY>45 && mouseY<560) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }

    if (pencil < 70) {
      penState = 1;
      sw = 1;
    }

    if (eraser < 70) {
      r=255;
      g=255;
      b=255;
      sw=30;
      penState = 2;
    }

    if (penState == 1) {
      if (c1 < 15)
      {
        r = 222;
        g = 240;
        b = 118;
      }
      if (c2 < 15)
      {
        r = 253;
        g = 133;
        b = 96;
      }
      if (c3 < 15)
      {
        r = 163;
        g = 141;
        b = 252;
      }
      if (c4 < 15)
      {
        r = 252;
        g = 81;
        b = 150;
      }
      if (c5 < 15)
      {
        r = 156;
        g = 254;
        b = 173;
      }
      if (c6 < 15)
      {
        r = 162;
        g = 145;
        b = 174;
      }
      if (c7 < 15)
      {
        r = 209;
        g = 209;
        b = 209;
      }
      if (c8 < 15)
      {
        r = 252;
        g = 246;
        b = 108;
      }
      if (c9 < 15)
      {
        r = 253;
        g = 169;
        b = 170;
      }
      if (c10 < 15)
      {
        r = 130;
        g = 169;
        b = 252;
      }
      if (c11 < 15)
      {
        r = 110;
        g = 242;
        b = 248;
      }
      if (c12 < 15)
      {
        r = 203;
        g = 208;
        b = 147;
      }
      if (c13 < 15)
      {
        r = 125;
        g = 140;
        b = 164;
      }
      if (c14 < 15)
      {
        r = 254;
        g = 212;
        b = 63;
      }
      if (c16 < 15)
      {
        r = 207;
        g = 160;
        b = 215;
      }
      if (c17 < 15)
      {
        r = 88;
        g = 137;
        b = 251;
      }
      if (c18 < 15)
      {
        r = 124;
        g = 254;
        b = 222;
      }
      if (c19 < 15)
      {
        r = 187;
        g = 165;
        b = 124;
      }
      if (c15 < 15)
      {
        r = 254;
        g = 212;
        b = 63;
      }
      if (c20 < 15)
      {
        r = 97;
        g = 153;
        b = 148;
      }
      if (c21 < 15)
      {
        r = 51;
        g = 51;
        b = 51;
      }
    }




    strokeWeight(sw);
    stroke(r, g, b);



    println(mouseX, mouseY);
    println(pencil);
  }
}


