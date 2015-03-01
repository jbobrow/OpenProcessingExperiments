
/* @pjs preload = "Danny1.jpg"' */
/* @pjs preload = "Danny2.jpg"' */
PImage img;
PImage img2;

void setup (){
  size (500, 500);
  img = loadImage ("Danny1.jpg");
  img2 = loadImage ("Danny2.jpg");
  
}

void draw () {

  int ix = mouseX /2;
  int iy = mouseY/2;
  if (mousePressed == true){
scale (.5);
image (img2, ix, iy);
  } else {
    scale (.5);
    image (img, ix, iy);
    
    
  }
  
  
}




