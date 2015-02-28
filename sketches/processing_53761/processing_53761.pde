
PoppingCircle circleOne, circleTwo, circleThree, circleFour, circleFive;

void setup()
{
     randomSeed(70);
     size(1139, 598);                  
     background(255, 255, 188);          //The background is a pretty yellow color
     noStroke();                         //Strokes are ugly
     circleOne = new PoppingCircle(random(1139),random(598));
     circleTwo = new PoppingCircle(random(1139),random(598));
     circleThree = new PoppingCircle(random(1139),random(598));
     circleFour = new PoppingCircle(random(1139),random(598));
     circleFive = new PoppingCircle(random(1139),random(598));
}

void draw()
{
     fill(255, 255, 188,10);     //Get rid of the circle from the last frame
     rect(0, 0, 1600, 1200);
     circleOne.holding();
     circleTwo.holding();
     circleThree.holding();
     circleFour.holding();
     circleFive.holding();
     
     circleOne.changeColor();
     circleTwo.changeColor();
     circleThree.changeColor();
     circleFour.changeColor();
     circleFive.changeColor();
     
     circleOne.drawEllipse(); 
     circleTwo.drawEllipse(); 
     circleThree.drawEllipse(); 
     circleFour.drawEllipse();
     circleFive.drawEllipse();

}

class PoppingCircle
{
     float xpos;                    //This is the location of the circle.
     float ypos;                    //This is also that ^
     float maxRadius = 100.0;       //This is for drawing/popping the circle.
     float oldMaxRadius = 100.0;    //This is to detect change in radius.
     int colorCounter;              //This is used to cycle through the colors.

     int[]        hexR =               //These nine arrays hold the r, g, and b values for the respective circles.
     {
          150, 150, 150, 255, 100
     };
     int[]        hexG =
     {
          255, 150, 230, 150, 255
     };
     int[]        hexB =
     {
          150, 255, 255, 150, 230
     };
     
     PoppingCircle(float ixpos, float iypos)     // I guess this is a classes thing
     {
          xpos = ixpos;
          ypos = iypos;
     }

     void drawEllipse()     //This function draws the circles! if the circle is being grabbed, make it big, else, make it small.
     {
          if (int(sqrt((mouseX - xpos)*(mouseX - xpos) + (mouseY - ypos)*(mouseY - ypos))*2) < maxRadius && mousePressed)
          {
               fill(hexR[colorCounter], hexG[colorCounter], hexB[colorCounter], 150); 
               ellipse((xpos + mouseX)/2, (ypos + mouseY)/2, mouseDistance(), mouseDistance());
          }
          else
          {
               fill(hexR[colorCounter], hexG[colorCounter], hexB[colorCounter], 150); 
               ellipse(xpos, ypos, mouseDistance(), mouseDistance());
               }
          }

     void changeColor()      //This function changes the colors of the circles if they have just "popped" or been let go of
     {
          if (oldMaxRadius == 500 && maxRadius == 100) 
          { 
               colorCounter++;
          }
          if (colorCounter ==5)
          {
               colorCounter = 0;
          }
          oldMaxRadius = maxRadius;
     }
     
     void holding ()          // This function sets  the maximum radius of the first circle
     {
          if (int(sqrt((mouseX - xpos)*(mouseX - xpos) + (mouseY - ypos)*(mouseY - ypos))*2) < maxRadius && mousePressed)          //If the mouse is pressed, in the inside of the circle
               maxRadius = 500;                                                                                                    //Allow it to be stretched
          else                                                                                                                     //Else
          maxRadius = 100;                                                                                                         //Don't let it be stretched
     }

     int mouseDistance()     // This function returns a radius for the first circle, dependent on the max radius already set.
     {
          if (int(sqrt((mouseX - xpos)*(mouseX - xpos) + (mouseY - ypos)*(mouseY - ypos))*2) < maxRadius && mousePressed )          //If the circle is being grabbed
          {
               return (int(sqrt((mouseX - xpos)*(mouseX - xpos) + (mouseY - ypos)*(mouseY - ypos))*2));                             //return a radius equal to the distance of the mouse to the center of the
          }                                                                                                                         //circle
          else                                                                                                                      //else
          {                                                                                                                         //return a standard small size
               return 100;
          }
     }
}









