
int numFrames = 15;
int frame = 1;
PImage[] images = new PImage[numFrames];
boolean isPlaying = false;



void setup(){
  size(1000,600);
  frameRate(30);
  
  images[0]=loadImage("slide1.png");
  images[1]=loadImage("slide1.png");
  images[2]=loadImage("slide2.png");
  images[3]=loadImage("slide3.png");
  images[4]=loadImage("slide4.png");
  images[5]=loadImage("slide5.png");
  images[6]=loadImage("slide6.png");
  images[7]=loadImage("slide7.png");
  images[8]=loadImage("slide8.png");
  images[9]=loadImage("slide9.png");
  images[10]=loadImage("slide10.png");
  images[11] = loadImage("slide11.png");
  images[12] = loadImage("slide12.png");
  images[13] = loadImage("slide13.png");
  images[14] = loadImage("slide14.png");
  }
    

  
 void draw(){
//frame = frame + 1;
  image(images[frame],0,0);
  
   
  if (mousePressed == true) {
    if (mouseButton == CENTER) {
      frame = 0;
    }
  }
   
 
  if (isPlaying == true) {
   if(frame < 14) {
    frame = frame + 1;
   }
  }
}
 
void keyReleased() {
  if (key == '0') {
    frame = 0;
  }
  else if (key == '1') {
    frame = 1;
  }
  else if (key == '5') {
    frame = 5;
  }
  if (key == '6') {
      frame = 6;
    } 
  if (key == '6') {
      frame = 6;
    }
    else if (key == '7') {
      frame = 7;
    }
    else if (key == '8') {
      frame = 8;
    }
    else if (key == '9') {
      frame = 9;
    }
     
  else if (key == ' ' && isPlaying == false) {
    isPlaying = true;
    frameRate(0.7);
  }
  else if (key == ' ' && isPlaying == true) {
    isPlaying = false;
    frameRate(30);
  }
   
  else if (keyCode == RIGHT) {
    if (frame >= 14) {
      frame = 0;
    }
    else {
      frame += 1;
    }
  }
  else if (keyCode == LEFT) {
    if (frame <= 0) {
      frame = 14;
    }
    else {
      frame -= 1;
    }
  }
}
 
void keyPressed() {
  if (key == '2') {
    frame = 2;
  }
  else if (key == '3') {
    frame = 3;
  }
  else if (key == '4') {
    frame = 4;
  }
}
 
void mouseClicked() {
  if (mouseButton == LEFT) {
    isPlaying = true;
    frameRate(.9);
  }
}
 
void mouseReleased() {
  if (mouseButton == RIGHT) {
    isPlaying = false;
    frameRate(.9);
  }
}
 
void mousePressed() {
   if (mouseButton == LEFT) {
    isPlaying = true;
    frameRate(.9);
 
  }
}



