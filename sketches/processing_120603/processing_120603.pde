
float r;
float g;
float b;
float a;

void setup() {
size(200,200); // Define sketch window size
background(0); // Set background to black
smooth(); // smooth animation 
rectMode(CENTER);
ellipseMode(CENTER);
}

void draw() 
// Will randomly change the colour of each item that has been coding with this
{
r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
 
// Draw the spaceship body
stroke(152, 143, 143);
fill(16,201,232);
rect(100,100,20,100);
 
// Draw the spaceship nose
fill(r,g,b,a);
triangle(90, 50, 100, 20, 110, 50);

//Draw the spaceship window pt 1
fill(255);
ellipse(100,60,10,10);

//Draw the spaceship window pt 2 
fill(0);
ellipse(100,60,5,5);

// Draw the spaceship wing pt 1
fill(r,g,b,a);
triangle(90, 80, 60, 140, 90, 140);

//Draw the spaceship wing pt 2
fill(r,g,b,a);
triangle(110, 80, 140, 140, 110, 140);

// Draw the bottom wings
fill(r,g,b,a);
quad(90, 150, 80, 160, 110, 150, 120, 160);
}

