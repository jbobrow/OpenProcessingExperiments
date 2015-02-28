
// Edits for colouring the iris by Juan Irache :)

color left = 255; //Create colour variables for each eye and make them white
color right = 255;

float r = 0;
float g = 0;
float b = 0;
float a = 0;

void setup(){
  size(300, 300);
  smooth();
  background(255);
}

void draw(){
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  a = random(0, 200);
  
// Eye Shape
ellipse(70, 100, 100, 50);
ellipse(230, 100, 100, 50);

// Iris
ellipse(70, 100, 50, 50);
ellipse(230, 100, 50, 50);

// Colour the Iris!
  
if (mousePressed && (mouseButton == LEFT)) {
left = color(r,g,b,a); // Set colour for the left variable using the color() function
}

if (mousePressed && (mouseButton == RIGHT)) {
right = color(r,g,b,a); //the same here
}

fill(left); //and then we draw
ellipse(70, 100, 50, 50);

fill(right);
ellipse(230, 100, 50, 50);
  
// Pupil
fill(0);
ellipse(70, 100, 20, 20);
ellipse(230, 100, 20, 20);

// Highlight
fill(255);
ellipse(80, 90, 15, 15);
ellipse(240, 90, 15, 15);

}

