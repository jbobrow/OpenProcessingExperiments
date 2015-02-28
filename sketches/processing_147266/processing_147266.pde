
int setlimit = 24;
int imageIndex = 0;
boolean isPlaying = false;

PImage[] images = new PImage [setlimit];

void setup() {
  size(220,165);
  
  for (int i=0; i < images.length; i++) {
    images[i] = loadImage("spongebobgifpopcorn_" +i+ ".gif");
  }
  frameRate(30);
}



void draw() {
  background(0);
  image(images[imageIndex],0,0);
  
  if (mousePressed == true) {
    if (mouseButton == CENTER) {
      imageIndex = 0;}
  }
  
  if (isPlaying == true) {
    imageIndex = (imageIndex + 1) % images.length; }
    
   //extra customization
  if (keyPressed && (key=='1')) {
    filter(INVERT);
  }
  if (keyPressed && (key=='2')) {
    filter(GRAY); }
    
  if (keyPressed && (key=='3')) {
    tint(65,69,240); }
    
  if (keyPressed && (key=='4')) {
    tint(240,65,77); }
    
  if (keyPressed && (key=='c')) {
    noTint(); }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
    if (mouseButton == RIGHT) {
    isPlaying = false;
  }
}


