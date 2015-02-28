
// pattern created by a grid of pictures

PImage mypic;

void setup(){
 size(300,300);
mypic = loadImage("Narrowstreet.jpg");


}

void draw(){
  
 //creates a grid of the picture
 for ( int x =0; x<width; x = x+width/6){
  for ( int y = 0; y<height; y = y+height/6){
  image(mypic, x,y,width/6,width/6); 
  }
 }
}

