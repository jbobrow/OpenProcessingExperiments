
// This is my first Processing Code for Creative Programming
int numFrames = 7;  // The number of frames in the animation
int currentFrame = 0;

PImage[] images = new PImage[numFrames];
PImage imgbk;
PImage img;

void setup() {
  size(800, 600, P2D);

  images[0]  = loadImage("Ironman0.png");
  images[1]  = loadImage("Ironman1.png");
  images[2]  = loadImage("Ironman2.png");
  images[3]  = loadImage("Ironman3.png"); 
  images[4]  = loadImage("Ironman4.png");
  images[5]  = loadImage("Ironman5.png");
  images[6]  = loadImage("Ironman6.png");
  
  imgbk = loadImage("back01.jpg");
  img = loadImage("Ironman.png");
}

void draw() {
  background(0);
  
  image(imgbk, 1, 1);
  image(img, mouseX, mouseY);

  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  image(images[(currentFrame+0) % numFrames], mouseX, mouseY);

//Draw a Light Beam from Ironman's Hand
  for (int y = 30; y <= height-20; y += random(30, mouseY)) {
  for (int x = 30; x <= width-20; x += random(30, mouseX)) {
 
//Random Stroke Color and Width to Create Effects for Light Beam
  color c1 = color(255 - random(128), 255 - random(128), 255 - random(128));
  stroke(c1, 16);
  strokeWeight(random(8)); 
  line(mouseX+87, mouseY+45, x, y);
  }
  }
}
