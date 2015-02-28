
//MOVIEPLAYERSTUFF 1 ///////////////////////////////////
import processing.video.*;
Movie myMovie;

void setup() {
  size(497,495,P2D);
  background(0);
  
  //MOVIEPLAYERSTUFF 2 /////////////////////////////////////////
  myMovie = new Movie(this, "astres.mov");
    //myMovie = new Movie(this, "MERTRO4.mov");
  myMovie.loop();
}

void draw() {
  image(myMovie, 0, 0);
}
  //MOVIEPLAYERSTUFF 3 /////////////////////////////////////////
// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

//SCREENSHOT STUFF///////////////////////////////////////////////////////////////
void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");

}


