
PFont font;


void setup () {
  size (480,480); //sets size of screen
  background(255, 0, 251); //sets background colour
  
  font = loadFont("Dialog.bold-55.vlw"); //loads font
}


  void draw () {
  fill(0, 255, 44);
  textFont(font, 25);
  text("THIS IS A VIDEO GAME!!!", 10, 460);
  
  if(mousePressed) {
    fill(random (255), random (255), random (255));
  }
 else {
  noStroke();
  noFill();
 }
rect(mouseX, mouseY,700, 700);

fill(504, 390, 300);
  rect(200, 200, 200, 200);
  rect(100, 100, 100, 100);
  }
  
  void keyPressed () {
    if(key =='s') {
      saveFrame("sezuireBlock-######.jpg");
    }
 if(key =='x') {
    clear();
    
     background(random (255), random (255), random (255));
 }
  
  }


