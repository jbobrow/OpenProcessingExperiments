
//MOVIEPAINTSTUFF 1 /////////////////////////////////////////
import processing.video.*;
Movie myMovie;


void setup() {
  size(497,495,P2D);
  background(0);
 
 //MOVIEPAINTSTUFF 2 ///////////////////////////////////////// 
  myMovie = new Movie(this, "astres.mov");
    //myMovie = new Movie(this, "MERTRO4.mov");
  myMovie.loop();
}

void draw() {
  //MOVIEPAINTSTUFF 3 /////////////////////////////////////////
  image(myMovie, mouseX,mouseY,random(0,90),random(0,90));
}
//MOVIEPAINTSTUFF 4 /////////////////////////////////////////
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


