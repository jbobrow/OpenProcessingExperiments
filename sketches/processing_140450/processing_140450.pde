
//"A Record A Day"

//This interactive sketch will get you your own vinyl recording in no time. 
//Use the 1, 2, 3 key to switch colors, use your mouse to drag and draw, and
//when the record is ready, you can print by pressing the 's' on your keyboard. 

//global variables
color strokeColor = color(0, 10);
//declare integers to be used
int stepX;
int stepY;

//setup the display for your record
void setup() {
  //choose the largest canvas
  size(1280, 720);
  //use the color mode function
  colorMode(HSB, 360, 100, 100, 100);
  //set the fill option 
  noFill();
  //decide on a background color
  background(360);
}

//setup the draw code block
void draw() {
  //use the if statement
  if(mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    stepX = mouseX+width;
    stepY= mouseY+height;
    int radius = mouseX-width/2;
    float angle = TWO_PI/radius;
    
    //style
    strokeWeight(random(5, 12));
    stroke(strokeColor);
    
    //use selected function
    beginShape();
    for (int i=0; i<=angle+radius; i++) {
      //declare local variables
      float x = 0; 
      float y = 0; 
      //create the shape
      arc(x, y, radius, radius+13, random(TWO_PI), random(TWO_PI));
    }
    //close off the shape and finish off with the pop matrix
    endShape();
    popMatrix();
}
}

//keyPressed()

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's'|| key == 'S') saveFrame("screenshot.png");
  
  switch(key) {
    case '1': 
      strokeColor = color(0,10);
      break;
    case '2': 
      strokeColor = color(192,100, 64, 10);
      break;
    case '3': 
      strokeColor = color(52, 100, 71, 10);
      break;
      
  }
} 

