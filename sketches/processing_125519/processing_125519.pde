

PImage img1;
PImage img2;
PImage img3;
PImage img4;
 

int frame;
 
void setup () {
 background(255);
  size (140, 200);
 
  frameRate (6);
   
 
  frame = 1;
   

  img1 = loadImage ("1.jpg");
  img2 = loadImage ("2.jpg");
  img3 = loadImage ("3.jpg");
  img4 = loadImage ("4.jpg");
}
 
void draw () {
 
  if (mousePressed == true) {
    

  
  if (frame > 4) {
    frame = 1;
  }
   
 
  if (frame == 1) {
    image (img1, 0, 0);
  }
  if (frame == 2) {
    image (img2, 0, 0);
  }
  if (frame == 3) {
    image (img3, 0, 0);
  }
  if (frame == 4) {
    image (img4, 0, 0);
  }
 
  }


  frame = frame + 1;
}
