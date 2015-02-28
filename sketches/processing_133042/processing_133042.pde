
/*

Code written by Pauline Unietis with help from Natalie Freed
and David Unietis. Additional help from http://processing.org/

**Comments with "**" at the beginning will describe how to make alterations to the code.
**Comments with "##" will describe what the code is doing.

**To take a screenshot, take the "//" off of the beginning of any 
**lines of code without "**" or "##" directly following the "//". 

**Next, add a "//" before the line with "//!!Add "//" here!!" at the end of the line.
**The screenshot will save in the folder in which this code is stored.

*/

//import processing.pdf.*; //## imports the pdf library

//**Alter this code! 
int center = 400; //**Sets the height
//**(The width changes based on the height)
int spiralnumber = 1; //**Number of times the shell curves inwardly (from 1 to infinity)
//**Alterations end here! More changes can be made slightly further down.

float phi = 1.618033988749894848204586834; //## sets the variable phi
int size = center*2; //## sets the variable size in terms of center

void setup() 
{
  //**More things to change directly below!
  size(round(center * phi) + center/15, center + center/15); //!!Add "//" here!!
  //size(round(center * phi) + center/15, center + center/15, PDF, "blank.pdf"); 
  /* 
  **In the last section of the previous line, change "blank.pdf" to whatever
  you want to call the pdf file.
  */
  smooth(); //## makes the lines smooth
  noFill(); //## removes fill from shapes
}

void draw() 
{
  //**More changes here!! 
  ellipse(center, center/15, 15, 15); /*
  **For a vertical charm, 
  **add slashes ("//") at the beginning of the line above this one.  
  ##draws an ellipse in the center-top section
  */
  ellipse(center/15, center - center/15, 15, 15); 
  /*
  **For a horizontal charm,
  ** add slashes ("//") at the beginning of the line above this one.
  ## draws an ellipse in the bottom-left section
  **Take out both and there won't be a hole at all!
  **Be sure to not leave the two, or there will be two holes.
  **Alterations end here! No more changes from here. You can print now!
  */
  curve(-center * 2, center * -0.01, center - center, center, center, 
        center/phi + center/pow(phi, 4), center * -0.3, center * -0.3);
  curve(-center, center, 0, center, center, center/phi + center/pow(phi, 4),
        center + center * 1.2, center + center * 1.2);
  //## previous two curves are the curves going from the bottom-left corner to the center
  //## of the shell. because they only happen once, they can be outside the shell function.
  pushMatrix(); 
  shell(0, 0, 1, spiralnumber, false); //## draws a shell at the coordinates 0, 0, with 
  //## a scale of 1, a repetition of spiralnumber times, and a boolean of afterone == false
  popMatrix(); 

  //println("finished.");
  //exit();
}

void specialCurve() //## draws a curve that appears only after the first iteration 
{
    curve(-center * -0.1, center * -0.1, center - center, 
    center, center, center/phi + center/pow(phi, 4), 
    center * -0.5, center * -0.5);
}

void outsideCurves() /*
## draws the curves that do not close in on the center, instead
##closing around another shell
*/
{   
    curve(-(center/phi), center/phi, center + center/pow(phi, 4), 
        center/phi, center, 0, 
        center/phi + center/phi * 1.2, 
        center/phi + center/phi * 1.2);
    curve(-center/pow(phi, 5), -center/pow(phi, 5), 
        center + center/pow(phi, 4) + center/pow(phi, 5), 
        center/phi + center/pow(phi, 5), center + center/phi, 
        center - center/pow(phi, 2), center + center/pow(phi, 2), 
        center - center/pow(phi, 5));
    curve(center, pow(center, 2)*2/size, 
        center + center/pow(phi, 4) + center/pow(phi, 7), 
        center - center/pow(phi, 3), center + center/pow(phi, 3), 
        center, center - pow(phi, 8), center);
    curve(center - center/5, center - center/5, 
        center - (center/sqrt(2)), center - (center/sqrt(2)), 
        center + center/pow(phi, 4) - center/pow(phi, 4)/sqrt(2), 
        center/phi + center/pow(phi, 4) - center/pow(phi, 4)/sqrt(2), 
        center * 0.1, center * 1.75); 
}

void insideCurves() //## draws the curves that close in on the center
{
   curve(-(center/phi), center/phi, center, center/phi + center/pow(phi, 4),  center, 0, 
        center/phi + center/phi * 1.2, 
        center/phi + center/phi * 1.2);
   curve(-center/pow(phi, 5), -center/pow(phi, 5), 
        center, center/phi + center/pow(phi, 4),  center + center/phi, 
        center - center/pow(phi, 2), center + center/pow(phi, 2), 
        center - center/pow(phi, 5));
   curve(center, pow(center, 2)*2/size, 
        center, center/phi + center/pow(phi, 4), center + center/pow(phi, 3), 
        center, center - pow(phi, 8), center);
   curve(center - center/5, center - center/5, 
        center - (center/sqrt(2)), center - (center/sqrt(2)), 
        center, center/phi + center/pow(phi, 4), 
        center * 0.1, center * 1.75);   
}

void shell(float x, float y, float s, int repetition, boolean afterone)
/* 
## draws the shell with parameters x and y for coordinates, s for scale, repetition 
## for number of times repeated, and the boolean afterone to tell whether or not 
## the shell has been drawn more than once 
*/
{
  translate(x, y); //## displaces by x and y
  scale(s); //## sets the scale to s
  arc(center, center, size, size, PI, PI + HALF_PI); 
  arc(center, center/phi, size/phi, size/phi, PI + HALF_PI, TWO_PI);
  arc(center + center/pow(phi, 3), center/phi, size/pow(phi, 2), 
      size/pow(phi, 2), 0.00, HALF_PI);
  arc(center + center/pow(phi, 3), center/phi + center/pow(phi, 4), 
      size/pow(phi, 3), size/pow(phi, 3), HALF_PI, PI);
  //## four arcs above draw the basic shell
  if (afterone) //## if it is not the first iteration
    {
      specialCurve(); //## draw the special curve
    }
  if (repetition > 1) //## if there are still times to repeat the shell
  {
    outsideCurves(); //## draw outsideCurves
    repetition = repetition - 1; //## subtract one time from times left to repeat the shell
    shell(center, center/phi, 1/pow(phi, 4), repetition, true);
    //## draw another shell at center and center/phi, with a scale of 1/phi^4, and
    //## sets the boolean afterone to true
  }
  else //## if there are no more shells that need to be drawn
  {
    insideCurves(); //## draw insideCurves
  }
}

