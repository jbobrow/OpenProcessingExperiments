
// Homework #12 48-527
// Humaira Tasnim htasnim Copyright 2012

float [] arr = {146, 102, 402.1, 98.9, 258.1, 185.6, 243.3, 235.6, 157.7, 185.9,
183.9, 100.6, 140.5, 132.7, 200.3, 155, 269.4, 110.3, 278, 87.6, 126.7, 639.5, 128.9, 117.1, 105};

String [] states = {"AL", "AZ", "CA", "CO", "FL", "GA", "IL", "IN", "KY", "LA", "MI",
"MN", "MO", "NJ", "NY", "NC", "OH", "OK", "PA", "SC", "TN", "TX", "VA", "WV", "WI"};

color c1, c2, c3;

float leftEdge, rightEdge, topEdge, bottomEdge; 
float minValue, maxValue; 

PImage bg;

void setup()
{
  size (600, 400);
  background (200);
  noStroke();
  smooth();
  
  leftEdge = 20; 
  rightEdge = width - 20; 
  topEdge = 20;
  bottomEdge = height - 20; 
  
  minValue = min(arr); 
  maxValue = max(arr);
  
  bg = loadImage("co2.jpg");
  
  c1 = #FF0000;
  c2 = #F7762A;
  c3 = #F2C302;
}
 
void draw()
{
  prepScreen();
  drawGraph();
  showTitle();
  showLegend();
}

// Background image
void prepScreen()
{
  image (bg, 0, 0, width, height);
}

// x-axis: States in alphabetical order
// y-axis: Amount of CO2 emitted in 2007
void drawGraph()
{
  for (int i = 0; i < arr.length; i++)
  {
    float x = map(i, 0, arr.length, leftEdge, rightEdge);
    float y = map(arr[i], maxValue, minValue, topEdge, bottomEdge);
    
    if (arr[i] > calculateAvg(arr) && arr[i] > 500)
    {
      fill(c1, 170);
      ellipse(x, y, 70, 70); 
    }
    else if (arr[i] > calculateAvg(arr) && arr[i] < 500)
    {
      fill(c2, 170);
      ellipse(x, y, 50, 50);      
    }
    else
    {
      fill(c3, 170);
      ellipse(x, y, 40, 40);
    }
    
    fill(255);
    textSize(12);
    text(states[i], x-8, y);
    
    if (keyPressed)
    {
      fill(0);
      String qty = nfc(arr[i], 1);
      textSize(8);
      text(qty, x-9, y+15);
    }
  }
}

float calculateAvg(float [] a)
{
  float sum = 0;
  for (int i = 0; i < a.length; i++)
  {
    sum += a[i];
  }
  float avg = 0;
  avg = sum/a.length;
  return avg;
}

// Title
void showTitle()
{
  fill(0);
  rect(230, 90, 480, 85);
  fill(255);
  textSize(24);
  text("Top 25 states with highest", 250, 120);
  text("CO2 emissions in 2007", 250, 160);
}

// Bars to show what the different colors represent
void showLegend()
{
  fill(c1, 170);
  rect(0, 5, 230, 20);
  legendText(230, 5, 20, c1);
  
  fill(c2, 170);
  rect (0, 30, 230, 20);
  legendText(230, 30, 20, c2);

  fill(c3, 170);
  rect (0, 55, 230, 20);
  legendText(230, 55, 20, c3);
}

// Mouse hover over bars
void legendText(int x, int yLow, int yHigh, color c)
{
  if (mouseX < x && mouseY >= yLow && mouseY <= yLow+yHigh)
  {
    fill(c);
    rect (0, yLow, x, yHigh);
    
    fill(0);
    rect (8+x, yLow, 108, yHigh);
    
    fill(255);
    textSize(14);
    if (c == #FF0000)
    {
      text ("Highest emitter", x+10, yLow+yHigh-5);
    }
    else if (c == #F7762A)
    {
      text ("Above average", x+10, yLow+yHigh-5);
    }
    else if (c == #F2C302)
    {
      text ("Below average", x+10, yLow+yHigh-5);
    }
  }
}

