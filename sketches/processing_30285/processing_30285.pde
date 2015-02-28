

int x = 30;
PFont fontA;


float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;
float flapSpeed = 1;


float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.04; 

  
void setup() 
{
  size(800, 600, P3D);
  noStroke();
  frameRate(30);
  
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);
  // Only draw once
   
}

void draw() {
  background(0);
  lights();
  
  loadPixels();
 
  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff,zoff)*255;

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright,bright,250);
    }
  }
  updatePixels();
  
  zoff += zincrement; // Increment zoff
  
  
  
  // Use fill() to change the value or color of the text
  fill(0);
  text("A", x, 60);
  fill(0);
  text("Lenda", x, 95);
  fill(0);
  text("dos", x, 130);
  fill(255);
  text("Serrabecos", x, 190);
  
  
  
  // Flight
  px = sin(radians(ang3)) * 170;
  py = cos(radians(ang3)) * 300;
  pz = sin(radians(ang4)) * 500;
  translate(width/2 + px, height/2 + py, -700+pz);
  rotateX(sin(radians(ang2)) * 120);
  rotateY(sin(radians(ang2)) * 50);
  rotateZ(sin(radians(ang2)) * 65);
  
  // Body
  fill(50,30,10);
  box(5, 100, 5);

  // Left wing
  fill(50,30,10);
  pushMatrix();
  rotateY(sin(radians(ang)) * -20);
  rect(-75, -50, 75, 100);
  popMatrix();

  // Right wing
  pushMatrix();
  rotateY(sin(radians(ang)) * 20);
  rect(0, -50, 75, 100);
  popMatrix();

  // Wing flap
  ang += flapSpeed;
  if (ang > 3) {
    flapSpeed *= -1;
  } 
  if (ang < -3) {
    flapSpeed *= -1;
  }

  // Increment angles
  ang2 += 0.01;
  ang3 += 2.0;
  ang4 += 0.75; 
  
}

