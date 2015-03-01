
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/81298*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/8297*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* Some code from Ian151 (ChromeWing) on OpenProcessing */


PImage img;
PImage img1;
PImage img2;

int numFrames = 3;
int frame = 0;
PImage[] images = new PImage[numFrames];

int transparency1;
int transparency2;
//int transparency3;

void setup(){
  restart();
  size(490,670);
  transparency1 = 255;  //opaque v transparant layers
  transparency2 = 0;
  images[0] = loadImage("L1.jpg");
  images[1] = loadImage("L2.jpg");
  images[2] = loadImage("L3.jpg");
}

void draw(){
  background(255);
  
  tint(255,255,255,transparency1);
  image(images[0], 0, 0);
  if(transparency1 > 0){
    transparency1--;
  }
  tint(255,255,255,255-transparency1);
  image(images[1], 0, 0);
  
  tint(255,255,255,transparency2);
  image(images[2], 0, 0);
  if((transparency1 == 0) && (transparency2 < 255)){
    transparency2++;
  }
  
 loadPixels();
 updatePixels(); {
   if (mousePressed) {
    restart(); //returns to the beginning of the sequence when mouse is clicked
   }
   if (keyPressed) {
     if (key == CODED)
  {
    //what key was pressed? is the previous angle the opposite direction?
    //we wouldn't want to go backwards into our body, that would hurt!
    //also, is the previous body segment in front of the direction?
    //(based on the previous question, but added for secure turning without suicide)
    if (keyCode == UP)
    {
      filter(INVERT);
    }
    
    if (keyCode == DOWN)
    {
      filter(DILATE);
    }
    
    if (keyCode == LEFT)
    {
      filter(BLUR);
    }
    
    if (keyCode == RIGHT)
    {
      filter(POSTERIZE, 6);
    }
  }
 }
}
}
//next we need to set up the restart. 
//what aspects do we want at each beginning of the sequence? 
//(there might be an easier way to do this but this was the simplist way for me to think about it)
//they go in this area.
void restart() {
  transparency1 = 255;
  transparency2 = 0;

  images[0] = loadImage("L1.jpg");
  images[1] = loadImage("L2.jpg");
  images[2] = loadImage("L3.jpg");
  
  tint(255,255,255,transparency1);
  image(images[0], 0, 0);
  if(transparency1 > 0){
    transparency1--;
  }
  tint(255,255,255,255-transparency1);
  image(images[1], 0, 0);
  
  tint(255,255,255,transparency2);
  image(images[2], 0, 0);
  if((transparency1 == 0) && (transparency2 < 255)){
    transparency2++;
  }
}


