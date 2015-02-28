
//Code blocks, Arrays, and Color Palettes
//Global varibles
color lightRed = #EAAAAA;
color[] palette = {#62FEFF, #ACE84B, #FFC16F, #E859BE, #628EFF};
float x;
//setup()
void setup() {
  //size and background color
  size(800, 600);
  //local variable
  background(lightRed);
}

//draw()
void draw() {
  x+=64;
  float r = random(5);
  //elements to be drawn to the canvas
  noFill();
  strokeWeight(random(5));
  stroke(palette[int(r)]);
  rect(random(width), random(height), random(width), random(height));
//e.g. [prints line of coordinates]
  /*println(x);*/
//Constrain gives a boundary
  x = constrain(height, height, width);
}
