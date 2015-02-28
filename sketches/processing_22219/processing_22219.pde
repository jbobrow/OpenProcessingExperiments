


// setting varibales for the images. 

PImage img;
PImage img2;

// positioning where the moving image is going to start. 

float posY = 200;
float posX = 200;
 
// image size and selection.
void setup(){
  size(600, 400);
  img = loadImage("move.png");
  img2 = loadImage("doginteraction.jpg");
}
 
// setting the background image.
void draw(){
  background(img2);

//setting restrciting variables for the moving image.   
  if (posY < 100) {
    posY = height-300;
  }
  
    if (posX < -90) {
    posX = -90;
  }
  
      if (posX > 370) {
    posX = 370;
  }
  
  image(img,posX,posY); 
}
 
//determining how many pixels the image moves when the arrows are pressed.

  void keyPressed(){
 
if(keyCode==UP){
posY -= 5;
}
if(keyCode==DOWN){
posY += 5;
}
if(keyCode==LEFT){
posX -= 5;
}
if(keyCode==RIGHT){
posX += 5;
}
  }


