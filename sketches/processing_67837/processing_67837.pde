
//Assignment 1c
//Yoko Tomishima(ytom4097)
//Hungry Monster
//Referenced Processing OpenCV Tutorial #2- bubbles by Andy Best
//http://andybest.net/2009/02/processing-opencv-tutorial-2-bubbles/


import hypermedia.video.*;  //import opencv video library
import processing.video.*;  //import video library
import java.awt.Rectangle;  //import rectangle for face detection

PImage movementImg;  //creates a new PImage to hold the movement image
int poppedFoods;   //creates a variable to hold the total number of popped foods
ArrayList foods;   //creates an ArrayList to hold the Food objects
PImage foodPNG;    //creates a PImage that will hold the image of the food
PFont font;        //creates a new font object
PImage img;          //create a PImage for face

MovieMaker myMovie;
OpenCV opencv;

int fps = 10;      //capture frame rate


void setup() {
  
  size(640,360); 
  opencv = new OpenCV(this);
  opencv.capture(width,height);  
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);    //for face ditection
  movementImg = new PImage(width,height);
  poppedFoods = 0;
  foods = new ArrayList();
  img = loadImage("domo_6.png");    //image for face 
  imageMode(CORNER);
  foodPNG = loadImage("Hamburger.png");
  println("press spacebar to stop the recording");    //image for falling objects
  myMovie = new MovieMaker(this, width, height, "capture.mov", fps, MovieMaker.H263 , MovieMaker.BEST);
  font = loadFont("CooperBlackStd-Italic-48.vlw");
  textFont(font, 32);
}


void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
  Rectangle[] faces = opencv.detect();
  
  //openCV face detection & put replace image instead of red square
  for (int i = 0; i < faces.length; i++) {
  image(img,faces[i].x,faces[i].y,faces[i].width,faces[i].height);
  }
  
  //for foods
  foods.add(new Food((int)random(0,width-40),-foodPNG.height,foodPNG.width,foodPNG.height));
  opencv.flip(OpenCV.FLIP_HORIZONTAL);   //flip image horizontally then 
  opencv.absDiff();
  
  opencv.convert(opencv.GRAY); //convert to grayscale for threshold
  opencv.threshold(20);        // detect movement by threshold
  movementImg = opencv.image();
  
  for(int i = 0;i<foods.size();i++){  
    Food _food = (Food) foods.get(i); // copy food to temporary object
      if(_food.update()==1){          // if update() returns 1 remove burger
        foods.remove(i);              //remove object from array
        _food = null;                //temporary object is null
        i--;                        //subtract 1 food from i
      }else{                        // if update() doesn't return 1
        foods.set(i,_food);        // copy temporary objects into array
        _food = null;              //temporary object is null
      }
  }
  
  opencv.remember(OpenCV.SOURCE, OpenCV.FLIP_HORIZONTAL); //flip holizontally again


  myMovie.addFrame();
  //println(poppedFoods);
  text("Burger : "+poppedFoods,340,320); // display how many burgers were eaten
}




void keyPressed() {    //if space key is pressed
  if (key == ' ') {   // If we press spacebar...

    myMovie.finish(); // Stop recording
    stop();
}
}
void stop() {      
  myMovie.finish();
  super.stop();
}

