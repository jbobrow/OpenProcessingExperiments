
/*
Random noise removal using an 8-pixel comparison
Use the "H", "S", and "B" keys to adjust the gate for difference comparison
Click to compare with the original image
*/

PImage ss;
PImage s2;
int sw;
int sh;

PFont meta;

// these are our thresholds for image modification
float hueGuage = 55.0;  // 204  65
float satGuage = 40.0;  //100  90
float briGuage = 90.0;   //60  50

boolean click = false;

void setup(){
  size(500, 400);

  // before and after images
  ss = loadImage("frog_corrupt.jpg");  // image to be corrected
  ss.loadPixels();
  s2 = loadImage("frog.jpg");  // reference image

  sw = ss.width;
  sh = ss.height;

  meta = loadFont("OCR-B.vlw.gz");
}

void draw(){
  background(255);

  // show the reference image
  if (click==true) {
    image(s2, 0, 0);
  }

  // show the corrected frog image
  // run the noise removal
  else {
    image(ss, 0,0);

    textFont(meta, 14);
    fill(0);
    text("Hue: " + hueGuage ,10,350);
    text("Sat: " + satGuage ,10,370);
    text("Bri: " + briGuage ,10,390);

    for (int y=0; y<sh; y++){
      for(int x=0; x<sw; x++){

        color c = getColorAtXYFromImage(x, y, ss);

        float h = hue(c);
        float s = saturation(c);
        float b = brightness(c);

        // the surrounding HSB variables
        float h1,h2,h3,h4,h5,h6,h7,h8,s1,s2,s3,s4,s5,s6,s7,s8,b1,b2,b3,b4,b5,b6,b7,b8;
        float nH, nS, nB;

        // check the pixel to the left
        if (x>0) {
          color c1 = getColorAtXYFromImage(x-1, y, ss);
          h1 = hue(c1);
          s1 = saturation(c1);
          b1 = brightness(c1);
        }
        else {
          h1 = h;
          s1 = s;
          b1 = b;
        }

        // check the pixel to the right
        if (x<sw*sh) {
          color c2 = getColorAtXYFromImage(x+1, y, ss);
          h2 = hue(c2);
          s2 = saturation(c2);
          b2 = brightness(c2);
        }
        else {
          h2 = h;
          s2 = s;
          b2 = b;
        }

        // check the pixel above
        if (y>0) {
          color c3 = getColorAtXYFromImage(x, y-1, ss);
          h3 = hue(c3);
          s3 = saturation(c3);
          b3 = brightness(c3);
        }
        else {
          h3=h;
          s3=s;
          b3=b;
        }

        // check the pixel below
        if (y<sh) {
          color c4 = getColorAtXYFromImage(x, y+1, ss);
          h4 = hue(c4);
          s4 = saturation(c4);
          b4 = brightness(c4);
        }
        else {
          h4=h;
          s4=s;
          b4=b;
        }

        // check the pixel below right
        if (y<sh && x<sw) {
          color c5 = getColorAtXYFromImage(x+1, y+1, ss);
          h5 = hue(c5);
          s5 = saturation(c5);
          b5 = brightness(c5);
        }
        else {
          h5=h;
          s5=s;
          b5=b;
        }

        // check the pixel below left
        if (y<sh && x>0) {
          color c6 = getColorAtXYFromImage(x-1, y+1, ss);
          h6 = hue(c6);
          s6 = saturation(c6);
          b6 = brightness(c6);
        }
        else {
          h6=h;
          s6=s;
          b6=b;
        }

        // check the pixel above right
        if (y>0 && x<sw) {
          color c7 = getColorAtXYFromImage(x+1, y-1, ss);
          h7 = hue(c7);
          s7 = saturation(c7);
          b7 = brightness(c7);
        }
        else {
          h7=h;
          s7=s;
          b7=b;
        }

        // check the pixel above left
        if (y>0 && x>0) {
          color c8 = getColorAtXYFromImage(x-1, y-1, ss);
          h8 = hue(c8);
          s8 = saturation(c8);
          b8 = brightness(c8);
        }
        else {
          h8=h;
          s8=s;
          b8=b;
        }

        // get our averages
        nH = getAverage(h1,h2,h3,h4,h5,h6,h7,h8);
        nS = getAverage(s1,s2,s3,s4,s5,s6,s7,s8);
        nB = getAverage(b1,b2,b3,b4,b5,b6,b7,b8);

        // if hue, saturation or brightness are outside the gate, then replace with the median
        if (abs(h - nH) > hueGuage || abs(s - nS) > satGuage || abs(b - nB) > briGuage) {

          // switch to HSB color so we can use the hue, saturation and brightness averages
          colorMode(HSB,255);

          // set our new color
          stroke(nH,nS,nB);
          point(x,y);
        }
      }
    }
  }
}

// median sort
float getAverage(float c1, float c2, float c3, float c4, float c5, float c6, float c7, float c8) {
float[]a = {c1,c2,c3,c4,c5,c6,c7,c8};

  sort(a);
  return a[3];
}

// get the pixel color data
color getColorAtXYFromImage(int x, int y, PImage img){
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[loc];
  } else {
    return 0;
  }
}

// used to cycle between the before and after images
void mousePressed() {
  click = true;
}
void mouseReleased() {
  click = false;
}

// use to adjust the pixel comparison gates
// uppercase to increase, lowercase to decrease
void keyPressed() {
  if (key=='h') hueGuage-=5.0;
  if (key=='s') satGuage-=5.0;
  if (key=='b') briGuage-=5.0;

  if (key=='H') hueGuage+=5.0;
  if (key=='S') satGuage+=5.0;
  if (key=='B') briGuage+=5.0;

}

