
int myArray[];
int nElements = 100;
float opacity = 255;
boolean drawNow;

color[]  airRowsColors = {
  #D0D0B9, #E1E1CC, #ECECDA, #F5F5F1, #FCFCF9, #F1F1F1
};

color[] fireRowsColors = {
  #B03737, #900000, #B42E2E, #FF4A4A, #972623, #E44141
};

void setup()
{
  size(400, 400);
  smooth(); 

  int colNum = (int)random(1, 6);
  fill(fireRowsColors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height);
  textSize(100);
  
  drawNow = true;

}

void draw()
{
  if(drawNow)
  {
    randomNum();
    testNum();
    drawNow = false;
  }
}

void randomNum()
{
  int colNum = (int)random(1, 6);
  fill(fireRowsColors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height); 
  myArray = new int[nElements];
  for (int i=0; i < nElements; i++)
  {
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
  }
}

void testNum()
{
 for (int i=0; i < nElements; i++)
  {
    if (myArray[i] >= 96)
    {
      int colNumText = (int)random(1, 6);
      fill(airRowsColors[colNumText], opacity);
      noStroke();
      text(myArray[i], width/2-40, height/2+40);
      break;
    }
  } 
}

void keyPressed()
{ 
  drawNow = true;
}

void mousePressed()
{ 
  drawNow = true;
}
