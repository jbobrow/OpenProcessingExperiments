
/* 
This example needs a folder named "data" 
inside data, the name of the images are fy000.jpg 
fy223.jpg
if you change the code to work with your images
you will have to change line 18 to make it work 


*/
int frame = 0;
int numFrames = 70;
PImage[] images = new PImage[numFrames];

void setup() {
  size(435,162);
  frameRate(12);
  for (int i = 0; i<images.length; i++){
    //change the line below to the name of the images in your data folder
    String imageName = "plane" + nf(i,2) + ".png";
    println("imageName" + imageName);
    
    images[i] = loadImage(imageName);
    
  }

}

void draw() {
  frame++;
  if(frame == numFrames){
    frame=0;
  }
  image(images[frame], 0, 0);
    
  } 
  
  


