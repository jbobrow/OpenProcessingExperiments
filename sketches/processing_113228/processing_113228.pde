
//THE WORK HAS BEEN SENT TO YOUR EMAIL, PLEASE CHECK, SORRY FOR THE INCONVENIENCE

int numFrames = 24;  // The number of frames in the animation
int frame = 0;
PImage[] img = new PImage[numFrames];
    
void setup() {
  size(1280, 720); //define the window size
  frameRate(7); //how fast the animation runs
  //assign the location of the pictures
  img[0]  = loadImage("1.jpg");
  img[1]  = loadImage("2.jpg"); 
  img[2]  = loadImage("3.jpg");
  img[3]  = loadImage("4.jpg"); 
  img[4]  = loadImage("5.jpg");
  img[5]  = loadImage("6.jpg"); 
  img[6]  = loadImage("7.jpg");
  img[7]  = loadImage("8.jpg"); 
  img[8]  = loadImage("9.jpg");
  img[9]  = loadImage("10.jpg"); 
  img[10] = loadImage("11.jpg");
  img[11] = loadImage("12.jpg"); 
  img[12] = loadImage("13.jpg"); 
  img[13] = loadImage("14.jpg"); 
  img[14] = loadImage("15.jpg"); 
  img[15] = loadImage("16.jpg"); 
  img[16] = loadImage("17.jpg"); 
  img[17] = loadImage("18.jpg"); 
  img[18] = loadImage("19.jpg"); 
  img[19] = loadImage("20.jpg"); 
  img[20] = loadImage("21.jpg"); 
  img[21] = loadImage("22.jpg"); 
  img[22] = loadImage("23.jpg"); 
  img[23] = loadImage("24.jpg"); 
} 
//how to operate the programme
void draw() { 
  frame = (frame+1) % numFrames;  // Use % to loop cycles through the frames
  image(img[(frame) % numFrames], 0, 0); //draw the image
}
