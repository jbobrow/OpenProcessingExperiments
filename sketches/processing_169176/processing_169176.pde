
int numFramesCon = 3; // The number of animation frames
PImage[] con = new PImage[3]; // Image array

void setup() {
  size(800, 600);
 
 
 
 
 frameRate(6); // Maximum 30 frames per second

  // Automate the image loading procedure. Numbers less than 100
  // need an extra zero added to fit the names of the files.
  for (int i = 0; i < con.length; i++) {
    // Construct the name of the image to load
    
    con[0] = loadImage("ucon01.png");
    con[1] = loadImage("ucon02.png");
    con[2] = loadImage("ucon03.png");
//   con[3] = loadImage("ucon04.png");
//   con[4] = loadImage("ucon05.png");
//   con[5] = loadImage("ucon06.png");
//   con[6] = loadImage("ucon07.png");
//   con[7] = loadImage("ucon08.png");
//   con[8] = loadImage("ucon09.png");
//   con[9] = loadImage("ucon10.png");
//   con[10] = loadImage("ucon11.png");
  }
}

void draw() {
  // Calculate the frame to display, use % to cycle through frames
  int frame = frameCount % numFramesCon;
  image(con[frame], -5, 400);
}


