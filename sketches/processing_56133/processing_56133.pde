


float x = 150;
float y = 290;
int z = 100;

float easing = 0.02;

void setup () {
  size(800, 800); 
  smooth(); 
  strokeWeight(9); 
  background(204, 0, 7); 
  ellipseMode(RADIUS);
}

void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  if (mousePressed) {
    z = 50;
  } else {
    z = 120;
  }
    float ny = y - x - z;
   

// Head 
fill(255); // Set fill to white
ellipse(y, x, 44, 44); //nose
fill(0); // Set fill to black
ellipse(y, x, 3, 3); // Pupil
fill(153); // Set fill to light gray
noStroke();
ellipse(263, x, 9, 9); // Small eye 1 
ellipse(296, 130, 9, 9); // Small eye 2

//body
noStroke();
fill(0, 6, 199); // Set fill to blue
ellipse(z*3, z*3, z, z); //body   

// legs
stroke(0, 255, 0); // Set stroke to green
line(320, z*4, 320, z*5); // Left  leg
line(280, z*4, 280, z*5); // Right leg
line(220, 220, 220, 230); // arm 
line(220, 220, 240, 230); // arm 
}


