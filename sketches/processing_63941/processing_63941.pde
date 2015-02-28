
int numBuildings = 2;
int numFrames = 2;
int frame = 0;
int locationx,framewidth,buildingno,additionalwidth;
PImage[] buildings = new PImage[numBuildings];
PImage[] walkers = new PImage[numFrames];
PImage standing,jump;

void setup() {
  size(1920,240);
  buildings[0] = loadImage("house.png");
  buildings[1] = loadImage("bigbuilding.png");
  walkers[0] = loadImage("lefta.png");
  walkers[1] = loadImage("righta.png");
  standing = loadImage("standing.png");
  jump = loadImage("jumpa.png");
  locationx = 1;
   
}

void draw() {
   loop();
  //expansion variables
  additionalwidth = 0;
  fill(random(0,255),random(0,255),random(0,255));
  if(locationx<1){
    rect(0,0,framewidth,height);
  }
  buildingno = (int)random(0,2);
    if (buildingno > 0){
      additionalwidth = 360;
    }
    else{additionalwidth = 90;}
    //building expansion
   if (locationx > framewidth-28){
     fill(random(0,255),random(0,255),random(0,255));
     rect(framewidth,0,additionalwidth,height);
     image (buildings[buildingno], framewidth, 0);
     framewidth = framewidth + additionalwidth;
     
   }
   if(locationx > 1920){
     locationx = 1920;
   }
   if(locationx<0){
     locationx = 0;
   } 
 noLoop();
   
}


void keyPressed(){
  if (key == CODED) {
    //walking animation (right)
    if (keyCode == RIGHT) {
      locationx = locationx + 10;
  frame = (frame+1) % numFrames;
  image(walkers[frame], locationx, 160);
   }
   //walking animation (left)
    if (keyCode == LEFT){
      pushMatrix();
       scale(-1.0, 1.0);
       image(walkers[frame],-locationx,160);
       popMatrix();
       locationx = locationx - 10;
        frame = (frame+1) % numFrames;
      image(walkers[frame], locationx, 160);
      
   }
   //jump right
   if (keyCode == UP) {
     loop();
     locationx = locationx + 10;
      image(jump,locationx,140);
    }
    //standing
    if (keyCode == DOWN) {
      image (standing, locationx, 160);
    }
       
    }
  }
void keyReleased(){
  
  loop();
 
}

