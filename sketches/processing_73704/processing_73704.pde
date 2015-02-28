
color bColor;
float deGrade;
float deThold;
ClusterMatrix a;
PImage main;

void setup() {
  size(400,400);
  background(255);
  frameRate(60);
  bColor = color(64,0,0);
  deGrade = .05;
  deThold = 180;
  main = createImage(width, height, RGB);
  a = new ClusterMatrix(0, 0, width, height, bColor, deGrade, deThold, main);
}

void draw() {
  a.evolve();
  a.drawMe();
  println(frameRate);
}

class ClusterMatrix{
  color baseColor;
  int baseX, baseY;
  float deGrade, deThold;
  PImage img;
  
  ClusterMatrix(int aux_x, int aux_y, int aux_width, int aux_height, color aux_baseColor, float aux_degrade, float aux_threshold, PImage aux_img){
    baseColor = aux_baseColor;
    baseX = aux_x;
    baseY = aux_y;
    deGrade = aux_degrade;
    deThold = aux_threshold;
    img = aux_img;
    img.loadPixels();
    for (int i=0; i<img.pixels.length; i++) {
      img.pixels[i] = color(255,255,255);
    }
  }
  
  int new_cluster(int aux_i, PImage img) {
//    if (pixels[x + y*width]!= color(255,255,255) {
//      return 0;
//    } else {
      color aux = color(random(50,100),random(10),random(40));
      img.pixels[aux_i] = aux;
      return 1;
//    }
  }
  
  color darkestNeighbour(int loc, PImage img) {
    color dn = color(255,255,255);
    color cur;
    int cLoc;
//up-left
    if  (loc>=img.width) {
      if (loc%img.width!=0) {
        cLoc = loc-img.width-1;
        cur = img.pixels[cLoc];
        if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
          dn = cur; } }
//up
      cLoc = constrain((loc-img.width), 0, img.pixels.length-1);
      cur = img.pixels[cLoc];
      if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
        dn = cur; } 
//up-right
      if (loc%img.width!=img.width-1) {
        cLoc = constrain((loc-img.width+1), 0, img.pixels.length-1);
        cur = img.pixels[cLoc];
        if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
          dn = cur; } } }
//left
    if (loc%img.width!=0) {
      cLoc = constrain((loc-1), 0, img.pixels.length-1);
      cur = img.pixels[cLoc];
      if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
        dn = cur; } }
//right
    if (loc%img.width!=img.width-1) {
      cLoc = constrain((loc+1), 0, img.pixels.length-1);
      cur = img.pixels[cLoc];
      if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
        dn = cur; } }
//down-left
    if  (loc<img.pixels.length - img.width) {
      if (loc%img.width!=0) {
        cLoc = constrain((loc+img.width-1), 0, img.pixels.length-1);
        cur = img.pixels[cLoc];
        if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
          dn = cur; } }
//down
      cLoc = constrain((loc+img.width), 0, img.pixels.length-1);
      cur = img.pixels[cLoc];
      if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
        dn = cur; } 
//down-right
      if (loc%img.width!=img.width-1) {
        cLoc = constrain((loc+img.width+1), 0, img.pixels.length-1);
        cur = img.pixels[cLoc];
        if (red(cur)+green(cur)+blue(cur) < red(dn)+green(dn)+blue(dn)) {
          dn = cur; } } }
    return dn;
  }
  
  void evolve() {
    PImage cImg = createImage(img.width, img.height, RGB);
    float avgR = 0;
    float avgG = 0;
    float avgB = 0;
    for (int i=0; i<(img.pixels.length); i++) {
      int loc = i;
// Get the R,G,B values for the pixel from image
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
// use the evolve algorythm
/* Basically, what it does is to fade the colours away, but in a
   way in which they melt into the background, so that new colour
   clusters appear when the general density is below the specified one */

// check the darkest colour btw neighbours and randomly decide to copy it
      if (random(20)>17) {
        color dark = darkestNeighbour(loc, img);
        r = red(dark);
        g = green(dark);
        b = blue(dark);
      }
// universal fade algorythm
      float dg = 1 + random(deGrade);
      r = 1 + r*dg;
      g = 1 + g*dg;
      b = 1 + b*dg*1.01; //blue tint on fade
// Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
// Make a new color and set pixel in the window
      color c = color(r,g,b);
      cImg.pixels[loc] = c;
// calculate average density value
      avgR = (avgR*i + r) / (i + 1);
      avgG = (avgG*i + g) / (i + 1);
      avgB = (avgB*i + b) / (i + 1);
    }
    if ((avgR + avgG + avgB > deThold*3) && (frameCount%5 == 0)) {
      int i = floor(random(img.pixels.length-1));
      new_cluster(i, cImg);
    }
    img = cImg;
  }
  
  void drawMe() {
    img.updatePixels();
    image(img, baseX, baseY);
  }
}

