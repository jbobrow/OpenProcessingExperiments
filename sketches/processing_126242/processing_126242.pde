
//I decided to try pattern-making with circles and ellipses.
// I wanted the stroke colour to change with mouse movement.
// I experimented with the number and size of ellipses, 
// also with colour and transform. I like this best.


///////////////////////////    INSTRUCTIONS    /////////////////////////////  
// Click and drag inside and outside the window to make patterns. 
// By going back and forth, they become more interesting
//
// If you press "w" or "W", it clears the screen, gives a white background
// If you press "b" or "B", it clears the screen, gives a black background.
// If you press "s" or "S", it saves a picture to the file folder.
// During the sketch run, when you save images, 
// they will be numbered png files.
////////////////////////////////////////////////////////////////////////////


//global variables
int countpic;


// setup
void setup() {
  size(900, 700);
  colorMode(HSB,900, 700, 100);
  background(900, 700, 0);
}


//draw
void draw() {
  
  if (mousePressed) {
  
    noFill();
    pushMatrix();
   // translate(mouseX, mouseY);
    translate(width/2, height/2);
    int countlines =  18;       
    strokeWeight (1);
    if (mouseX <= (width/2)) {
      stroke(mouseX, mouseY, 100);
    } else if (mouseX > (width/2)) {
      stroke(900-(int(mouseX/1.001)), mouseY, 100);
    }
    for (int i = 0; i< countlines; i++){
      rotate(radians(360/countlines));
      ellipse(mouseX, mouseY, 80, 20);
      // println("mouse x is: " + mouseX + " mouse y is: " + mouseY);
    }
    popMatrix();
      }
  }

//Screenshot Saving Capability and key response

void keyReleased() {
  if (key == 'w' || key =='W') background(0, 0, 100);
  if (key == 'b' || key =='B') background(900, 700, 0);
  if (key == 's' || key =='S') {
    countpic++; saveFrame(countpic +".png");
  }
  //if (key == 's' || key =='S') saveFrame("screenshot.png");
}



