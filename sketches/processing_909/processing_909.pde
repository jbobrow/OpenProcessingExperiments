
/*
 Modified version of Subtractive Color Wheel by Ira Greenberg
 by Geoff Ellis
 Shows the RGB color values on the wheel where the mouse is down plus an colour square at the top right
 */
 
int SHADE = 0;
int TINT = 1;
int segs = 12;  //no. segments around the wheel
int steps = 6;  //no. colour wheel rings
int backgroundGrey = 127;
String RGBString = "";
PFont fontA;

void setup(){
  size(300, 300);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
  fontA = loadFont("Dialog-10.vlw");
  textFont(fontA, 10);
  noLoop();
}

void draw() {
  background(backgroundGrey);
  createWheel(width/2, height/2);
  drawBlackWhiteSquares();
  if (mousePressed) {
    int c = get(mouseX, mouseY);
    int red = int(red(c)); 
    int green = int(green(c));
    int blue = int(blue(c)); 
    if (!(red == backgroundGrey && green == backgroundGrey && blue == backgroundGrey)) {  //not if on the grey background colour
      fill(255);  //white
      RGBString = str(red) + ',' + str(green) + ',' + str(blue);
      textAlign(CENTER);
      if(!(mouseX < 40 && mouseY > 275)) {
        text(RGBString, mouseX, mouseY); //show RGB value at cursor (not on black & white samples)
      }
      stroke(255);             //white outline
      fill(red, green, blue);  //show sample colour
      rect(5, 5, 30, 30);
      fill(0);                //show RGB values next to sample
      textAlign(LEFT);
      text(RGBString, 40, 15);
    }
  }
}

void createWheel(int x, int y){
  float rotAdjust, segWidth, interval, nsteps, nsegs;
  float radius = 140.0;
  noStroke();
  nsteps = steps;
  nsegs = segs;
  rotAdjust = radians(360.0 / nsegs / 2.0);
  segWidth = radius / nsteps;
  interval = TWO_PI / nsegs; 
  for (int j = 0; j < nsteps; j++){
    color[] cols = { 
      color(255-(255/nsteps)*j, 255-(255/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, (255/1.5)-((255/1.5)/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, (255/2)-((255/2)/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, (255/2.5)-((255/2.5)/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, 0, 0), 
      color(255-(255/nsteps)*j, 0, (255/2)-((255/2)/nsteps)*j), 
      color(255-(255/nsteps)*j, 0, 255-(255/nsteps)*j), 
      color((255/2)-((255/2)/nsteps)*j, 0, 255-(255/nsteps)*j), 
      color(0, 0, 255-(255/nsteps)*j),
      color(0, 255-(255/nsteps)*j, (255/2.5)-((255/2.5)/nsteps)*j), 
      color(0, 255-(255/nsteps)*j, 0), 
      color((255/2)-((255/2)/nsteps)*j, 255-(255/nsteps)*j, 0)                                                                                           };
    for (int i = 0; i < nsegs; i++) {
      fill(cols[i]);
      arc(x, y, radius, radius, interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
}

void   drawBlackWhiteSquares() {
  //draw black and white squares at the bottom left corner
  noStroke(); 
  fill(0);
  rect(5, 280, 15, 15);
  fill(255);
  rect(20, 280, 15, 15);
}

void mousePressed() {
  redraw();
}












