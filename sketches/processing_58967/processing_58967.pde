
PImage chewy; 
PImage maskchewy; 

void setup(){
  size(640, 480); 
  chewy = loadImage("hannchewy.jpg"); 
  maskchewy= loadImage("chewpromolarge_glitched.jpeg"); 
  image(chewy, 0, 0); 
  blend(maskchewy, 0, 0, 640, 480, 0, 0, 640, 480, DIFFERENCE);
}

