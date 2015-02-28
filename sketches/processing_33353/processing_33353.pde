
//http://processing.org/learning/basics/sinecosine.html 
int ang1Deg = 45;
int ang2Deg = 225; 
float whiteCircleX1 = 0; 
float whiteCircleX2 = 0; 
float grayCircleY1 = 0; 
float grayCircleY2 = 0;
int amplitude = 40;

void setup() 
{
  size(200, 200);
  noStroke();
  smooth();
}

void draw() 
{
  background(0);
  
  fill(51);
  rect(60, 60, 80, 80);

  fill(255);
  ellipse(whiteCircleX1, 36, 32, 32);
  ellipse(whiteCircleX2, 164, 32, 32);

  fill(153);
  ellipse(36, grayCircleY1, 32, 32);
  ellipse(164, grayCircleY2, 32, 32);

  ang1Deg += 3;
  ang2Deg -= 3;

  if(ang1Deg > 405) {
    ang1Deg = 45;
    ang2Deg = 225;
  }

  float ang1 = radians(ang1Deg); // convert degrees to radians
  float ang2 = radians(ang2Deg); // convert degrees to radians
  whiteCircleX1 = width/2 + (amplitude * sin(ang1));
  whiteCircleX2 = width/2 + (amplitude * cos(ang1));

  grayCircleY1 = height/2 + (amplitude * sin(ang1));
  grayCircleY2 = height/2 + (amplitude * cos(ang1));
}

