
//Hon Hin Yee, Jam
//2-10-2013 Assignment 3

int y;
int numFrames = 12;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage bg1, bg2, bg3, bg4;
int num = 30;
float mx[] = new float[num];
float my[] = new float[num];

    
void setup() {
  size(600, 600);
  frameRate(12);
  
  images[0]  = loadImage("water000.png");
  images[1]  = loadImage("water001.png"); 
  images[2]  = loadImage("water002.png");
  images[3]  = loadImage("water003.png"); 
  images[4]  = loadImage("water004.png");
  images[5]  = loadImage("water005.png"); 
  images[6]  = loadImage("water006.png");
  images[7]  = loadImage("water007.png"); 
  images[8]  = loadImage("water008.png");
  images[9]  = loadImage("water009.png"); 
  images[10] = loadImage("water010.png");
  images[11] = loadImage("water011.png"); 
  
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg2.png");
  bg3 = loadImage("bg3.png");
  bg4 = loadImage("bg4.png");
  
}

 
void draw() { 
  background(0);
  
  // Moving BG
  fill(0, 200);
  tint(255, 255, 170, 150);
  float bgA=map(mouseX, 0, 600, -150, -100);
  image(bg4, bgA, 0);
  float bgB=map(mouseX, 0, 600, -200, -50);
  image(bg3, bgB, 0);
  float bgC=map(mouseX, 0, 600, -300, -20);
  image(bg2, bgC, 0);
  float bgD=map(mouseX, 0, 600, -400, -5);
  image(bg1, bgD, 0);
  
 // Animation
  frame = (frame+1) % numFrames;
  tint(255, 255, 255, 300);
  image(images[frame], 0,0);

  // Mouse Effect
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    int index = (which+1 + i) % num;
    fill(0, 255, 255, 50);
    stroke(255);
    ellipse(mx[index], my[index], i, i);
  }

}

//Ref: 
//http://processing.org/examples/sequential.html
//http://processing.org/examples/storinginput.html


