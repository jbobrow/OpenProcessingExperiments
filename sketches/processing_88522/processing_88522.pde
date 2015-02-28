
int numImages = 8;  // The number of images in the animation
int frame = 0;
PImage[] images = new PImage[numImages];
      
void setup()
{
  size(640, 426);
  frameRate(1);
    
  images[0]  = loadImage("1.jpeg");
  images[1]  = loadImage("2.jpeg");
  images[2]  = loadImage("3.jpeg");
  images[3]  = loadImage("4.jpeg");
  images[4]  = loadImage("5.jpeg");
  images[5]  = loadImage("6.jpeg");
  images[6]  = loadImage("7.jpeg");
  images[7]  = loadImage("8.jpeg");
}
   
void draw()
{
  background(0);
  frame = frame + 1;
  if (frame>=numImages){
   frame=0;
  }
  tint(255,255,255);
  image(images[frame], 0, 0);
}
void keyPressed() {
  if (key == '1') {
    tint(255, 0, 0);
    image(images[frame], 0, 0);
  }  
  else if (key == '2'){
    tint(0, 255, 0);
    image(images[frame], 0, 0);
  }
  else if (key == '3'){
    tint(0, 0, 255);
    image(images[frame], 0, 0);
  }
  else if (key == '4'){
    tint(0, 255, 255);
    image(images[frame], 0, 0);
  }
  else if (key == '5'){
    tint(255, 0, 255);
    image(images[frame], 0, 0);
  }
  else if (key == '6'){
    tint(255, 255, 0);
    image(images[frame], 0, 0);
  }
  else if (key == '7'){
    image(images[frame], 0, 0);
    filter(INVERT);
  }
  else if (key == '8'){   
    image(images[frame], 0, 0);
    filter(POSTERIZE, 4);
  }
  else if (key == '9'){
    image(images[frame], 0, 0);
    filter(THRESHOLD);
  }
  else if (key == '0'){
    image(images[frame], 0, 0);
    filter(GRAY);
  }
}  
void keyReleased() {
  if (key == '0') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '1') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '2') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '3') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '4') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '5') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '6') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '7') {
    tint(255,255,255);
    image(images[frame], 0, 0);
    filter(INVERT);
  }
  else if (key == '8') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
  else if (key == '9') {
    tint(255,255,255);
    image(images[frame], 0, 0);
  }
 
}


