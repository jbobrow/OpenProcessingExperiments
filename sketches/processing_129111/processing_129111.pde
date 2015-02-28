
/* @pjs preload="Space Background.jpg"; */
PImage enemy;
int G;
PImage bg;
int y;
void setup() {
  size(858, 536); // Size of the window
  smooth(); // Sets all animation to smooth
  bg = loadImage("Space Background.jpg"); //Load background into file
  enemy = loadImage("Greg 1.png"); // Greg's head
// Set all ellipses and rectangles to CENTER mode
ellipseMode(CENTER); 
rectMode(CENTER);

}

void draw() {
// Background
  background(bg);
  
  stroke(226, 204, 0); // Outline of background
  line(0, y, width, y);
  
  y++;
  if (y > height) {
    y = 0; 
  }

// Wingman (Friendly) 
float R = random(255); // Randomly chooses a shade of red
float G = random(255); // Randomly chooses a shade of green 
float B = random(255); // Randomly chooses a shade of blue

// Legs
fill(51,232,240); // Colour of the leg
rect(mouseX,522,3,12.5); // Size and coordinates of Leg 1
rect(mouseX+18,522,3,12.5); // Size and coordinates of Leg 2

//Left Wing
fill(65,88,98); // Colour of left wing
triangle(mouseX+9,460,mouseX+9,505,mouseX-35,505); // Size and coordinates of Triangle

//Right Wing
fill(65,88,98); // Colour of right wing
triangle(mouseX+9,460,mouseX+56,505,mouseX-35,505); // Size and coordinates of Triangle

// Lower Body
fill(0,176,255); // Colour of the left arm
rect(mouseX+9,505,35,20); // Size and coordinates of the Rectangle

// Body
stroke(0);// Colour of the line
fill(0,44,255); // Colour of the body
ellipse(mouseX+9,490,40,40); // Size and coordinates of the Ellipse

// Left Arm
fill(0,255,18); // Colour of the left arm
ellipse(mouseX-12,488.5,10,10); // Size and coordinates of the Ellipse
rect(mouseX-22,487,10,5); // Size and coordinates of the Rectangle

// Right Arm
fill(0,255,18); // Colour of the left arm
ellipse(mouseX+30,488.5,10,10); // Size and coordinates of the Ellipse
rect(mouseX+39,487.5,10,5); // Size and coordinates of the Rectangle

// Head
fill(0,176,255); // Colour of the head
ellipse(mouseX+9,472,30,30); // Size and coordinates of the Ellipse

// Eyes
fill(R,G,B); // Colour of the eyes
ellipse(mouseX+4,468,6,10); // Size and coordinates of Eye 1
ellipse(mouseX+14,468,6,10); // Size and coordinates of Eye 2

// Defense barriers 
fill(16,232,18); // Fill colour for the barriers

// Far left barrier
rect(80,410,10,30); // Left rectangle coordinates
rect(180,410,10,30); // Top rectangle coordinates
rect(130,400,110,10); // Right rectangle coordinates

// Centre barrier
rect(379,410,10,30); // Left rectangle coordinates
rect(479,410,10,30); // Top rectangle coordinates
rect(429,400,110,10); // Right rectangle coordinates

// Far right barrier
rect(670,410,10,30); // Left rectangle coordinates
rect(770,410,10,30); // Top rectangle coordinates
rect(720,400,110,10); // Right rectangle coordinates

// Wingman controls

//Greg row 1
image(enemy,210,50);
image(enemy,300,50);
image(enemy,390,50);
image(enemy,480,50);
image(enemy,570,50);

//Greg row 2
image(enemy,210,150);
image(enemy,300,150);
image(enemy,390,150);
image(enemy,480,150);
image(enemy,570,150);

}

//shooting
void keyPressed(){
  ellipse(mouseX,472,15,15);
}


