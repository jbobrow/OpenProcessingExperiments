
/*
 Edgar Michel 
 February 27, 2012
 */


void setup()
{
  size(500, 500);
  smooth();
  background(255);
}

void draw()
{
  hours();
  minutes();
  seconds();
  cCircle(); // Makes Center Circle
  //time();
}

void hours()
{ 
  float mainAng = 15;
  float angle = 0;
  float XdiamCircleA = width / 2; 
  float YdiamCircleA = height / 2;
  ellipseMode(RADIUS); //Works with circles with radius instead of diameters
  stroke(255); //the strike is white
  fill(#242424); // Fills circles dark blue
  ellipse(width/2, height/2, XdiamCircleA, YdiamCircleA); //Makes outer circle

  ellipseMode(DIAMETER);
  fill(255);
  int hr = 1;
  float m = 2;
  float fdeg = radians(mainAng);
  float angleHr = radians(270);
  while (hour () > hr) //
  {
    fill(255);
    stroke(1);
    arc(width / 2, height / 2, width, height, angleHr, angleHr + fdeg*m);
    hr = hr + 1;
    m = m + 1;
  }
  fill(0);
  while (angle < radians (345)) //will repeat line to make 24 sections on top circle
  {
    stroke(0);
    line( (width / 2) + (3 * width / 10) * (cos(angle)),
    (height / 2) + (3 * height / 10) * (sin (angle)),
    (width / 2) + (width / 2) * (cos(angle)), 
    (height / 2) + (height / 2) * (sin (angle)));
    angle = angle + radians(mainAng);
  }
}


void minutes()
{
  float mainAng = 6;
  float angle = 0;
  float minutes = 0;
  float fdeg = radians(mainAng);
  float angleMin = radians(270);
  float m = 1; // multiplier for the next angle
  float diamCircleB = 3 * width / 5;
  ellipseMode(DIAMETER);
  fill(#242424);
  stroke(2);
  ellipse(width/2, height/2, diamCircleB, diamCircleB); //Makes 3rd circle from center
  ellipseMode(DIAMETER);
  while (minute () > minutes)
  {
    fill(255);
    stroke(6);
    arc(width / 2, height / 2, 3 * width / 5, 3 * height / 5, angleMin, angleMin + fdeg * m );
    minutes = minutes + 1;
    m = m + 1;
  }
  fill(0);
  while (angle < radians (354)) //will repeat line to make 60 sections on minutes circle
  {
    stroke(0);
    line( (width / 2) + (width / 5) * (cos(angle)),
    (height / 2) + (height / 5) * (sin (angle)),
    (width / 2) + (3 * width / 10)  * (cos(angle)), 
    (height / 2) + (3 * height / 10) * (sin (angle)));
    angle = angle + radians(mainAng);
  }
} 


void seconds()
{
  float mainAng = 6;
  float angle = 0;
  float seconds = 0;
  float fdeg = radians(mainAng);
  float angleSec = radians(270);
  float m = 1; // multiplier for the next angle
  ellipseMode(DIAMETER);
  float XdiamCircleC = 2 * width / 5;
  float YdiamCircleC = 2 * height / 5;
  fill(#242424);
  ellipse(width/2, height/2, XdiamCircleC, YdiamCircleC); //Makes second circle from center

  ellipseMode(DIAMETER);
  while (second () > seconds)
  {
    fill(255);
    stroke(3);
    arc(width / 2, height / 2, 2 * width / 5, 2 * height / 5, angleSec, angleSec + fdeg * m );
    seconds = seconds + 1;
    m = m + 1;
  }
  fill(0);
  while (angle < radians (354)) //will repeat line to make 60 sections on minutes circle
  {
    stroke(3);
    line( (width / 2) + (width / 10) * (cos(angle)),
    (height / 2) + (height / 10) * (sin (angle)),
    (width / 2) + (width / 5)  * (cos(angle)), 
    (height / 2) + (height / 5) * (sin (angle)));
    angle = angle + fdeg;
  }
}

void cCircle()
{
  float XdiamCircleD = width / 5;
  float YdiamDircleD = height / 5;
  ellipseMode(DIAMETER);
  fill(#242424);
  ellipse(width/2, height/2, XdiamCircleD, XdiamCircleD); //Makes center circle
}

