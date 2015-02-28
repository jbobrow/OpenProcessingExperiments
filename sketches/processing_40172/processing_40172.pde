
PImage img;

void setup() {
  img = loadImage("img2.jpg");
  size(400,600,P3D);
  smooth();                                                    //creates smoothing for each of the triangles that composes each sphere. creates the broken effect
}

int cell = 25;

void draw() {
  background(0);

  for(int x = cell; x < width; x += cell) {                     //sets up the gridding based on the cell size
    for(int y = cell; y < height; y += cell) {

      color imgFill = color(img.pixels[x + (y * width)]);      //picking the pixel color that will be used for each pixel
      float z = brightness(img.pixels[x + (y * width)])-255;   //creating the z direction translation of each sphere. the minus 255 means that the brightest pixels will be drawn on the main viewing frame. Everything else is progressively behind

      pushMatrix();
      translate(x,y,z);                                        //translate for each grid dimension and brightness dimension
      fill(imgFill);                                           //fill with pixel location color with added transparency
      noStroke();
      ellipse(0,0,cell,cell);                                  //ellipses to reduce the lag of using spheres
      //sphere(cell);                                            //create spheres with radius size set to the grid size
      popMatrix();
    }
  }
}
void mousePressed() {
  background(0);
  cell = mouseX/2;
}


