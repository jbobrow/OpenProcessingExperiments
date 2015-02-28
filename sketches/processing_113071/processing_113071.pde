
//Tse Wing Yan Alison SID:53086197
//photos taken by me: emotions of my father 
int numFrames = 15;  // The number of frames in the animation
int frame = 0;
PImage img;
PImage[] images = new PImage[numFrames];
 
     
void setup() {
  
  size(960,720);//set the size of the image
  frameRate(4);//set the framerate
   
   
  images[0]  = loadImage("01.jpg");
  images[1]  = loadImage("02.jpg");
  images[2]  = loadImage("03.jpg");
  images[3]  = loadImage("04.jpg");
  images[4]  = loadImage("05.jpg");
  images[5]  = loadImage("06.jpg");
  images[6]  = loadImage("07.jpg");
  images[7]  = loadImage("08.jpg");
  images[8]  = loadImage("09.jpg");
  images[9]  = loadImage("10.jpg");
  images[10]  = loadImage("11.jpg");
  images[11]  = loadImage("12.jpg");
  images[12]  = loadImage("13.jpg");
  images[13]  = loadImage("14.jpg");
  images[14]  = loadImage("15.jpg");
  
  
   
 
  // referring to the example of Processing:Sequential
}
  
void draw() {
  background(0);
  
 
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) {
    image(images[(frame+offset) % numFrames], 0, 0, width, height);
    offset+=2;
    // set the graph to show the whole photos by only one row but not two
     
  }
}


