
PImage img;       // The source image
int columns, rows;   // Number of columns and rows 

void setup() {
  img = loadImage("iu.jpg");  // Load the image
  columns = img.width ;  // Calculate # of columns
  rows = img.height ;  // Calculate # of rows
  size(columns*2, rows, P3D); 
}

void draw() {
  background(0);
  image(img, 0, 0); 
  image(img, columns, 0);//original img

  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
        int x = int(random(columns));
        int y = int(random(rows));
        int loc = x + y*img.width;  // Pixel array location
           
        // Look up the RGB color in the source image
        color c = img.pixels[loc];  // Grab the color
  
        float pointillize = random(1,8);
        noStroke();
        fill(c, 204);
        ellipse(x,y,pointillize,pointillize);
    }
  }
  noLoop();
}

