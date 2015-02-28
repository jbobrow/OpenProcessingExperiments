


PImage extrude;
int[][] values;
float angle = 0;
PImage bg;
int a; 
float r;

void setup() {
  size(600, 538, P3D);
  bg = loadImage("galaxies colliding.jpg");
    frameRate(30);
  
  // Load the image into a new array
  extrude = loadImage("galaxies colliding.jpg");
  extrude.loadPixels();
  values = new color[extrude.width][extrude.height];
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      color pixel = extrude.get(x, y);
      //values[x][y] = int(brightness(pixel));
    
      values[x][y] = pixel;
     
    }
  }
}

void draw() {
  background(bg);
  
  // Update the angle
  angle += 0.025;
  
  // Rotate around the center axis
  translate(width/2, 0, 200);
  rotateY(angle);  
  translate(-extrude.width/2, 0, 150);
  
  // Display the image mass
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      r=random(255);
      stroke(values[x][y]);
      //point(x, y, -values[x][y]);
      point(x,y, -int(brightness(values[x][y])));
    }
  }

}


