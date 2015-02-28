
// Copyright 2014 Jacklynn Pham
// ICE 10

// translate, rotate, draw


PImage pic;

void setup()
{
  background(0);
  size(300,300, P3D);
  
  
  pic = loadImage("404toast.jpg");
}

void draw()
{
  background(0);
  imageMode (CENTER);
  pushMatrix(); 
    translate(0,0,-200);
    rotateX( radians(frameCount) );
    rotateY( radians(frameCount) );
    image (pic, 0, 0, 200, 200); 
  popMatrix(); 
}




