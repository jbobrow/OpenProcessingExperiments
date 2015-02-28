
import processing.video.*;

Movie myMovie;

void setup(){
  size(640,480);
  myMovie = new Movie(this, "100_1649.MOV");
  
  myMovie.loop();
}

void draw(){
  //tint (255,255,0);
  image(myMovie, 0,0);
  loadPixels();
  for(int i=0; i<640*480; i++){
    pixels[i]=color((red(pixels[i])+green(pixels[i])+blue(pixels[i])/3));
  }
  updatePixels();
  
}

void movieEvent(Movie m){
 m.read();
}
