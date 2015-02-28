
PImage original;
PImage modified;

void setup() {
  original = loadImage("llama.jpg");
  modified = loadImage("llama.jpg");
  size(original.width, original.height);
}

void draw() {
  image(modified, 0, 0);
}

void keyPressed() {
  if (key=='b') {
    Grayscale();
  }
  if (key=='o') {
    // restore the original image
    Restore();
  }
  if (key=='r') {
    // rose colored glasses
    RoseColored();
  }
  if (key=='n'){
    // negative
    Negative();
  }
  if (key== 'd'){
    Diagonal();
  }
  if (key== 'z'){
    ZigZag();
  }
}


void Grayscale() {
  color pixelColor;
  for (int i=0; i<original.width; i++) {
    for (int j=0; j<original.height; j++) {
      pixelColor = original.get(i, j);
      // average the RGB values in pixelColor
      // to obtain the grayscale color in the 
      // modified image
      modified.set(i, j, color((red(pixelColor) + green(pixelColor) + blue(pixelColor))/3));
    }
  }
}

void Restore() {
  color pixelColor;
  for (int i=0; i<original.width; i++) {
    for (int j=0; j<original.height; j++) {
      pixelColor = original.get(i, j);
      modified.set(i, j, pixelColor);
    }
  }
}

void RoseColored() {
  color pixelColor;
  for (int i=0; i<original.width; i++) {
    for (int j=0; j<original.height; j++) {
      pixelColor = original.get(i, j);
      modified.set(i, j, color(red(pixelColor),0,0));
    }
  }
}

void Negative() {
  color pixelColor;
  for (int i=0; i<original.width; i++){
    for (int j=0; j<original.height; j++){
      pixelColor = original.get(i,j);
      modified.set(i, j, color(255-red(pixelColor),255-green(pixelColor),255-blue(pixelColor)));
    }
  }
}

void Diagonal(){
  color pixelColor;
  for (int i=0; i<original.width; i++){
    for (int j=0; j<original.height; j++){
      pixelColor = original.get(i,j);
      if(i + j < original.width){
        modified.set(i+j, j, color(red(pixelColor),green(pixelColor),blue(pixelColor)));
      }
      else{
        modified.set(i+j - original.width, j, color(red(pixelColor),green(pixelColor),blue(pixelColor)));
      } 
    }
  }
}

void ZigZag(){
  color pixelColor;
  for (int i=0; i<original.width; i++){
    for (int j=0; j<original.height; j++){
      int zig =0;
      if(j%12 == 0 || j%12 == 6) zig = 0;
      if(j%12 == 1 || j%12 == 5) zig = 1;
      if(j%12 == 2 || j%12 == 4) zig = 2;
      if(j%12 == 3) zig = 3;
      if(j%12 == 7 || j%12 == 11) zig = -1;
      if(j%12 == 8 || j%12 == 10) zig = -2;
      if(j%12 == 9) zig = -3;
      pixelColor = original.get(i,j);
      if(i + zig < original.width && i + zig > 0){
        modified.set(i+zig, j, color(red(pixelColor),green(pixelColor),blue(pixelColor)));
      }
      else if(i + zig >= original.width){
        modified.set(i+zig - original.width, j, color(red(pixelColor),green(pixelColor),blue(pixelColor)));
      } 
      else if(i+ zig <= 0){
        modified.set(original.width - (i + zig), j, color(red(pixelColor),green(pixelColor),blue(pixelColor)));
      }
    }
  }
}


