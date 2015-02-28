
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer song;

int Columns = 6;
int Rows = 4;
int RowIndex;
int ColumnIndex;
int Radius;
int AngleInDegrees = 360;
float AngleInRadians;
int ColorChange = 1;
float X;
float Y;


void setup()
{
  size(600, 600);
  maxim = new Maxim(this);
  song = maxim.loadFile("mykbeat.wav");
  song.setLooping(true);

  song.setAnalysing(true);

  background(255);
  frameRate(20);
  smooth();
}

void draw()
{
  
   song.play();
  Radius = int(random(30, 100));
  //Get the angle in Radians of the hypotenuse from the center of the circle
  AngleInRadians = radians(AngleInDegrees);
  // Get the X and Y Co-ordinates of the line from the center using trignometry
  X = sin(radians(random(0, 360))-radians(AngleInDegrees))*Radius;
  Y = cos(radians(random(0, 360))-radians(AngleInDegrees))*Radius;

  // Repeat for each row
  for (RowIndex=0;RowIndex<=Rows;RowIndex++) {

    for (ColumnIndex=0;ColumnIndex<=Columns;ColumnIndex++) {

      float power  = song.getAveragePower();

      // Calculate the Alpha for the line stroke
      float Alpha = map(power, 0, 1, 80, 255);
      // Set the frame rate based on the fftAverage
      frameRate(map(power, 0, 1, 1, 20));

      // Select the Color 
      switch(ColorChange) {
      case 1:
        stroke(map(AngleInRadians, 0, 6, 20, 100), 0, 0, Alpha); // RED
        break;
      case 2:
        stroke(0, map(AngleInRadians, 0, 6, 20, 100), 0, Alpha); //GREEN
        break;
      case 3:
        stroke(0, 0, map(AngleInRadians, 0, 6, 20, 100), Alpha); //BLUE
        break;
      case 4:
        stroke(0, Alpha); //WHITE
        break;
      default:
        break;
      }

      line((int)ColumnIndex*width/Columns, (int)RowIndex*height/Rows, (int)ColumnIndex*width/Columns-X, (int)RowIndex*height/Rows-Y);
    }
  }

  // Set the angle you want the line to increment
  AngleInDegrees -= random(0, 360);

  if (AngleInDegrees < 0 ) {

    noStroke();
    fill(255, 40); // Set the opacity for the next frame
    rect(0, 0, width, height);
    AngleInDegrees = 360;
  }
  //noLoop();
}



void mousePressed()
{
  // Change the color of the graphic
  ColorChange ++;

  if (ColorChange > 4) {
    ColorChange = 1;
  }
}




