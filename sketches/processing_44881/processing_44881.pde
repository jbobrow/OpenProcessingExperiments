
PImage g; //plane
PImage t; //tree
PImage f; //plane2
PImage m; //moon
int x = 0;
int[] a = new int[125];
int[] b = new int[125];
int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int radius = 40; // Road lines
float theta = 0.0;  // Start angle at 0
float amplitude = 25.0;  // Height of wave
float period = 700.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float[] roadLines;  //
float[] trees; //
float rl = -radius; // Road Lines
float speed = 3; //Road Lines
float xoff = 0.0;// flying

void setup() {
  size(500,500);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
  w = width+36;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  roadLines = new float[3];
  for (int count1 =0; count1 < 3; count1++)
  roadLines[count1] = count1 * 200;
  for(int i = 0; i < a.length; i++){
   a[i] = i*30;
 }
  g = loadImage("plane.jpg");
   f = loadImage("plane2.jpg");
  t = loadImage("treee.jpg");
  m = loadImage("moon.jpg");
 
}

 
void draw() {
 
  background(51,153,0);
  calcWave();
  MovingMountains();
  
  if (mousePressed == true) {
   image (m,400,20);
  }
{
xoff = xoff + .01;
  float n = noise(xoff) * width;
image (g,150,n/2);
if (mousePressed == false) {
   image (g,150,n/2);
  }
  if (mousePressed == true) {
   image (f,150,n/2);
  }
}

  
    fill (35);
 rect(0, 400, 500, 50); //Road
  for (int count = 0; count < 3; count++)
  {
  roadLines[count] += speed;  // Increase the value of rl
   if (roadLines[count] > width) {  // If the shape is off screen
    roadLines[count] = -radius;  // move to the left edge 
   }
 fill (255);
rect(roadLines[count], 422, 50, 7); // Road Lines 
image (t, roadLines[count], 340);
fill (255,140,0);
if (mousePressed == false) {
ellipse (450,80,50,50);
}
  if (keyPressed == true) {
    snow();
  }
  }
  fill(0);

 
  }


   

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
    
  }
}
void MovingMountains() {
  // Mountains
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(255,50);
    if (mousePressed == true) {
    fill(0);
  }
    ellipseMode(CENTER);
    ellipse(x*xspacing,100+yvalues[x],400,400);
    
  }
}

void snow () {
  fill(240);
  for (int coun = 0; coun < 3; coun++)
    for (int x = 0; x < a.length; x++) {
    a[x] += (int)random(-5,5);
    b[x] += (int)random(-2,3);
    ellipse(a[x], b[x], 3, 3);
    
  }
}
 
 

