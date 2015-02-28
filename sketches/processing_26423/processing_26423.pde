
float circleSize = 0; 
int circleX = 100; 
int circleY = 100;

void setup() { 
  size(200,200);
}

void draw() { 
  background(0); 
  stroke(255); 
  fill(175);
   
  ellipse(circleX, circleY, circleSize, circleSize);
  circleSize = circleSize + 0.1;
}

/*

1) For the circle to follow the mouse, assign ellipse the location
values of mouseX, mouseY (instead of circleX, circleY) i.e. 

ellipse(mouseX, mouseY, circleSize, circleSize).

The circle will continue to grow as it follows the mouse because we have 
told it that circleSize will contantly increase at a rate of circleSize + 1.

2) To vary the speed at which the circle grows, convert circleSize into
a float value i.e.

float circleSize = 0;

To decrease the speed at which the circle grows, assign  circleSize a value
smaller than 1 (for the purposes of this example). E.g.

circleSize = circleSize + 0.1;


This new code would now read:

float circleSize = 0; 
int circleX = 100; 
int circleY = 100;

void setup() { 
  size(200,200);
}

void draw() { 
  background(0); 
  stroke(255); 
  fill(175);
   
  ellipse(mouseX, mouseY, circleSize, circleSize);
  circleSize = circleSize + 0.1;
}


*/



