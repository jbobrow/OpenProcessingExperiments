
//referenced James Patterson's animated sprite code + help from Dylan Corwin
Animation animation1, animation2;
//setting up global value for posision
float xpos, ypos;
float drag = 30.0;
//global value set up for reference to animation for right
String direction = "right";

void setup() {
  //size of image
  size(500, 500);
  //initial background color
  background(255, 204, 0);
  frameRate(24);
  //setting up folder and number of frames for array
  animation1 = new Animation("animation_EMS/", 8);
}
void draw(){
  //if you press the left arrow key, character's animation faces left
  if (keyPressed) {
    if (keyCode == 37)
      direction = "left";
//if you press the right arrow key, animation faces right
  else if(keyCode == 39) {
    direction = "right";
  }
  }
  //background color change
  background(153, 153, 0);
  //setting up the variable for either direction in animation
  animation1.display(direction);
}
    




// Setting up class and array for animation sequence

class Animation {
  //the array
  PImage[] images;
  //number of images in array
  int imageCount;
  //what number frame we are on
  int frame;
  
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
//loop the animation
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + i + ".gif";
      images[i] = loadImage(filename);
    }
  }
//Dylan helped me a fair bit with all this, so I'm not entirely confident in how everything works
//function for possible directions
  void display(String direction) {
    if(direction.equals("left"))
      {
      //the list of frames to play for right
           frame = (frame+1) % (imageCount/2);
           image(images[frame], xpos, ypos);
  
      }
      else
      { //list to play for left
         frame = imageCount/2 + (frame+1) % imageCount/2; 
         image(images[frame], xpos, ypos);
      }
      
      
    
  }
  
  int getWidth() {
    return images[0].width;
  }
}
