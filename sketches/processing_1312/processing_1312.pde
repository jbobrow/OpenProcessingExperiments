
import krister.Ess.*;

FFT fft;
AudioInput ai;

int bufferSize = 512;
int numAverages = 4; 
float avgsArray;
float maxAvg;
float angle;
float x2;
float y2;
int drawMode = 1;

void setup() 
{
  size(600, 600);
  smooth();
  background(0);
  Ess.start(this);
  frameRate(30);



  ai = new AudioInput(bufferSize);

  fft = new FFT(bufferSize * 2);
  fft.averages(numAverages);
  fft.limits();
  fft.equalizer(true);

  ai.start();


}

void draw() 
{  
  switch(drawMode)
  {
  case 1:
    draw1();
    break;
  case 2:
    draw2();
    break;
  case 3:
    draw3();
    break;
  case 4:
    draw4();
    break;
  case 5:
    draw5();
    break;
  }

}

void keyPressed()
{
  switch(key)
  {
  case '1':
    drawMode = 1;
    break;
  case '2':
    drawMode = 2;
    break;
  case '3':
    drawMode = 3;
    break;
  case '4':
    drawMode = 4;
    break;
  case '5':
    drawMode = 5;
    break;
  }


}


void draw1()
{
  fill(0);
  rect( 0, 0, width, height); 
  //RGB for different effect
  colorMode(HSB, 300, 300, 300, 300);


  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      for(int k = 0; k < numAverages; k++)
        avgsArray = fft.averages[k]*512;
      stroke(avgsArray,avgsArray+x, avgsArray+x, avgsArray);
      point(x,y);
    }

  }

}


void draw2()
{
  fill(0);
  rect( 0, 0, width, height); 
  //  colorMode(RGB, 200, 200, 200);

  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      for(int k = 0; k < numAverages; k++)

        avgsArray = fft.averages[k]*512;
      stroke(avgsArray*3,random(255-avgsArray)+avgsArray, random(255-avgsArray));
      point(x,y);
    }

  }
}


void draw3()
{
  fill(0);
  rect( 0, 0, width, height); 
  colorMode(HSB, 300, 300, 300, 300);


  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      for(int k = 0; k < numAverages; k++)


        avgsArray = fft.averages[k]*512;
      stroke(avgsArray*2,avgsArray*2, avgsArray*2, avgsArray);
      angle = radians(avgsArray);

      x2 =  (cos(angle) * (width/8)) + width/2;
      y2 =  (sin(angle) * (height/6)) + height/2;
      point(x-x2,y-y2);
      point(x+x2,y+y2);
      point(x-x2,y+y2);
      point(x+x2,y-y2);
    }

  }

}

void draw4()
{
  fill(0);
  rect( 0, 0, width, height); 
  colorMode(HSB, 300, 300, 300, 300);


  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      for(int k = 0; k < numAverages; k++)
        avgsArray = fft.averages[k]*512;
      stroke(avgsArray,avgsArray+x, avgsArray+x, avgsArray);
      angle = radians(avgsArray);

      x2 =  (cos(angle) * (width/8)) + width/2;
      y2 =  (sin(angle) * (height/6)) + height/2;
      point(x-x2,y-y2);
      point(x+x2,y+y2);
      point(x-x2,y+y2);
      point(x+x2,y-y2);
    }

  }

}

void draw5()
{

  fill(0);
  rect( 0, 0, width, height); 
  colorMode(HSB, 300, 300, 300, 300);

  for(int k = 0; k < numAverages; k++)
  {

    for(int x = 0; x < width; x++)
    {
      for(int y = 0; y < height; y++)
      {
        avgsArray = fft.averages[k]*512;          
        stroke(avgsArray, avgsArray*3, avgsArray*2, avgsArray);
        point(x,y);

      }
    }

  }
}



void stop()
{
  Ess.stop();
  super.stop();
}

public void audioInputData(AudioInput theInput)
{
  fft.getSpectrum(ai);
}


