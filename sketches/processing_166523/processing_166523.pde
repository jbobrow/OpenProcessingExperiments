
PImage img1, img2, img3, img4;
void setup() {
  frameRate(24);
  size(720,500);
  // Images must be in the "data" directory to load correctly
  img1 = loadImage("experience_learning_base-01-01-01.png");
  img2 = loadImage("experience_top.2-01.png");
  img3 = loadImage("experience_learning_middle-01-01.png");
  img4 = loadImage("experience_learning_bottom-01-01.png");
  image(img1, 0, 0);
  
 
  
}

void draw() {
  smooth();
  image(img1, 0, 0);
  float x =mouseX;
  float y = mouseY;
  float d = dist (181,50, mouseX, mouseY);
  println(d);
  if(d<=120){
    picturetwo();
    
  }
  float c = dist(181,260, mouseX, mouseY);
  println(d);
  if(c<=120){
    picturethree();
    
  }
  
   float f = dist(181,460, mouseX, mouseY);
  println(d);
  if(f<=120){
    picturefour();
    
  }
  
  
  
}

void picturetwo(){
  image(img2, 0, 0);
  }
  
void picturethree(){
  image(img3, 0, 0);
}
  
void picturefour(){
  image(img4, 0, 0);
}




