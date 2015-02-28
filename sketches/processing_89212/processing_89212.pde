
//Ben Norskov
//original picasso and interpretation
/*
  Click on a picture to view the difference
  Press Space to change to show all original
  Press ENTER to change to show all sketches
*/

PImage[] slices = new PImage[21];
PImage[] drawings = new PImage[21];
Boolean[] showImage = new Boolean[21];
void setup() {
  size(1280, 828);
  for (int i=1; i<22; i++) {
    showImage[i-1] = false;
    if (i < 10) {
      slices[i-1] = loadImage("0"+i+".png");
      drawings[i-1] = loadImage("sketch0"+i+".png");
    } 
    else {
      slices[i-1] = loadImage(i+".png");
      drawings[i-1] = loadImage("sketch"+i+".png");
    }
  }
  background(50);
}

void draw() {
  for (int i = 0; i<21; i++) {
    int x = (i%7) * width/7;
    int y = int(i/7) * height/3;
    if (showImage[i]) {
      image(slices[i], x, y);
    } 
    else {
      image(drawings[i], x, y);
    }
  }
}

void mousePressed() {
  //figure out where the mouse is on the grid
  int x = int(mouseX / (width/7));
  int y = int(mouseY/(height/3)) * 7;
  //use that to change that specific image
  showImage[x+y] = !showImage[x+y];
}
void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i<21; i++) {
      showImage[i] = true;
    }
  }
  if (key == ENTER) {
    for (int i = 0; i<21; i++) {
      showImage[i] = false;
    }
  }
}



