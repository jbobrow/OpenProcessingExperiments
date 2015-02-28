
import processing.video.*;

Movie miPeli;

void setup(){
  size(320,240);
  miPeli=new Movie(this, "conejo.mov");
  miPeli.loop();
}

void draw(){
  image(miPeli,0,0);
  loadPixels();
  for(int i=0;i<320*240;i++){
   pixels[i]=color(  red(pixels[i])  +green(pixels[i])   +blue(pixels[i]) );
  } 
  updatePixels();
}

