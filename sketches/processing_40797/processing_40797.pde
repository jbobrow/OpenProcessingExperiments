
//Assignment no. 4 (part 1 of 2)
//Anne Stevens
//combining the "scribbler" line but sourcing 
//line colour from a photograph and then inversing it
//using GSVideo and still image, not JMyron

//import GSVideo library
import codeanticode.gsvideo.*;

PImage fgImg;
PImage bgImg;
float x;
float y;

void setup() {
  size(800,600);
  fgImg = loadImage("pig.jpg");
  //bgImg = loadImage("hydrant.jpg");
  //size(fgImg.width*2,fgImg.height);
  background(255);
  smooth();
  x = width/4;
  y = height/4;
  image(fgImg,0,0);  //Just added to test that the image could be loaded and displayed
}

void draw() {

  float newx = constrain(x + random(-40,40),12,width-250);
  float newy = constrain(y + random(-40,40),10,height-5);
  
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  
  // to find location in the pixel array
  int loc = midx + midy*fgImg.width;
  println(loc); //to trouble shoot why the scribbler crashed if [loc] >= width*height
  
  //pixels is a system Array.  Therefore I don't need to create it.
  float r = 255-red(fgImg.pixels[loc]);
  float g = 255-green(fgImg.pixels[loc]);
  float b = 255-blue(fgImg.pixels[loc]);
  float q = brightness(fgImg.pixels[loc]);
  //println(q);
  
  //strokeWeight controlled by brightness
  if (q > 40) {
   strokeWeight(10); 
  } else {
    strokeWeight(30);
  }

  stroke(r,g,b);
  line(x+400,y,newx+400,newy);
    
    x = newx;
    y = newy;
  
}

