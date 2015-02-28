
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
float z;
float t;

void setup() {
  size(900,900);
  background(255);
  smooth();    
}

  

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);

 
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  if (mousePressed == true) {
    fill(0);
  } else {
    fill (random(0,225), random (225,0), random(0,250));
  }
  
  
  
   if (mousePressed) {
    fill(0);
  } else {
  }
  ellipse(mouseX, mouseY, 80, 80);
  
  fill(255);
rect(0, 0, 50, 50);  // White rectangle

pushMatrix();
translate(30, 20);
fill(0);  
rect(0, 0, 50, 50);  // Black rectangle
popMatrix();

fill(100);  
rect(15, 10, 50, 50);  // Gray rectangle

if (keyPressed) { clear();}
  
  
println("You are making art");

textSize(22);
fill(0, 200, 200);
text("Press the mouse to draw black, press a key to restart the program", 10, 60);
fill(0, 200,0);
  
 }
