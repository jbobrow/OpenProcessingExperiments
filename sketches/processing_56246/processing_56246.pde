

float x = 60;
float y = 150;
int bodyHeight = 120;
int neckHeight = 95;
int headRadius = 45;

float easing = 0.02;

void setup () {
  size(720, 480);
  smooth();
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
}

void draw() {
  
  // Change postion by a bit
x += random(-10, 10);
y += random(-10, 10);
frameRate(25);
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
   
    
  
  
 background(204);
  

// Neck
stroke(102); // grey stroke
line(x+200, y+150, x+200, y+10); //left
line(x+216, y+150, x+216, y+10); // middle
line(x+226, y+150, x+226, y+10); // right  

// Antennae
line(x+216, y+10, 246, 112); // small
line(x+216, y+10, 306, 56); // tall
line(x+216, y+10, 324, 170); // medium

// Body


noStroke(); // no stroke
fill(102); // grey fill
ellipse(x+190, y+227, 20, 20); // orb
ellipse(x+240, y+227, 20, 20); // orb

if (mousePressed){
    fill(0); // black fil
    rect(x+159, y+107, bodyHeight, bodyHeight); // main body
  } else {
    fill  (255, 0, 14); // red fill
    rect(x+159, y+107, bodyHeight, bodyHeight); // main body

}
    
fill(102); // grey fill
rect(x+159, y+150, 120, 6); // grey stripe

// Head
fill(0); // black fill
ellipse(x+216, y+5, 45, 45); // head
fill(255); // white fill
ellipse(x+228, y, 14, 14); // large eye
fill(255, 0, 14); // black fill
ellipse(x+228, y, 3, 3); // Pupil
fill(255); // white fill
ellipse(x+200, y+10, 10, 10); // large eye
fill(255, 0, 14); // black fill
ellipse(x+200, y+10, 3, 3); // Pupil

}






