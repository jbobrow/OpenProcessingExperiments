
//mattholl.co.uk

float xCoord = 0;
float yCoord = 0;

//distance each ellipse is drawn from mouse
float extension = 0;

//radial position ellipse is drawn around mouse
float angle = 0;

//determines size of each ellipse, based on distance from mouse
float circle_size = 50;

//init color var
color c;

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  colorMode(HSB);
}

void draw() {
  frameRate(60);  
  if(mousePressed == true) {
    splatter();
  }
}

void splatter() {
  
 //random circles around mouseX, mouseY
 //angle, radius, size
 //larger nearer to centre
 //blue and green - fade alpha
 //green nearer centre - constant or vary alpha
 
  //reset circle_size
  circle_size = 50;
  
  xCoord = mouseX;
  yCoord = mouseY;
  
  angle = radians(random(360));
  
  //change shade and size of ellipse based on extension
  extension = random(100);
  
  float x = extension * sin(angle);
  float y = extension * cos(angle);
  
  xCoord = xCoord + x;
  yCoord = yCoord + y;
  
   //HSB - H 120 through to 240, s 100, B 100 - A varies
  //map extension 0-100, from 120-240
  
  c = color(map(extension, 0, 100, 120, 240), 100, 100);
  
  fill(c, map(extension, 0, 100, 50, 255));
  
  circle_size = circle_size - (extension/2);
  
  ellipse(xCoord, yCoord, circle_size, circle_size);
 
  
}

