
//Student name: Siu Ho Wun
//SID: 52623053

int numFrames = 10; // number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(1000,1000);
  frameRate(3); 
  
  images[0]  = loadImage("boy1.png");
  images[1]  = loadImage("boy2.png"); 
  images[2]  = loadImage("boy3.png");
  images[3]  = loadImage("boy4.png"); 
  images[4]  = loadImage("boy5.png");
  images[5]  = loadImage("boy6.png"); 
  images[6]  = loadImage("boy7.png");
  images[7]  = loadImage("boy8.png"); 
  images[8]  = loadImage("boy9.png");
  images[9]  = loadImage("boy10.png"); 

}

  void draw()
  {
    background(255,226,3);
   
   //using for loop to create circle pattern    
   for (int x = 0; x<=width; x+=200) // loop of x 
  {
  for (int y=0; y<=height; y+=200) // loop of y
  { 
    if (x<=1000){
    fill(52,210,247); //blue color
    stroke(153,0);
    ellipse(x, y, 100, 100);
  }
  }
  
  }
  
 
    frame = frame +1; // keep looping the image
    while(frame>=numFrames) 
    {
      frame=0; // frame turn back to 0 so that the animation will keep looping 
    }
    
    image(images[frame],350,70);
    
  
  }



