
/**
 basic prezzi style scrolling that moves limitless background around
 */
 //import processing.opengl.*; //opengl doesnt work with openprocessing.org
 import java.awt.event.*; //for mouse wheel
 
int numImages = 14;  //change this to match number of images in the folder
PImage[] images = new PImage[numImages];  //create an array of image objects
float [] xpos = new float[images.length]; //create an array for x position of each imnage in the array of images
float [] ypos = new float[images.length]; //create an array for x position of each imnage in the array of images
float valuex, valuey;
float z;
float rotX, rotY;
int imgcount = 0;
float speed;


void setup() {
  size(800, 800, P3D);
  //for simplicity use a random functino in for loop to lay down the pics
  for(int i = 0; i<images.length; i++){
 xpos[i] = random(-600,width+600);
 ypos[i] = random(-600,height+600);
  }
  //loading loop for images by image name plus a number - dont forget to number the images from 00 onwards
  for(int i = 0; i <images.length; i++){
    String imageName = "img-" + nf(i,2) +".jpg";
    images[i] = loadImage(imageName);
  }
  
  addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
  }}); 
  
}

void draw() {
  background(255);
  
 
  rotateY(radians(rotX));
  rotateX(radians(rotY));
  
  translate(valuex,valuey,z);
  for(int i =0; i<images.length; i++){
  image(images[i], xpos[i], ypos[i]); 
  }
}

//as mouse is dragged update translate position
void mouseDragged(){
  valuex = valuex+(mouseX-pmouseX);
  valuey = valuey+(mouseY-pmouseY);
  if(keyPressed){
    rotX =rotX+(mouseX-pmouseX);
    rotX = constrain(rotX, -45, 45);
    rotY = rotY-(mouseY-pmouseY);
    rotY = constrain(rotY, -45, 45);
    println(rotX);
    println(rotY);
  }
 
}

void mouseWheel(int delta) {
  //println("mouse has moved by " + delta + " units."); 
  z = z + (delta*50);
}



