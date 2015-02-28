
float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71, 
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81, 
  102.98, 103.57, 104.17
};

PVector [] barCenter = new PVector[scores.length];
color barFill[] = new color[scores.length];

float opacity = 25;

float barMaxHeight = 210;
float barWidth = 20;
float xOffset = 20;
float xSpace = 10;
float yOffset = 430;
float ySpace = 10;

color[]  airRowsColors = {
  #D0D0B9, #E1E1CC, #ECECDA, #F5F5F1, #FCFCF9, #F1F1F1
};

color[]  seaRowsColors = {
  #7cc0ce, #57aec0, #45a5b8, #69b7c7, #8fc9d5, #5fb2c3
};

color[] fireRowsColors = {
    #B03737, #900000, #B42E2E, #FF4A4A, #972623, #E44141
  };

color[] landRowsColors = {
    #33CC99, #66FFCC, #00FF99, #33CC66, #009966, #33FFCC
  };

void setup()
{
  size(600, 230);
  smooth(); 

  int colNum = (int)random(1, 6);
  fill(seaRowsColors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height);
  textSize(20);

  for (int i = 0; i < scores.length; i++)
  {
    int colNumBar = (int)random(1, 6);
    barFill[i] = seaRowsColors[colNumBar];
    barCenter[i] = new PVector((xOffset + (xSpace + barWidth) * i), ySpace + yOffset/2);
  }
}

void draw()
{
  int colNum = (int)random(1, 6);
  fill(airRowsColors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height); 
  //stroke(2);
  for (int i = 0; i < scores.length; i++)
  {
    drawBar(i);
  }
  strokeWeight(2);
  stroke(fireRowsColors[colNum], 255);
  line(xOffset, average(), width - xOffset, average());
  fill(landRowsColors[3]);
  text(average(), 15, 30);
}

void drawBar(int i)
{
  fill(barFill[i]);
  rect(barCenter[i].x, ySpace + yOffset/2, barWidth, -barMaxHeight * (scores[i]/110));
}

float average()
{
  float testTotal = 0;
  for (int i = 0; i < scores.length; i++)
  {
    testTotal += scores[i];
  }
  return testTotal / scores.length;
}
