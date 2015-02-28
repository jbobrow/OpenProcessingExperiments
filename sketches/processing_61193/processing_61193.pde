
PImage img;
int cellsize = 1;
int columns, rows;

void setup() {
  size(1000, 500, P3D); 
  img = loadImage("explode_music.png");
  columns = img.width / cellsize;
  rows = img.height / cellsize;
}


void draw() {
  background(0);
  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;
      int y = j*cellsize + cellsize/2;
      int loc = x + y*img.width; 
      color c = img.pixels[loc];  
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 20.0;
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

void keyPressed() {
  if (key == 's') {
    saveFrame("bild-####.png");
  }
}


