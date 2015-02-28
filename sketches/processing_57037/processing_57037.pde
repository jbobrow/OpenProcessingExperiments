
PImage myimage;
PImage secondimage;

//import processing.video.*;

//MovieMaker mm;

void setup(){
  size(400, 400);
  myimage =loadImage("img1.jpg");
  secondimage =loadImage("img2.jpg");
  frameRate(2.5); //how fast DRAW runs thhe program
  //  mm = new MovieMaker(this, width, height, "drawing.mov");

}
void draw(){
  //image( image name, top left x, top left y);
  tint(150); //changes brightness
  image(myimage, 0, 0, width, height);
  
  tint(225, random(200), random(200), 150);
  image(secondimage, random(200), random(200), 200, 350);
  
  //  mm.addFrame();


}

/*
void keyPressed() {
  if (key == ' ') {
    // Finish the movie if space bar is pressed
    mm.finish();
    // Quit running the sketch once the file is written
    exit();
  }
}
*/

