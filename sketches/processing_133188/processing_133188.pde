
int startingHue = 290; //pink
int endingHue = 265; //purple
int colorDiff; //degrees between pink and purple 
int randomNum; //number the random generator generates
int randomHue; //the actual hue degree to use between pink and purple

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100); //sets the mode to HSB
  colorDiff = startingHue - endingHue; //how many degrees between pink and purple?
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, width/2, height/2);
}

void mouseClicked(){
  randomNum = floor(random(colorDiff)); //pick a random whole number between 0 and the colorDiff
  println("randomNum: " + randomNum); //print the random value chosen to the console so that you know what you are getting
  randomHue = randomNum + startingHue; //add the random value to the starting hue so that you end up with a random color in the right range
  println("randomHue: " + randomHue); //print the hue to use to the console (should be between the startingHue and the endingHue)
  fill(randomHue, 100, 100); //set the fill of the ellipse to the random hue with full saturation and brightness
}


