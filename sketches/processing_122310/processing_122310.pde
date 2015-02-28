

PImage img, bg, loggo;       // The source image
int cellsize = 2; 
int cols, rows;  
float x;


void setup() {
  background(0);

  img = loadImage( "223.png" ); 
  loggo = loadImage("loggo.jpg");
   bg = loadImage("224.png");

  size(img.width, img.height, P3D);
  smooth();
  frameRate(10);

  cols = width/cellsize;             
  rows = height/cellsize;
}

void draw() {


  img.loadPixels();

  for (int i = 0; i < cols; i++ ) {
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2; 
      int loc = x + y*width;           
      color c = img.pixels[loc];       
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])- 100.0;

      pushMatrix();
      translate(x, y, z*5); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }     
  x +=10;
  pushMatrix();
  imageMode(CENTER);
  translate(img.width/2, img.height/2, -mouseX);

 tint(255, 140);

 rotateY(radians(x));
translate(0, 0, 0);
  image(bg, 0, 0, 1200, 1000);
  popMatrix();
  
    pushMatrix();
    tint(255, 255);
   translate(width-50, height-50, 20);
 rotateY(radians(x));
 image(loggo, 0 , 0, 30, 30);
   popMatrix();


  //print(mouseX + "y" + mouseY + " ");
}



