
int squares = 100, count;
float[] wVals = new float[squares];
float[] hVals = new float[squares];
float[] xVals = new float[squares];
float[] yVals = new float[squares];
float inc = 0;

void setup()  {
  size(801,801);
  smooth();
  loop();
}

void draw()  {
hVals[0] = height;
wVals[0] = width;
float mapX = map(mouseX, 0, width, 0, 1);
float mapY = map(mouseY, 0, height, 0, 1);
  keyPressed();
  for(count=1;count<squares;count++)  {
    wVals[count] = wVals[count-1]/(1.2-inc);
    hVals[count] = hVals[count-1]/(1.2-inc);
    
    xVals[count] = (wVals[count-1] - wVals[count])*mapX + xVals[count-1];
    yVals[count] = (wVals[count-1] - wVals[count])*mapY + yVals[count-1];
  }
  for(count=0;count<squares;count++)  {
    rect(xVals[count],yVals[count],wVals[count],hVals[count]);
  }
  
}


