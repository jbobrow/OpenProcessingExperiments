

int numFrames = 12;  // The number of frames in the gif document
int frame = -1;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(120, 90);
  frameRate(24);// set the environment of the program
  
  images[0]  =  loadImage("wait0.gif");
  images[1]  =  loadImage("wait1.gif");
  images[2]  =  loadImage("wait2.gif");
  images[3]  =  loadImage("wait3.gif");
  images[4]  =  loadImage("wait4.gif");
  images[5]  =  loadImage("wait5.gif");
  images[6]  =  loadImage("wait6.gif");
  images[7]  =  loadImage("wait7.gif");
  images[8]  =  loadImage("wait8.gif");
  images[9]  =  loadImage("wait9.gif");
  images[10] =  loadImage("wait10.gif");
  images[11] =  loadImage("wait11.gif");
  //the 12 images actually are identical. 
  //Even how I have dowmload a gif animation, 
  //whenI run the program, the dynamic function does not work. 
  //It looks like the program runs a bit slow,  and I
  //check the internet, it says that it may be the java environment 
  //has some problem, pittily, I do not know how to fix it
} 
 
void draw() { 
 
  frame = (frame+1) % numFrames; 
    int offset = 0;
  for (int x = 0; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], x, 0);
    offset+=1;
    image(images[(frame+offset) % numFrames], x, height/3);
    offset+=1;
    image(images[(frame+offset) % numFrames], x, 2*height/3);
    offset+=1;
    //I choose the first choice of the assignment
    //And I refer to his code
    //Being differently, I choose to show all 12 images in the work,
    //and orginaze them as 4*3
    }
}



