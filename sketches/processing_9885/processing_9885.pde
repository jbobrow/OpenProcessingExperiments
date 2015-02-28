
//Global variables

//create a boolean that can be used in mulitple places through out the code
Boolean circle = false;
//create a variable for the value
int value = 0;


//Setup the sketch with the size, the background and smoothing the pixels
void setup () {
  size (450,450);
  background (255);
  smooth ();
}

//Everything that will be drawn within the sketch
void draw () {

  //create an if statement for the boolean
  if (circle){
    frameRate(20);
    //for loop for the randomizing of the circles and their strokes
    for(int i=0; i<=300; i++) {
      //write a function for random
      float r = random(100);
      stroke(value);
      strokeWeight(r*.25);
      ellipse(r*2, i*100, 100+r, i*5);
      ellipse(r*3, i*10, 150+r, i*2);
      ellipse(r*4, i*15,  100+r, i*5);
      ellipse(r*5, i*10,  150+r, i*5);
    }
  }
}

//when the mouse is pressed make the boolean true and change the color of the circles
void mousePressed () {
  circle = true;
  fill(random(255),random(255),random(255));

}

//when the mouse is moved to the left the value of the stroke is changed to the fill of the circles
//if it's moved to the right, the stroke changes to black
void mouseMoved () {
  value = value + 5;
  if (mouseX > 225) {
    value = 0;
  }
  else{
    value += 255;
  }
}















