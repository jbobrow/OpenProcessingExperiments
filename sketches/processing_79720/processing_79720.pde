
/* Credit: Winnie Chang http://www.openprocessing.org/sketch/23756*@* */
void setup(){
  frameRate(10);
  size(800,533);
  
  //setting up the background image
  PImage bg;
  bg = loadImage("leavesbg.jpg");
  background(bg);
}

void draw(){
 //add more leaves with every click
 if (mousePressed == true){
  PImage leaf;
  leaf = loadImage("leaves1.png");
  imageMode(CENTER);
  image(leaf,mouseX,mouseY);
  
 } 
 
 //delete added leaves with backspace 
if (keyPressed) {
   if(key == BACKSPACE || key == DELETE) {
      PImage bg;
      bg = loadImage("leavesbg.jpg");
      background(bg);
      }
    }
}

  



