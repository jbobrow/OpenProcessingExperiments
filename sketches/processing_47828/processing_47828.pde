

int frame = 0;
int numFrames = 2;
PImage[] images = new PImage[numFrames];

float x=250;

float lx=330;

float posx=500;


void setup() {

  size(600,400);
  frameRate(5);
  for (int i = 0; i<images.length; i++){
    String imageName = "face" + nf(i,1) + ".jpg";
    println("imageName" + imageName);
    
    images[i] = loadImage(imageName);
    noLoop();
    
   
  }
  
  

}

void draw() {

  frame++;
  if(frame == numFrames){
    frame=0;
  }
  image(images[frame], 0, 0);
     
     
     
     fill(255,255,255);
  ellipse(x,235,40,40);
   x= x-80;
  if(x <210){
  
 
  

x=width ;
  
  }
}

  void mousePressed() 
   {
     frameRate(5);
    loop();
  }  


