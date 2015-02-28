
PImage landscape;
float easing = 0.03;
float x = 215;
float y = 200;
int bodyHeight = 50;
float neckHeight = 100;
float radius = 14;
float speed = 0.5;
float angle = 0.0;

void setup() {
  size(620, 350);
  landscape = loadImage("beach_sunset_2.png");
  ellipseMode(RADIUS); 
  smooth();  
}
void draw(){
  background(landscape);
  x += random(-4, 4);
  y += random(-1, 1);    
  neckHeight = 80 + sin(angle) * 30;
  angle += 0.02;
  float ny = y - bodyHeight - neckHeight - radius;  

// Neck 
stroke(#0C3BF0); 
strokeWeight(10);
line(x, y, x, neckHeight);
// Arms
strokeWeight(10);
stroke(#0C3BF0);
line(x, y, x - 122, y - 93);  //Left arm
line(x, y, x + 65, y - 93);   //Right arm
noStroke();
fill(#0C3BF0);
ellipse(x - 122, y - 93, 20, 20);  //Left Hand
ellipse(x + 65, y - 93, 20, 20);   //Right Hand
//Legs
strokeWeight(10);
stroke(#05165A);
line(x - 10, y + 60, x - 65, y + 130); //Left Leg
line(x +10, y + 60, x + 60, y + 130);  //Right Leg
// Antennae
strokeWeight(20);
stroke(#ED1A1A);
line(x, y - 140, x, neckHeight); //Antenna 
// Head 
noStroke(); 
fill(255); 
ellipse(x + 15, y - 90, radius, radius); //Eye Right
ellipse(x -15, y - 90, radius, radius);  // Eye Left
fill(0);
ellipse(x + 12, y - 80, 3, 3);   //Pupil
ellipse(x - 12, y - 100, 3, 3);  //pupil left


if (mousePressed) {
  fill(#ED1A1A);
  } else { 
  fill(#0C3BF0);
  }
  ellipse(x, y, bodyHeight - 17, bodyHeight -17);
  ellipse(x, y + 40, bodyHeight, bodyHeight);
}


  


