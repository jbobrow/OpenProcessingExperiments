
//Brandon Sonoda
//Start Date: 8-29-2012

float moonX, moonY; //Moon x and y coordinate
float earthX, earthY; //Earth x and y coordinate
float earthSpeed, moonSpeed; // The rate at which the bodies revolve
float sunX, sunY; // Suns x and y coordinate


void setup() {
  size(500, 500);
  smooth();
  earthSpeed = 0;
  moonSpeed = 0;
  sunX = width/2;
  sunY = height/2;
  strokeWeight(5);
}

void draw() {
  //Larger speeds decrease revolution time
  earthSpeed+= .005;
  moonSpeed+= .05;

  //To establish simple harmonic motion, I used sin funcitons
  earthX = 175*sin(earthSpeed+PI/2)+sunX;
  earthY = 175*sin(earthSpeed)+sunY;
  moonX = 40*sin(moonSpeed+PI/2)+earthX;
  moonY = 40*sin(moonSpeed)+earthY;
  
  background(0);

  fill(0, 0, 255);
  stroke(0, 0, 150);
  ellipse(earthX, earthY, 30, 30);
  fill(200);
  stroke(150);
  ellipse(moonX, moonY, 10, 10);
  fill(255, 255, 0);
  stroke(150, 150, 0);
  ellipse(sunX, sunY, 200, 200);
}


