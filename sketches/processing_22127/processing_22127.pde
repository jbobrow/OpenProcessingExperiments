
import gifAnimation.*;

int counter = 0;
PImage[] animation = new PImage[4]; 
Gif loopingGif;

void draw() { 
    background(200);
    imageMode(CENTER);
    image(animation[counter], 200, 200); 
  }
  
 void mousePressed() {
   if(counter < animation.length-1){
  counter++; 
   }else{
     counter = 0;
   }
 }

void setup() {
  size(400, 400);
  background(200);
  frameRate(100);
  String[] filenames = { "frame1.png", "frame2.png", "frame3.png", "frame4.gif"};
  println("gifAnimation " + Gif.version());
  loopingGif = new Gif(this, "frame4.gif");
  loopingGif.loop();
  animation = Gif.getPImages(this, "frame4.gif");
  
  for (int i = 0; i < filenames.length; i++ ) {
    animation[i] = loadImage(filenames[i]);
  } 
}

