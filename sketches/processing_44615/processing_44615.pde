
PImage myImage;  //define img
PImage cpImage;  //define copy of image


void setup(){
  myImage=loadImage("lights.jpg"); //load
  cpImage=loadImage("lights.jpg"); //load copy
  size(800,600);  //size of img fit
  image(myImage, 0,0); //coordination of where img displayed
  loadPixels(); //load pixels
}

void draw(){
  
}

void mouseDragged(){ //paint brush stimulation
 for (int i = 0; i < 10; i++) {
image(myImage, i*10, 0);
  for(int y=mouseY-10;y<mouseY+50; y++) //for a 10x10 brush area
  for(int x=mouseX-10; x<mouseX+50; x++){
    int xx=constrain(x,0,width-1);  //do not exeed the scrn
    int yy=constrain(y,0,height-1);
    pixels[yy*width+xx]=cpImage.pixels[yy*width+xx]^0x0F00*2;//invert blue
  }
  myImage.copy(cpImage,0,0,width,height,0,0,width,height);
  updatePixels();//update to see changes
}
}


