
float angle = 2;
float grow = 10;
float ellipseWidth = 200;
float ellipseHeight = 400;

void setup() {
  size (600, 600);
}

void draw() {

  background(0);
  noFill();
  stroke(255);
  ellipseMode(CENTER);
  colorMode(HSB);
  translate(width/2, height/2);

  int counter = 0;
  while (counter<600) {

    stroke(counter*3,counter*2,counter*2);
    ellipse(0, 0, ellipseWidth, ellipseHeight);
    rect(0, 0, ellipseWidth, ellipseHeight);
    line(0, 0, ellipseWidth, ellipseHeight);
    triangle(0, 0,0,0, ellipseWidth, ellipseHeight);
    rotate(radians(angle));
    scale(0.96, 0.96);

    counter++;
  }

  angle+= 0.1;
  
  ellipseWidth = ellipseWidth + grow;
  ellipseHeight = ellipseHeight + grow;
  
  
  if (ellipseWidth > 800) {
    grow = - grow;
      }
      else if (ellipseHeight <100) { 
        grow = - grow;
      }
  
  
  
  
  
}



