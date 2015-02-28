
//So Hei Man(53225141)

//Declare variables
int numFrames = 12;  // The number of frames in the animation
int frame = 0;
PImage[] img = new PImage[numFrames];

PImage bg;

float r;
float g;
float b;
float a;

float y;
float w;

//Set up the world 
void setup() {
  size(600, 600);
  smooth();
  
  // Load image from the data directory
  img[0]  = loadImage("The cars_001.png");
  img[1]  = loadImage("The cars_002.png"); 
  img[2]  = loadImage("The cars_003.png");
  img[3]  = loadImage("The cars_004.png"); 
  img[4]  = loadImage("The cars_005.png");
  img[5]  = loadImage("The cars_006.png"); 
  img[6]  = loadImage("The cars_007.png");
  img[7]  = loadImage("The cars_008.png"); 
  img[8]  = loadImage("The cars_009.png");
  img[9]  = loadImage("The cars_010.png"); 
  img[10] = loadImage("The cars_011.png");
  img[11] = loadImage("The cars_012.png"); 

  //Creates a new white PImage and loads the pixel data
  bg = createImage(600, 600, RGB);
  bg.loadPixels();
  for (int i = 0; i < bg.pixels.length; i++) {
    bg.pixels[i] = color(255,255,204);
  }
  bg.updatePixels();
}

void stripes() {
  //Draw random horizontal lines with random color and strokeWeight
  frameRate(6);
  r = random(100);
  g = random(100);
  b = random(250);
  a = random(50);

  y= random(width);
  w= random(7);

  stroke(r, g, b, a);
  strokeWeight(w);
  
  image(bg, 0, 0);  
  line(0, y, 600, y);
  bg = get();//The entire image is returned
}

void draw() { 
  stripes(); //Run the stripes function
  
  //Run the frames and each is displayed individually in a loop
  frameRate(12); //Set the framerate
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 2;
  for (int x = 0; x < width; x += img[0].width) { 
    image(img[(frame+offset) % numFrames], x, -10);
    offset+=2;

    image(img[(frame+offset) % numFrames], x, 130);
    offset+=2;

    image(img[(frame+offset) % numFrames], x, 270);
    offset+=2;  

    image(img[(frame+offset) % numFrames], x, 410);
  }
}

// Releasing the mouse activates looping
void mouseReleased() {
  loop();  
}

// Holding down the mouse stops looping draw()
void mousePressed() {
  noLoop();  
}

