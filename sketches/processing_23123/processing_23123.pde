
float theta = 0.02; //angles in radians
float theta1 =0.09;
float theta2 = 0.000001;
float theta3 =0.05;
int diameter = width;//diameter of a circle
float half = 450;
float inc = .047;
int n=0;
int p=0;
int q=0;
int area=0;

//time functions to get different noise characteristics
float t1 = 0.0;
float t2 = 0.2;
float t3 = 0.4;
float tX = 0.0;
float tY = 0.3;

//increments, the overall movement and the circle size vary in different ways
float incrementX = 0.01;
float increment = 0.1;


void setup() {
  size(900, 900);
  background(140,23,23); //jewel tone background
  smooth();
  noStroke();
}

void draw() {
   noStroke();
   
//// oscillation
  float c = (sin(theta) +1)*half; // controls the diameter
  float colorO = (sin(theta1) +1)*20; // the bigger the last number, the more variance in color
  float incO = (sin(theta2)); // the bigger the last number, the more variance
  float c2 = (sin(theta3) +1)*half/2; // controls the diameter
  theta += 0.002; //diameter
  theta1 += 0.09; // color
  
////this rectangle "fades" the drawing slowly
  noStroke();
  fill(140, 23, 23, 5);
  rect(0, 0, width, height);

//////////MOLLY MORIN
   // Get a noise value at "time" and scale it for each dot.
  float n = noise(t1)*(half/9);
  float m = noise(t2)*(half/9);
  float o = noise(t3)*(half/10);
   
  //get a noise value at time and scale it for movement
  float x = noise(tX)*(half/3)+half/1.2;
  float y = noise(tY)*(half/3)+half/.89;
   
  // With each cycle, increment the " time "
  t1 += increment;
  t2 += increment;
  t3 += increment;
  tX += incrementX;
  tY += incrementX;
   


  

///// drawing circle
 
  stroke((255+colorO), (36+colorO), (0+colorO)); // this oscillates the color of the ellipse, changes from burgundy to lighter color
  strokeWeight(2);
  noFill();
  ellipse (half, half, half+c, half+c);
  theta += inc; //the bigger this number, the faster it breathes
  inc += incO;
  
///// inner circle
  noStroke();
  fill(36, 24, 130, 5);
  rect(0, 0, width, height);
  stroke((255+colorO), (36+colorO), (0+colorO), 90); // this oscillates the color of the ellipse, changes from burgundy to lighter color
  strokeWeight(2);
  fill (142,35,35,10);
  ellipse (half, height/1.5, (half/3+c), (half/3+c));
  
    // Draw the ellipse with size determined by Perlin noise
  fill(n, 24, 130);
  stroke((255+colorO), (36+colorO), (0+colorO),30);
  ellipse(x-m, y-m, m, m);
  ellipse(x+o, y+o, o, o);
  ellipse(x-n, y+n, n, n);
//////////MOLLY MORIN20
  

}

