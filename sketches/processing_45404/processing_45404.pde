

PImage extrude;
int[][] values;
float angle = 0;

void setup() {
  
  
  // Load the image into a new array
  extrude = loadImage("spacefour.jpg");
  extrude.loadPixels();
  size (extrude.width, extrude.height, P3D); 
  values = new int[extrude.width][extrude.height];
 for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      color pixel = extrude.get(x, y);
      values[x][y] = int(brightness(pixel));
    }
  }
}

void draw() {
  background(0);
  
  // Update the angle
  angle += 0.1;
  
  
  translate(width*2, 0, -128);
  rotateY(angle);  
  translate(-extrude.width/3, 100, -128);
  
  translate(height*2, 100, 200);
  rotateX(angle);  
  translate(-extrude.height/2, -100, 200);
  
  
  
  
  
  // Display the image mass
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      stroke(values[x][y]);
      point(x, y, -values[x][y]);
    }
  }

}



