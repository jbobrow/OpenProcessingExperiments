
// Interactive Zoog2
// Based on Example 3-6: Interactive Zoog? Learning Processing by Daniel Shiffman
// http://www.learningprocessing.com/examples/chapter-3/example-3-6/

void setup()
{
  // setup() runs once
  size(300,300);
  smooth();
  frameRate(30);
}
void draw()
{
// draw() loops forever, until stopped
// Draw a white background
background(255);

// Set ellipses and rects to center
rectMode(CENTER);
ellipseMode(CENTER);

// Set stroke color (0) and weight
stroke(0);
strokeWeight(1);

// Antenna 1
line(pmouseX-20,mouseY-95,mouseX-16,mouseY-68);

// Antenna 2
line(pmouseX+20,mouseY-95,mouseX+16,mouseY-68);

strokeWeight(5);

//Body
fill(0,75,175);
rect(mouseX,mouseY,80,78);

//Head
stroke(0);
fill(0,225,0);
ellipse(mouseX,mouseY-40,60,60);

// Arms
fill(0,175,175);
rect(mouseX-40,mouseY,20,31);
rect(mouseX+40,mouseY,20,31);

//Legs
fill(0,105,175);
rect(mouseX-40,mouseY+40,24,32);
rect(mouseX+40,mouseY+40,24,32);

// Legs lines
stroke(0);
strokeWeight(6);
line(mouseX-40,mouseY+40,mouseX-40,mouseY+61);
line(mouseX+40,mouseY+40,mouseX+40,mouseY+61);

// Eyes
// Eye color is determined by the mouse location
fill(mouseX,pmouseX,mouseY); 
noStroke();
// Draw left eye
ellipse(mouseX-14,mouseY-41,16,16);

// Draw right eye
ellipse(mouseX+14,mouseY-41,16,16); 
}

void mousePressed()
{
println("Take me to your leader!");
}
