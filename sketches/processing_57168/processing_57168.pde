

PImage landscape;
float easing = 0.03;
float offset = 0;
float x = 215;
float y = 200;
int z = 70;
int bodyHeight = 50;
int neckHeight = 100;
int radius = 45;
float angle = 0.0;


void setup() {
  size(620, 350);
  landscape = loadImage("beach_sunset_2.png");
  ellipseMode(RADIUS); 
  smooth();  
 
}

void draw(){
  int currentTime = millis ();
  background(landscape);
  x += random(-4, 4);
  y += random(-1, 1);
   
  neckHeight = 80 + 0 * 10;
  angle += 0.1;
   
  float ny = y - bodyHeight - neckHeight - radius;  //Neck Y
   

// Neck 
stroke(#0C3BF0); 
strokeWeight(10);
line(x, y, x, z);
// Arms
strokeWeight(10);
stroke(#0C3BF0);
line(x, y, neckHeight-7, neckHeight + 7);        // Left arm
line(x, y, z *4, neckHeight + 7);                 // Right arm
noStroke();
fill(#0C3BF0);
ellipse(neckHeight -7, neckHeight +7, 20, 20);   // left hand
ellipse(z *4, neckHeight +7, 20, 20);  //right hand
//Legs
strokeWeight(10);
stroke(#05165A);
line(x +10, y + 53, z *3, y + 130);
line(x - 10, y +53, z *2, y + 130);
// Antennae
strokeWeight(20);
stroke(#ED1A1A);
line(x, z, x, bodyHeight);    //antenna 
// Head 
noStroke(); 
fill(255); 
ellipse(x + 15, z +40, 14, 14);    //Large eye right
ellipse(x -15, z + 40, 14, 14);
fill(0);
ellipse(x + 12, z + 50, 3, 3);      //Pupil
ellipse(x - 12, z + 30, 3, 3);      //pupil left


if (mousePressed) {
  fill(#ED1A1A);
 neckHeight = 200;
} else {
  
  fill(#0C3BF0);
  neckHeight= 157;
  }
  ellipse(x, y, 33, 33);
  ellipse(x, 240, bodyHeight, bodyHeight);
}


  


