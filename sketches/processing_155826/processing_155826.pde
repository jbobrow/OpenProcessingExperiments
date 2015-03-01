
int radius;
color myColor;
float bob;

void setup() {
  size(800, 600); //defined size of frame
}

void draw() {
  background(0, 255, mouseX); //background color is variable subject to position of mouse on X axis
  myColor=int(map(mouseX, 0, width, 0, 255));
  stroke(225, 255, 98); //stroke color is defined
  strokeWeight(2); //stroke weight is defined
  fill(mouseX, 150, frameCount); //fill color is variable subject to position of mouse on X axis
  radius=mouseX; //radius is defined by postion of mouse on X axis
  rect(mouseX, mouseY, radius, radius); //width, height and position of rectangle is variable 
  ellipse(mouseY, mouseX, radius, radius); //width, height and position of ellipse is variable 
}



