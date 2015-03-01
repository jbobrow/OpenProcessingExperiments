
PFont f;
int X=0;
int numFrames = 10; // The number of frames
int frame = 0; // The first frame
PImage[] images = new PImage[numFrames];


void setup() {
size(300, 165);
f = createFont("Arial",16,true);

frameRate(1);

//All the pictures
  images[0] = loadImage("black1.jpg");
  images[1] = loadImage("angel1.png");
  images[2] = loadImage("black1.jpg");
  images[3] = loadImage("angel2.png");
  images[4] = loadImage("black1.jpg");
  images[5] = loadImage("angel3.png");
  images[6] = loadImage("black1.jpg");
  images[7] = loadImage("angel4.jpg");
  images[8] = loadImage("black1.jpg");
  images[9] = loadImage("angel5.jpg");
  
}


void draw() {
  X++;
//What switches out the pictures
frame++;
if (frame == numFrames) {
frame = 0;
}
image(images[frame], 0, 0);

//Whatever You Do, Don't Blink
if (X==2) {
stroke(175);
  textFont(f, 20);       
  fill(#761616);
  text("Whatever You Do", 65,90);
}
if (X==12) {
stroke(175);
  textFont(f, 20);       
  fill(#761616);
  text("Whatever You Do", 65,90);
}
if (X==4) {
stroke(175);
  textFont(f, 20);       
  fill(#761616);
  text("Don't Blink", 100,90); 
}
 if (X==14) {
stroke(175);
  textFont(f, 20);       
  fill(#761616);
  text("Don't Blink", 100,90);
} 
if (X==22) {
stroke(175);
  textFont(f, 20);       
  fill(#761616);
  text("Whatever You Do", 65,90);
}
if (X==24) {
stroke(175);
  textFont(f, 20);       
  fill(#761616);
  text("Don't Blink", 100,90); 
}
}
