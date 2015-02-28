
//mattholl.co.uk

int x = 0;
int y = 0;
int rad = 50;
int numRings = 10;
int numSegments = 10;

int centredX = 0;
int centredY = 0;

void setup() {
  size(600,600);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  
  //clear canvas each time through draw
  background(255);
  
  //use mouse position to set the number of rings and number of circles in
  //the rings -- change mouseX + mouseY vals so that they are greatest in centre
  centredX = mouseX;
  if(mouseX > (width/2)) {
    int differenceX = mouseX-(width/2);
    centredX = (width/2) - differenceX;
  }
  
  centredY = mouseY;
  if(mouseY > (height/2)) {
    int differenceY = mouseY-(height/2);
    centredY = (height/2) - differenceY;
  }
  
  //map mouse position values onto scale from 0 to 10

  numRings = int(map(centredX, 0, (width/2), 1, 10));
  numSegments = int(map(centredY, 0, (width/2), 1, 10));
  
  //centre the canvas
  translate(width/2, height/2);

  //number of rings of ellipses to calculate
  for(int i = 1; i <= numRings; i++) {

    //increase the number of dots for each ring
    int segments = numSegments * i;

    //Check if segments is odd
    //change to even as 360degees won't divide into it
    if(segments%2 == 1) {
      segments = segments++;
    }

    //vary colour on each pass through draw
    float fillVal = abs(map(segments, 0, numSegments*numRings, 50, 255));
    fill(fillVal);

    float angle = radians(0.0);
    float segmentDegrees = 360.0/segments;
    float angleIncrement =  radians(segmentDegrees);
    
    float distance = rad * (i);
    int circleRad = rad/i;
    
    //draw the circles
    for(float j = 0; j <= segments; j++) {
      float xCoord = distance * cos(angle);
      float yCoord = distance * sin(angle);
      ellipse(xCoord, yCoord, circleRad, circleRad);
      angle += angleIncrement;
    }
  }
}


