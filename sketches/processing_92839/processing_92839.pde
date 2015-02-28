
//Elli_110712

//import gifAnimation.*;

float minradius=15;
float grow=1;
float maxradius=60;
float R;
//GifMaker gifExport;

void setup() {
  size(300, 300, OPENGL);
  smooth();
  frameRate(50);
//  gifExport = new GifMaker(this, "export.gif");
//  gifExport.setRepeat(0); // make it an "endless" animation
//  gifExport.setTransparent(0, 0, 0); // make black the transparent color. every black pixel in the animation will be transparent
//  // GIF doesn't know have alpha values like processing. a pixel can only be totally transparent or totally opaque.
//  // set the processing background and the transparent gif color to the same value as the gifs destination background color 
//  // (e.g. the website bg-color). Like this you can have the antialiasing from processing in the gif.
}

void draw() {
  background(0);
  translate(width/2, height/2, 200);
  rotateX(radians(mouseX));
  rotateY(radians(mouseY));

  if (mouseX>width/2) {
    mouseX*=-mouseX;
  }

  else {
    mouseX+=5;
  }

  if (mouseY>height/2) {
    mouseY*=-mouseY;
  }

  else {
    mouseY+=2;
  }

  spinningbox();
  growingsphere();
  
//  gifExport.addFrame();
//  gifExport.setQuality(15);
}

void spinningbox() {

  fill(39, 153, 193, 90);
  stroke(255, 90);
  box(100, 75, 75);
}

void growingsphere() {

  fill(185, 39, 137);
  stroke(255, 90);
  sphere(R);
  R+=grow;

  if (R >= maxradius) {
    grow=-1;
  }

  if (R<= minradius) {
    grow=1;
  }
}

//void keyPressed() {
//  gifExport.finish();
//}



