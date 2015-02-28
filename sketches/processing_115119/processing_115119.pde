
int x = 100;
int y = 100;
boolean reverseX = false;
boolean reverseY = false;
int numCircles = 100;
float gradientColor = 0;

void setup() {
  size(500, 500);
  frameRate(30);
}

void draw() {
  background(200);
  numCircles = 250;
  while ( numCircles > 0 ) {
    noStroke();
    gradientColor = map(numCircles, 0, 250, 0, 255);
    fill(gradientColor);
    ellipse(width/2, height/2, numCircles*2, numCircles*2);
    numCircles-=1;
  }

  fill(255);
  ellipse(x, y, 50, 50);
  //here we check if it has gone too far
  if (x >= 475) {
    reverseX = true;
  } 
  else if ( x <= 25) {
    reverseX = false;
  }
  if (y >= 475) {
    reverseY = true;
  } 
  else if ( y <= 25) {
    reverseY = false;
  }


  //here we see what direction to go
  if (reverseX) {
    x-=4;
  }
  else {
    x+=4;
  }
  if (reverseY) {
    y-=5;
  }
  else {
    y+=5;
  }
}
