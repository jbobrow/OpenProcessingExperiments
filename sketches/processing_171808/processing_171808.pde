

void setup() 
{
  size(500, 500);
  background(255);
}

void draw () 
{
  background (0);
  noFill();

  float mappedSeconds = map(second(), 0, 60, 0, 2*PI);
  float mappedMinutes = map(minute(), 0, 60, 0, 2*PI);
  float mappedHours = map(hour(), 0, 12, 0, 2*PI);


  //HOURS

  pushMatrix();
  strokeWeight(6);
  
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(mappedHours);
  stroke(255);
  line(0, -110, 0, 0);
  popMatrix();


  //MINUTES

  pushMatrix();
  stroke(255);
  strokeWeight(4);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(mappedMinutes);
  line(0, -170, 0, 0);
  popMatrix();

  //SECONDS

  pushMatrix();
  strokeWeight(2);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(mappedSeconds);
  stroke(200, 39, 50);
  line(0, -180, 0, 0);
  popMatrix();


  //CIRCLE

  pushMatrix();
  noFill();
  stroke(100,100,100);
  ellipse(width/2, height/2, 400, 400);
  translate(120, 100);
  popMatrix();
}

