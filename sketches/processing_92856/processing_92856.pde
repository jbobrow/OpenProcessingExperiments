
void setup() {
  size(600, 400); 
  //Changed the sizing of the sketch
  smooth();
  stroke(55);
  //Added a stroke
  //Added a backround to make it random everytime the sketch is reloaded.
  background(random(255), random(225), random(225));
}

void draw () {
 //added integer to make the colors of the ellipse change all the time randomly
 //I also chaged it that when you click the colors change randomly.
 //and I changed it so that there is no solid colors on the sketch besides the random colors.
  int mousix=mouseX;
  int mousiy=mouseY;
  if (mousePressed) 
    fill(random(255), random(225), random(225));
  } 
 

  void mouseDragged() {
    int mousix=mouseX;
    int mousiy=mouseY;
    ellipse(mousix, mousiy, 40, 40);
    fill(random(255), random(225), random(225));
  }



