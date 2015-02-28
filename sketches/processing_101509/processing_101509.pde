
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/74884*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Picture and video Gottfried Beyreuther 2013 designed for PROCESSING 1.5.1


//VIDEOSTUFF 1 //////////////////////////////////////////
import processing.video.*;
Capture camera;

//MOVIESTUFF 1 //////////////////////////////////////////
MovieMaker mm;




PImage img;

float angle = 0.0;



   void setup() {
     size(1400, 1000);

//VIDEOSTUFF 2 //////////////////////////////////////////
  String[] devices = Capture.list();
  println(devices);
  
  
//VIDEOSTUFF 3 //////////////////////////////////////////
  camera = new Capture(this, 320, 240, devices[0]);
     
     img = loadImage("gbor01.jpg");

  image(img, 0, 0);
     smooth();
     frameRate(30);
     
    //MOVIESTUFF 2 //////////////////////////////////////////
    mm = new MovieMaker(this, width, height, "perlin2.mov", 30, MovieMaker.JPEG,MovieMaker.HIGH);  
     
}
   void draw() {
   //VIDEOSTUFF 4 //////////////////////////////////////////
  if (camera.available()) {
    camera.read();
    
    translate(mouseX, mouseY);
     rotate(angle);
     
      image(img, 0, 0, width/4, height/4);
     fill(random(100, 200), random(200, 255), random(0, 100));
     angle += 3;
     
     
      //MOVIESTUFF 3 ////////////////////////////////////////// 
  loadPixels();
  mm.addFrame(pixels,width,height);
     
     
    //VIDEOSTUFF 5 //////////////////////////////////////////
    //camera.filter(INVERT);// alternative for PSYCHEDELLIC EFFECT+++++++++++++++
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

