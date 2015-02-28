
float[][] startPoints;
float squareSize;
float circleWidth;
float circleHeight;


void setup() {

  frameRate(7);
  size(300,500);
  stroke(0);

  for(int i = 0; i < 3; i++ ) {
    for(int j = 0; j < 2; j++ ) {
    }
  }
} 

void draw() {

  background(random(255),random(255),random(255));
 
 
  startPoints = new float[][] {  
    {
      random(width), random(height)
      }
      ,
    {
      random(width), random(height)
      }
      ,
    {
      random(width), random(height)
      }
    };

    //orange
    for (int r=0; r<startPoints.length; r++) {
      squareSize = random(250);
      strokeWeight(3);
      fill(255,127,0);
      rect(startPoints[r][0], startPoints[r][1], squareSize, squareSize);

      strokeWeight(1);
      line(startPoints[r][0], startPoints[r][1], startPoints[r][0]+squareSize, startPoints[r][1]+squareSize);
      line(startPoints[r][0], startPoints[r][1]+squareSize, startPoints[r][0]+squareSize, startPoints[r][1]);
      noFill();
      arc(startPoints[r][0], startPoints[r][1], squareSize, squareSize, 0, PI/2);
      arc(startPoints[r][0]+squareSize, startPoints[r][1]+squareSize, squareSize, squareSize, PI, 1.5 * PI);
    }

  //yellow
  for (int r=0; r<startPoints.length; r++) {
    squareSize = random(250);
    strokeWeight(3);
    fill(255,204,0);
    rect(startPoints[r][0], startPoints[r][1], squareSize, squareSize);


    strokeWeight(1);
    line(startPoints[r][0], startPoints[r][1], startPoints[r][0]+squareSize, startPoints[r][1]+squareSize);
    line(startPoints[r][0], startPoints[r][1]+squareSize, startPoints[r][0]+squareSize, startPoints[r][1]);
    noFill();
    arc(startPoints[r][0], startPoints[r][1], squareSize, squareSize, 0, PI/2);
    arc(startPoints[r][0]+squareSize, startPoints[r][1]+squareSize, squareSize, squareSize, PI, 1.5 * PI);
  }

  //green
  for (int r=0; r<startPoints.length; r++) {
    squareSize = random(250);
    strokeWeight(3);
    fill(0,102,51);
    rect(startPoints[r][0], startPoints[r][1], squareSize, squareSize);

    strokeWeight(1);
    line(startPoints[r][0], startPoints[r][1], startPoints[r][0]+squareSize, startPoints[r][1]+squareSize);
    line(startPoints[r][0], startPoints[r][1]+squareSize, startPoints[r][0]+squareSize, startPoints[r][1]);
    noFill();
    arc(startPoints[r][0], startPoints[r][1], squareSize, squareSize, 0, PI/2);
    arc(startPoints[r][0]+squareSize, startPoints[r][1]+squareSize, squareSize, squareSize, PI, 1.5 * PI);
  }

  //purp
  for (int r=0; r<startPoints.length; r++) {
    squareSize = random(250);
    strokeWeight(5);
    fill(51,0,51);
    rect(startPoints[r][0], startPoints[r][1], squareSize, squareSize);
    
    strokeWeight(1);
    line(startPoints[r][0], startPoints[r][1], startPoints[r][0]+squareSize, startPoints[r][1]+squareSize);
    line(startPoints[r][0], startPoints[r][1]+squareSize, startPoints[r][0]+squareSize, startPoints[r][1]);
    noFill();
    arc(startPoints[r][0], startPoints[r][1], squareSize, squareSize, 0, PI/2);
    arc(startPoints[r][0]+squareSize, startPoints[r][1]+squareSize, squareSize, squareSize, PI, 1.5 * PI);
  }
  
  
    //circle
  int mySecond = second();
  float circPositionX = map(mySecond, 0, 59, 0, width);
  float circPositionY = map(mySecond, 0, 59, height, 0);
  float circAlpha = map(mySecond, 0, 59, 255, 0);
  
  fill(random(255),random(255),random(255),circAlpha); 
  stroke(random(255),random(255),random(255));
  ellipse(circPositionX,circPositionY,250,250);

}


