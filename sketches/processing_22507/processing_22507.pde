
//Romina de Grote
// Image Sketch using the blend function

void setup() {
  size(800,600);
  PImage img1 = loadImage("IMG_0369.jpg");
  image(img1,0,0);
  
}

void draw(){
   
  if(mousePressed){
  PImage img = loadImage("IMG_0363.jpg");
  blend(img, 0, 0, 800,600, 0, 0,800, 600, SUBTRACT); // blend images with substract modex
   
  }
 }




