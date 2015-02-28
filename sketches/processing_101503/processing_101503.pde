




//VIDEOSTUFF 1 //////////////////////////////////////////
import processing.video.*;
Capture camera;

//MOVIESTUFF 1 //////////////////////////////////////////
MovieMaker mm;

void setup() {
  size(640, 480);
  background(0);

//VIDEOSTUFF 2 //////////////////////////////////////////
  String[] devices = Capture.list();
  println(devices);
  
  
//VIDEOSTUFF 3 //////////////////////////////////////////
  camera = new Capture(this, 320, 240, devices[0]);
  
  
  //MOVIESTUFF 2 //////////////////////////////////////////
    mm = new MovieMaker(this, width, height, "perlin2.mov", 30, MovieMaker.JPEG,MovieMaker.HIGH);

}

void draw() {
  
  //VIDEOSTUFF 4 //////////////////////////////////////////
    if (camera.available()) {
    camera.read();
    
    
   //MOVIESTUFF 3 ////////////////////////////////////////// 
  loadPixels();
  mm.addFrame(pixels,width,height);

//VIDEOSTUFF 5 //////////////////////////////////////////
   //camera.filter(INVERT);// change if You want///////////////
    image(camera, 160, 100);
  }
}

 //\/\/\/\/\/MOVIE MAKER STUFF 4\/\/\/\/\/\/\/\\/++++++++++++++++++++++++++++++++++
void keyPressed(){
  
  //SCREENSAVERSTUFF 1 //////////////////////////////////////////
 if (key =='s');
 saveFrame("pict######.png");
 
 
  //MOVIESTUFF 3 //////////////////////////////////////////
 if (key =='m');// pour sauvegarder moviene marche pas vraiment avec start et stop++++++
  mm.finish();
}

