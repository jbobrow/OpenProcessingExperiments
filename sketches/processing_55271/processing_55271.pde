
import processing.video.*;
// declaring a capture object
Capture video;
PImage img;
PImage prevFrame;
PImage [] images = new PImage[7]; //sets array to have eight images
float threshold = 50; 
int imageIndex = 0;
boolean showImage =false;
boolean value = false;
float maxdist = 100;
int savedTime;
int totalTime = 10000;
boolean showbackground = false;
int pausecount = 0;

void setup() {
  size(600,600);
  smooth();
  video = new Capture(this, width, height,30);
  prevFrame = createImage(video.width,video.height,RGB);
  //adds images to array 
  images[0] = loadImage("face.jpg");
  images[1] = loadImage("skull.jpeg");
  images[2] = loadImage("flipoff.jpeg");
  images[3] = loadImage("piranha.jpeg");
  images[4] = loadImage("werewolf1.jpg");
  images[5] = loadImage("alien.jpeg");
  images[6] = loadImage("clown.jpeg");
  img = loadImage("beach.jpeg");
  savedTime = millis();
  
}

void draw () {
  // if conditions are met, show image, hold for 30 counts and then reset
    if(showbackground == true) {
      image(img, 0,0,width, height);
      pausecount++;
      if(pausecount>(30)) {
      showbackground = false;
    }
    }  else {
    //determines conditions for which to show the images, and resets to false
    if(showImage == true) {
    image(images[imageIndex],0,0, width, height);
    println("hi");
    showImage =false;
  } else {
    // runs the video 
 if(video.available()) {
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
    prevFrame.updatePixels();
    video.read();
  }
  // turn each pixel in the video frame black or red, depending on its brightness
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  // goes through all the pixels
  // determine's the test location and creates a flashlight effect
  for(int x =0; x<video.width;x++) {
    for (int y = 0; y<video.height;y++) {
      int loc = x +y*video.width;
      color current = video.pixels[loc];
      color previous = prevFrame.pixels[loc];
      float r1 = red(current);
      float g1 = green(current);
      float b1 = blue(current);
      float r2 = red(previous);
      float g2 = green(previous);
      float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      //determines brightness
      if (diff > threshold) {
        pixels[loc] = color(255,0,0);
      } else {
        pixels[loc] = color(0);
      }
       float r,g,b;
       r = red (pixels[loc]);
       g = green(pixels[loc]);
       b = blue ( pixels[loc]);
       float d = dist(x,y,mouseX,mouseY);
       float adjustbrightness = (maxdist-d)/maxdist;
       r *= adjustbrightness;
       g *= adjustbrightness;
       b *= adjustbrightness;
       
       r =constrain(r,0,255);
       g = constrain(g,0,255);
       b = constrain(b,0,255);
       color c = color(r,0,0);
       pixels[loc] = c;
       
  // test to determine time passed     
  int passedTime = millis() - savedTime;
  if(passedTime> totalTime) {
    showbackground = true;
    savedTime = millis();
  }
 
 
   } 
    } 
  }
  updatePixels(); 
  }
} 


void keyPressed() {
  // if press up then threshold increases, if down then decreases
  switch(keyCode) {
    case UP:
    threshold++;
    break;
    case DOWN:
    threshold --;
    break;
  }
  print(threshold);
  // pressing the big C makes the flashlight size bigger
  //pressing the small c makes the flashlight size smaller
  if(key == 'C') {
    maxdist++;
  } else if(key =='c') {
    maxdist--;
  }
  print(maxdist);  
  // press i and you can see the last image shown from pressing the mouse
  if(key == 'i') {
    showImage = true;
    if(showImage == true) {
    image(images[imageIndex],0,0, width, height);
    showImage =false;
    }
  }
 // pressing b shows the beach image
   if(key == 'b') {
     image(img,0,0,width,height);
   }
}

// when mouse is pressed, a random image from my array is shown
void mousePressed() {
      showImage = true;
    if(showImage == true) {
     imageIndex = int(random(images.length));
    image(images[imageIndex],0,0, width, height);
    showImage =false; }
}



