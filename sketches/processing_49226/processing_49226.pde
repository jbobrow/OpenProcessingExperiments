



import gifAnimation.*;

Gif loo;

int cellsize = 5;
int cols, rows;
ArrayList<PVector> points = new ArrayList<PVector>();
 
void setup() {
  size(389,579);
  frameRate(500);
 
    println("gifAnimation " + Gif.version());
  loo= new Gif (this, "facesmixed5.gif");
    loo.loop();
 
  cols = width/cellsize;
  rows = height/cellsize;
  rectMode(CENTER);
  noStroke();
  background(0);
 
  // Create an array list with the positions where we want the rects
  for (int i = 0; i < cols;i++) {
    for (int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      PVector p = new PVector(x, y, loc);
      points.add(p);
    }
  }
 
}
 
int idx;
 
void draw() {
  PVector p = points.get(idx++);
  color c = loo.pixels[int(p.z)];       // Grab the color
 
  fill(c);
  ellipse(p.x, p.y, cellsize, cellsize);
 
  if (idx >= points.size()) {
    noLoop();
    println("Done");
  }
}

