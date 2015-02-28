
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


void setup() {
  size(900, 900);
  background(140,23,23); //jewel tone background
  smooth();
  noStroke();
}

void draw() {
   noStroke();

  
////this rectangle "fades" the drawing slowly
  noStroke();
  fill(140, 23, 23, 5);
  rect(0, 0, width, height);

//// oscillation
  float c = (sin(theta) +1)*half; // controls the diameter
  float colorO = (sin(theta1) +1)*20; // the bigger the last number, the more variance in color
  float incO = (sin(theta2)); // the bigger the last number, the more variance
  float c2 = (sin(theta3) +1)*half/2; // controls the diameter
  theta += 0.002; //diameter
  theta1 += 0.09; // color
  

///// drawing circle
 
  stroke((255+colorO), (36+colorO), (0+colorO)); // this oscillates the color of the ellipse, changes from burgundy to lighter color
  strokeWeight(2);
  noFill();
  ellipse (half, height/1.5, half+c, half+c);
  theta += inc; //the bigger this number, the faster it breathes
  inc += incO;
  
///// inner circle
  noStroke();
  fill(36, 24, 130, 5);
  rect(0, 0, width, height);
  stroke((255+colorO), (36+colorO), (0+colorO), 90); // this oscillates the color of the ellipse, changes from burgundy to lighter color
  strokeWeight(2);
  fill (142,35,35);
  ellipse (half, height/1.5, (half/3+c), (half/3+c));
  

}

