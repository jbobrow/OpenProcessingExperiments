
/* @pjs preload= "half_vol1.png", "vol1_crop.png", "motion_vol.png"; */

int y = 0;
int direction = 5;
PImage img;
int volHeight = 100;
int cropHeight = 100;
char previous;

void setup() {
  size(600, 600);
  smooth();
  stroke(0);
  fill(200, 200, 255);
}

void draw() {
  background(13, 119, 131);
  if ( keyPressed ) {
    background( random(100, 245), random(0, 235), 119);
  }

  // uncomment this to see the values
  // println(y);


  //Growth:
  if ( mousePressed ) {
    volHeight = volHeight + 1;
  }
  img = loadImage("half_vol1.png");
  image(img, 150, 550-volHeight); 
  img = loadImage("vol1_crop.png");
  image(img, 150, 708-volHeight); 
  img.resize(150, cropHeight);
  image(img, 150, 761-volHeight); 
  if ( mousePressed ) {
    cropHeight = cropHeight + 1;
  }

  //  img.resize(0, 50);
  img = loadImage("half_vol1.png");
  image(img, 350, 550-volHeight); 
  img = loadImage("vol1_crop.png");
  image(img, 350, 708-volHeight); 
  img.resize(150, cropHeight);
  image(img, 350, 761-volHeight); 
  if ( mousePressed ) {
    cropHeight = cropHeight + 1;
  }

  //Precipitation:
  if ( keyPressed ) {
    img = loadImage("motion_vol.png");
    image(img, 100, y-100);  
    img = loadImage("motion_vol.png");
    image(img, 300, y);
    img = loadImage("motion_vol.png");
    image(img, 360, y-200);
    img = loadImage("motion_vol.png");
    image(img, 550, y-500);

    y = y + direction;

    if ( y > height ) {
      direction = -5;
    } 
    else if ( y < 0 ) {
      direction = 5;
    }
  }
}



