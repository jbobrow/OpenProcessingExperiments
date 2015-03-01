
/*
File Name: boxCar
Author: Dylan Martin
This program draws a car that drives around a track, and it
reports information about the loaction, speed, and distance traveled.
*/
int carX = 250;
int carY = 50;
int dimX = 50;
int dimY = 25;
int moveCounter = 1;
int lapCounter = 0;
int stop = 0;
int speedOne = 1;
int speedTwo = 0;
int speedThree = 0;
int pixelCounter = 0;

void setup()
{
 size(500, 500);
}

void draw()
{
 background(80, 234, 135);  // can be a different background color

 displayLapMarker(250, 25, 0);

 displayTrack(450, 50, 0, 0, 0, 0);

 displayBoxCar();

 displayCarSpeed(250, 250, 18, 0);

 //displayCarPosition(250, 270, 18, 0);

 displayLapCount(250, 310, 18, 0);

 //displayLapPixels(250, 330, 18, 0, 0);

 displayTotalPixels(250, 350, 18, 0, 0);
 


}



void displayTrack(int x, int y, int w, int h, int trackWidth, color c)
{


  
 stroke(240,219,50);
 noFill();

 beginShape();
 vertex(y, y);
 vertex(y, x);
 vertex(x, x);
 vertex(x, y);
 endShape(CLOSE);
}

void displayCarPosition(int x, int y, int tSize, color c)
{
 textAlign(CENTER);
 textSize(tSize);
 text("Car X Position = " + carX, x, y);
 text("Car Y Position = " + carY, x, y+20);
}

void displayLapCount(int x, int y, int tSize, color c)
{
 textAlign(CENTER);
 textSize(tSize);
 text("Lap Count = " + lapCounter, x, y);
 if (carX == 250 && carY == 50)
 {
   lapCounter++;
 }
 println(lapCounter);
}

void displayLapMarker(int x, int y, color c)
{

 strokeWeight(3);
 stroke(21, 197, 297);
 line(x, y, x, y + 50);
}

void displayBoxCar()
{


  stroke(10);
  

  rectMode(CENTER);
  
  if (moveCounter == 1)
  {
    fill(239,12,41);
    rect(carX-10, carY, dimX, dimY/2);
    fill(10);
    rect(carX-10, carY, dimX/5, dimY+7);
    rect(carX+10, carY, dimX/5, dimY+7);
  }
  
  if (moveCounter == 3)
  {
    fill(239,12,41);
    rect(carX+10, carY, dimX, dimY/2);
    fill(10);
    rect(carX-10, carY, dimX/5, dimY+7);
    rect(carX+10, carY, dimX/5, dimY+7);
  }
  
   if (moveCounter == 2)
  {
    fill(239,12,41);
    rect(carX, carY+10, dimX/2, dimY);
    fill(10);
    rect(carX, carY-10, dimX+8, dimY/5);
    rect(carX, carY+10, dimX+8, dimY/5);
  }
  
   if (moveCounter == 4)
  {
    fill(239,12,41);
    rect(carX, carY-10, dimX/2, dimY);
    fill(10);
    rect(carX, carY-10, dimX+8, dimY/5);
    rect(carX, carY+10, dimX+8, dimY/5);
  }
  
  fill(75);
  rect(carX, carY, dimX, dimY);
  moveCar();
}

void moveCar()
{




 if (speedOne == 1)              // speed 1
 {
   pixelCounter++;



   if ( moveCounter == 1)
   {
     carX--;
   }

   if ( carX == 50 && carY == 50)
   {
     moveCounter++;
   }

   if (moveCounter == 2)
   {
     dimX = 25;
     dimY = 50;
     carY++;
   }

   if ( carX == 50 && carY == 450)
   {
     moveCounter++;
   }
   if (moveCounter == 3)
   {
     dimX = 50;
     dimY = 25;
     carX++;
   }

   if ( carX == 450 && carY == 450)
   {
     moveCounter++;
   }

   if (moveCounter == 4)
   {
     dimX = 25;
     dimY = 50;
     carY--;
   }

   if ( carX == 450 && carY == 50)
   {
     dimX = 50;
     dimY = 25;
     moveCounter = 1;
   }
 }

 if (speedTwo == 1)                      // speed 2
 {
   pixelCounter = pixelCounter+2;

   if ( moveCounter == 1)
   {
     carX--;
     carX--;
   }

   if ( carX == 50 && carY == 50 )
   {
     moveCounter++;
   }

   if ( carX == 49 && carY == 50 )
   {
     moveCounter++;
     carX++;
   }
 


   if (moveCounter == 2)
   {
     dimX = 25;
     dimY = 50;
     carY++;
     carY++;
   }

   if ( carX == 50 && carY == 450)
   {
     moveCounter++;
   }

   if ( carX == 50 && carY == 449)
   {
     moveCounter++;
     carY++;
   }

   if (moveCounter == 3)
   {
     dimX = 50;
     dimY = 25;
     carX++;
     carX++;
   }

   if ( carX == 450 && carY == 450)
   {
     moveCounter++;
   }

   if ( carX == 449 && carY == 450)
   {
     moveCounter++;
     carX++;
   }

   if (moveCounter == 4)
   {
     dimX = 25;
     dimY = 50;
     carY--;
     carY--;
   }

   if ( carX == 450 && carY == 50)
   {
     dimX = 50;
     dimY = 25;
     moveCounter = 1;
   }

   if ( carX == 450 && carY == 49)
   {
     dimX = 50;
     dimY = 25;
     carY--;
     moveCounter = 1;
   }
 }
}





void displayLapPixels(int x, int y, int tSize, color c, int dst)
{
 textAlign(CENTER);
 textSize(18);
 text("Lap Pixels Travelled = " + 1600*lapCounter, x, y);
}

void displayTotalPixels(int x, int y, int tSize, color c, int tdst)
{
 textAlign(CENTER);
 textSize(18);
 text("Total Pixels Travelled = " + pixelCounter, x, y);
}

void displayCarSpeed(int x, int y, int tSize, color c)
{
 textAlign(CENTER);
 textSize(tSize);
 fill(0);

 if (key == '0')
 {
   text("Car Speed = " + 0, x, y);
 }
 else if (key == '1')
 {
   text("Car Speed = " + 1, x, y);
 }
 else if (key == '2') {
   text("Car Speed = " + 2, x, y);
   }
 else
 {
   text("Car Speed = " +1, x, y);
 }
}





void keyPressed()
{
 if (key == '0')
 {
   speedOne = 0;
   speedTwo = 0;
 }

 if (key == '1')
 {
   speedTwo = 0;
   speedOne = 1;
 }

 if (key == '2')
 {
   speedOne = 0;
   speedTwo = 1;
 }

}


