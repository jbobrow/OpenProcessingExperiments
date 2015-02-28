
PImage Space;
int[][] values;
float angle = 0;

void setup() {
  size(300,299,P3D);
  
  camera(2*width, height/2, 200, width/2, height/2, 0, 0, 1, 0);
  
  // Load the image into a new array
  Space = loadImage("Space.jpg");
  Space.loadPixels();
  values = new int[Space.width][Space.height];
  for (int y = 0; y < Space.height; y++) {
    for (int x = 0; x < Space.width; x++) {
      color pixel = Space.get(x, y);
      values[x][y] = int(brightness(pixel));
    }
  }
}

void draw() {
  background(0);
  
  rotateY(90); 
  
  // Display the image mass
  for (int y = 0; y < Space.height; y++) {
    for (int x = 0; x < Space.width; x++) {
      stroke(values[x][y]);
      point(x, y, -values[x][y]);
    }
  }

}

