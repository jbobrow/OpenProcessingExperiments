
//make the cupcakes into a rendered abstract painting

PImage myImage;  //define img
PImage cpImage;  //define copy of image
 
 
void setup(){
  myImage=loadImage("_MG_4788.JPG"); 
  cpImage=loadImage("_MG_4788.JPG"); 
  size(640, 480);  
  image(myImage, 0,0); 
  loadPixels(); 
}
 
void draw(){
   
}
 
void mouseDragged(){ //paint brush stimulation
 for (int i = 0; i < 10; i++) {
image(myImage, i*10, 0);
  for(int y=mouseY-20;y<mouseY+380; y++) //for a 10x10 brush area
  for(int x=mouseX-20; x<mouseX+380; x++){
    int xx=constrain(x,0,width-1);  
    int yy=constrain(y,0,height-1);
    pixels[yy*width+xx]=cpImage.pixels[yy*width+xx]^0x0F00*2;//invert blue
  }
  myImage.copy(cpImage,0,0,width,height,0,0,width,height);
  updatePixels();//update to see changes
}
}


