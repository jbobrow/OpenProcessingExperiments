
int numFrames = 10;  // The number of frames in the animation
int i = 0;
PImage[] img = new PImage[numFrames];
    
void setup() {
  size(980,550);  
  img[0]  = loadImage("00.jpg");
  img[1]  = loadImage("01.jpg"); 
  img[2]  = loadImage("02.jpg");
  img[3]  = loadImage("03.jpg"); 
  img[4]  = loadImage("04.jpg");
  img[5]  = loadImage("05.jpg"); 
  img[6]  = loadImage("06.jpg");
  img[7]  = loadImage("07.jpg"); 
}
void draw() { 
  background(0);
  frameRate(10);
  image(img[i],0,0,width, height);
  i = i+1;
  if(i>7){
    i=0;}
}


  


