
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;

void setup()
{
  maxim = new Maxim(this);
  player = maxim.loadFile("ominous.wav");
  player.setLooping(true);
  player.volume(.25);
  size (640,640); 
}

void draw()
{
// code that happens every frame
}

void mouseDragged()
{
  player.play();  
  // Set plot color
  int red, green, blue;
  
  // Plot variables of sin wave
  int plotY, prevPlotY;
  int plotX, prevPlotX;
  
  // Variables of sin wave
  float angleRad;  // Value in radians

  // PeriodRate define how compressed is the sin wave: 0 = flat
  float minPeriodRate = 0.;
  float maxPeriodRate = 2.;
  float PeriodRate;
  
  // Amplitude is the "height" of wave
  int   SinAmplitude; 
  
  int   plotHeight;
  int   plotWidth;

  // Set Sinusoid Amplitude
  SinAmplitude = height;

  // clear screen before plot a new sin wave


  // define fill collor
  red = int(map(pmouseX, 0, width, 128, 255));
  green = int(map(mouseX, 0, width, 0, 255));
  blue = int(map(width-mouseY, 0, height, 0, 128));

//  background(255-red, 255-green, 255-blue);

  int randX=int(random(width));
  int randY=int(random(height));
  noStroke();
  fill(255*randX/width, random(255), 255*randY/height, random(255));
  ellipse(randX, randY, random(1,5), random(1,5));

  fill(red, green, blue); 
  stroke(red, green, blue); 

  
  prevPlotY=0;
  prevPlotX=0;
  for (int i = 0; i < width; i = i+1) {
    // Set angleRad proportional to screen width: left edge = 0 degrees, right edge = 360 degrees
    angleRad = map(i-mouseX, 0, width, 0, radians(360));
    // Set PeriodRate proportional to distance of mouse to left edge
    PeriodRate = map(mouseX-(width/2),0,width/3,minPeriodRate,maxPeriodRate);
    plotY = int(map(sin(PeriodRate*angleRad), -1, 1, mouseY-int(SinAmplitude/2), mouseY+int(SinAmplitude/2)));
    plotX = i;
    if ((prevPlotX == 0) && (prevPlotY == 0)){
      prevPlotX = plotX;
      prevPlotY = plotY;
    }
    brush(prevPlotX, prevPlotY, plotX, plotY, 3);
    prevPlotX = plotX;
    prevPlotY = plotY;
  }

//  player.setFilter((float) mouseY/height*5000,mouseX / width);
  
//  player.ramp(1.,1000);
  player.speed((float) map(abs(mouseX-(width/2)),-128,128,.8,1.5));
}

void mouseReleased()
{
  //println("rel");
  player.ramp(1000,0.);

        
}

void brush(int prevX, int prevY, int X, int Y, int kindBrush) {

  switch (kindBrush) {
  case 1: // Ellipse
    noStroke();
    ellipse(X, Y, 10, 10);
    break;
  case 2: // Random Squares
    strokeWeight(1);
    pushMatrix();
    translate(X, Y);
    rotate(random(X));
      rect(0+random(5),0+random(5),10,10); 
    popMatrix();
    break;
  case 3:  // Random lines
    strokeWeight(5);
    pushMatrix();
    translate(X,Y);
    rotate(random(X));
    line(0+random(8),0+random(8),0,0);
    popMatrix();
  
    break;
  case 0:  
  default: // Line
    strokeWeight(5);
    line(prevX, prevY, X, Y);
    break;
  }
}

void mousePressed()
{

// code that happens when the mouse button
// is pressed
  player.cue(0);
  player.play();
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}



