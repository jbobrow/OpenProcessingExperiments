
// Hello this was made by Aditya from 8-1 hope u like :D
// So this proream is basically like a paint splated canvas.
// it gets circles and squares piled on top of each other
// there is a auto eraser you can change it key press
// Thats all hope you enjory
// this commands is the varbles
float r = 0;
//make the base of the progame
void setup() {
  //changes colormode from RGB to HSB
  //colorMode(HSB);<----------------|
  // makes the size of the display
  size(500,500);
  //makes the background color
  background(255);
  //this removes the stroke from the ellipse
  noStroke();
}
//loops the command
void draw() {
  //make the ellipse size the same always so it's a circle no oval
  float ellipse_size = random(1,25);
  //makes a transperent circle of any color in the world
  fill(random (255), random (255), random (255), random (255)); ellipse(random(0,499),random(0,499), ellipse_size,ellipse_size);
  //makes a circle with any color in the world
  fill(random (255), random (255), random (255 )); ellipse(random(0,499),random(0,499), ellipse_size, ellipse_size);
  //makes a transperent square of any color in the world
  fill(random (255), random (255), random (255), random (255)); rect(random(0,499),random(0,499), ellipse_size,ellipse_size);
  //makes a square with any color in the world
  fill(random (255), random (255), random (255 )); rect(random(0,499),random(0,499), ellipse_size, ellipse_size);
  //creates a rectangle going around the page erasing it
  fill(255);
  translate(250, 250);
  rotate(r);
  rect(0, 0, 500, 500);
  
  r = r + 0.005;
}
//makes it so when you press a key it changes the background with a shade of white
//void keyPressed(){
  //if (key== ' '){
    //shade of white  -v
   // background(random(0,255));
  //}
//}
