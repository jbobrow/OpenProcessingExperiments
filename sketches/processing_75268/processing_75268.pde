
float circleFill[] = new float[5];
PVector [] circleCenter = new PVector[5];
int nElements = 5;
float opacity = 25;

float circleDiameter = 110;
float circleRadius = circleDiameter/2;
float xOffset = 70;
float xSpace = 10;
float yOffset = 120;
float ySpace = 10;

color[]  airRowsColors = {
  #D0D0B9, #E1E1CC, #ECECDA, #F5F5F1, #FCFCF9, #F1F1F1
};

color[] fireRowsColors = {
  #B03737, #900000, #B42E2E, #FF4A4A, #972623, #E44141
};

void setup()
{
  size(620, 150);
  smooth(); 

  int colNum = (int)random(1, 6);
  fill(fireRowsColors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height);
  textSize(100);

  for (int i = 0; i < circleCenter.length; i++)
  {
     circleFill[i] = random(255);
     circleCenter[i] = new PVector((xOffset + (xSpace + circleDiameter) * i), ySpace + yOffset/2);
  }
}

void draw()
{
  int colNum = (int)random(1, 6);
  fill(fireRowsColors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height); 
  stroke(2);
  for (int i = 0; i < circleCenter.length; i++)
  {
    drawCircle(i);
    updateCircleFill(i);
  }
}

void updateCircleFill(int i)
{
  circleFill[i] = circleFill[i] + 1;
  if(circleFill[i] >= 255)
  {
    circleFill[i] = 0;
  }
}

void drawCircle(int i)
{
  int col =  (int) circleFill[i];
  fill(col);
    ellipse(circleCenter[i].x, circleCenter[i].y, circleDiameter, circleDiameter);
}

void keyPressed()
{ 
  
}

void mousePressed()
{ 
  
}
