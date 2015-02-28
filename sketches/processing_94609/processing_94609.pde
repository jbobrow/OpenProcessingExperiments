
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
float x;
float y;
int cellsize = 4; // Dimensions of each cell in the grid
int columns, rows;

void setup(){
  background(100,240,200);
  size(800,600,P3D);
  imageMode(CENTER);
  img = loadImage("wholepattern.png");
  img2 = loadImage("nw.png");
  img3 = loadImage("ne.png");
  img4 = loadImage("sw.png");
  img5 = loadImage("ne.png");
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
}

void draw(){
  if(mousePressed){
    image(img,mouseX,mouseY);
  }else{
    image(img2,mouseX/2,mouseY*2);
    image(img3,mouseX*2,mouseY*2);
    image(img4,mouseX/2,mouseY/2);
    image(img5,mouseX/2,mouseY/2);
   // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
 }
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(100,240,200);
  } else { 
    // It's a letter key, fill a rectangle
    fill(100,240,200,50);
    rect(0, 0, 800,600);
  }
}


