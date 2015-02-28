
//set up walking animation
int numFrames = 2;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage bg, st;

int locationx, locationy;

void setup(){
  size(640,480);
  imageMode(CENTER);
  bg = loadImage("bgrnd.png");
  images[0] = loadImage("left.png");
  images[1] = loadImage("right.png");
  st = loadImage("stand.png");
  frameRate(2);
  locationx = 10;
  image (bg,320,240);
  image(st,10,400);
}

void draw(){
  smooth();
  //scale
    if (locationy < 390 && locationy > 375){
      images[0].resize(55,0);
      images[1].resize(55,0);
      st.resize(55,0);
    }
    if (locationy < 375 && locationy > 360){
      images[0].resize(50,0);
      images[1].resize(50,0);
      st.resize(55,0);
    }
    if (locationy < 360 && locationy > 350){
      images[0].resize(40,0);
      images[1].resize(40,0); 
      st.resize(40,0);
    }
    if (locationy < 350 && locationy > 340){
      images[0].resize(35,0);
      images[1].resize(35,0); 
      st.resize(35,0);
    }
  locationx = locationx+(int)random(5,30);
    if (locationx > 570){
      noLoop();
      image(st,610,locationy);
      ;
    }
  locationy = (int)random(340,400);
    
  //walking animation
  frame = (frame+1) % numFrames;
  image(images[frame], locationx, locationy);
  
 
}

//reset
void keyPressed(){
      image(bg,320,240);
      locationx = 10;
      loop();
  }
  

