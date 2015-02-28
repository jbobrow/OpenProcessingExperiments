




/*

######################################################################

    COPYRIGHT NOTICES
*
*     Processing 2.0.1 
*           Copyright  2004-2013 Ben Fry and Casey Reas 
*           Copyright  2001-2004 Massachusetts  Institute of Technology (MIT)
    The MIT License (MIT) - [See Licence.txt for details]

    Creative Programming for Digital Media & Mobile Apps Class Exercises
        https://class.coursera.org/digitalmedia-001/class/index
*          Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

*
######################################################################


######################################################################
*
              Final Project: Ruth Ann Manning
*
              App Name:  CallMeemaw
*
            Copyright (c) 2013 Ruth Ann Manning
*
######################################################################


######################################################################
*
*      DEMONSTRATIONS
*
            YouTube Screencast of CallMeemaw Final Project Mobile App
            (QuickTime Player 10.1) on July 27, 2013
*                   : http://youtu.be/lU3fjZHjO4s
*
*             Link to CallMeemaw app running in JavaScript at openProcessing.org 
*
                http://www.openprocessing.org/sketch/102888
*
*
*            Class project #1 (CallMeemaw) screencast link (July 2, 2013)

                   http://www.youtube.com/watch?v=NNQHXl_puQU
*
*
######################################################################


######################################################################
*
    APP DESCRIPTION
*
    My first app, CallMeemaw, is written for my two granddaughters, ages 2 months and 
    2 years.  I have tried to create interaction with sounds and images that are 
    commensurate with the maturity level of a toddler. In addition to providing enriching
    interactive drawing, visual and audio experiences, this app can also be used as a 
    teaching tool--telling time using both digital and analog clocks, familial face and
    voice recognition, learning how books from Meemaw’s childhood have influenced 
    her life, how traffic signals are used, and many other topics. I based my app on 
    examples from the class and other sketches I found at processing.org and other 
    sources referenced below. I selected the sounds, videos and images in the public 
    domain and manipulated them (cropped, spliced, joined, etc.) as needed to produce 
    this enrichment experience for the children. I am amazed at how much I have 
    learned in these 6 weeks and I intend to continue my studies. This was the most 
    challenging technical project I have attempted in years!

######################################################################


######################################################################
*
    NOTES
*
     1.  This sketch is written in JavaScript. 
*
      2. This code runs on my iMac (OS X version 10.7.5) in the following browsers:
          Google Chrome (version 28.0.1500.7), Safari Version 6.0.5 (7536.30.1).
          Audio Player (Maxim) doesn’t appear to work with Firefox 22.0.

    
      3.  I am a retired, 62-year old grandmother who was a FORTRAN programmer in 
           the 1980s, but my subsequent career path did not involve programming. This is 
*            my first course in object-oriented programming languages.
*
######################################################################


######################################################################
*
*     GENERAL REFERENCES
*
    Programming:
          Creative Programming for Digital Media & Mobile Apps
          Mick Grierson, Matthew Yee-King, Marco Gillies 

*            processing.org
*
           openprocessing.org
*
           learningprocessing.com

     Tutorial: Processing, JavaScript, and Data Visualization
   http://blog.blprnt.com/blog/blprnt/tutorial-processing-javascript-and-data-visualization  
*
*     Images:
*          openclipart.org
         clker.com
*
*     Text:
         supalogo.com
         Gradient 1: #FFCC00
         Gradient 2: #CC0000
*
    Sound:
         freesound.org

   Video:
         Internet Archives (archive.org)
*
*   "The Three Billy Goats Gruff" told by Frances Clark Sayers (1977)
*       http://archive.org/details/frances_sayers-three_billy_goats_gruff_1977
*
*    Fonts:
      Open Font Library (openfontlibrary.org)
*
* 
*    See also
*      http://openfontlibrary.org/en/catalogue?view=&page=2
*      http://fonts.qubodup.net/all.html
*
*
######################################################################


######################################################################
*
*     EXAMPLE CODE SOURCES
*
    JavaScript Port of the Processing 2 Video Library (processing.video.*.js) 
    and an example of how to write cross mode libraries for Processing 2.0
         Florian Jenett
        https://github.com/fjenett/processing-video-js/
*
   Creative Programming for Digital Media & Mobile Apps 
   https://class.coursera.org/digitalmedia-001/class/index
*    Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies
*
*    Sonic PainterJavaScript
   basicRotationWithSin

*    github.com
*
*    openprocessing.org ???
*
*    Printing Circular Text
*  http://processing.org/tutorials/text/
*
   Analog Clock
   http://processing.org/examples/clock.html
*
*
######################################################################


######################################################################
*
*     SOFTWARE APPLICATIONS
*
*     Processing 2.0.1 
*         Copyright  2004-2013 Ben Fry and Casey Reas 
        Copyright  2001-2004 Massachusetts  Institute of Technology (MIT)

    Audacity 2.0.3  Digital Audio Editor

    Miro Video Converter 2.6

   HandBrake
*    Version 0.9.9 x86_64 (2013051800)

    QuickTime Player 10.1

    Preview  5.5.3

    iPhoto ’11 9.2

    iMovie ’11  9.0.4

*
######################################################################

*/

//  ########################>>>BEGIN SKETCH<<#########################


//  ########################>>>GLOBAL<<<##############################

//        ***Import JavaScript port of Processing 2 video library***
 
       import processing.video.*;

//        ***Declare constructors***
  
      Maxim meemawMaxim;

      Movie meemawMovie;

//        ***Create (and initialize some of the) global variables before rest of sketch is 
//            executed***

//     >>Declare variable data types<<

      AudioPlayer cellphonePlayer;

//          Image
 
      PImage timeimg;

      Pimage robotimg, callimg, cellphoneimg, TVscreenimg;

      Pimage playbuttonimg, pausebuttonimg, stopbuttonimg;    

      Pimage babymeemaw;   

//        **** Variables used to display text***

//           Pfont  class 

        Pfont font1, font2, font3;

//           Integer

//           ***Variables used for displaying time***

//    >>(x,y) location to display time digitally<<

      int xDigital, yDigital;

//    >>coordinates of center of analog clock<< 

      int xCenter, yCenter;  

//           Floating-point

//    >>Hour, minute, and second hand lengths<<

      float secondsRadius;
      float minutesRadius;
      float hoursRadius;

//    >>Diameter of clock face<<

      float clockDiameter;

//     >>Radius of circle used for displaying “title” string

       float titleRadius;
      
//          String class 

//    >>title of sketch<<
  
String title = "CallMeemaw";


//  ########################>>>BEGIN setup<<############################

                                          
void setup()

      {
 

//    >> Set dimensions of the display window in pixels>>

//    >>Sized for iPad portrait. Switch order of the numbers for landscape.<<

       size(768, 1024);

//    >> Object initialization<<

      meemawMaxim = new Maxim(this);

//        *** Load images from data folder***

//    <<image used for display window background<<

        timeimg   = loadImage("timewallpaper.png"); 

        robotimg           = loadImage("robotcaller.png");
        callimg              = loadImage("CALL.png");

        TVscreenimg    = loadImage("TV.png");

        playbuttonimg          = loadImage("trafficlightgreen.png");
        pausebuttonimg    = loadImage("trafficlightyellow.png");
        stopbuttonimg       = loadImage("trafficlightred.png");

        babymeemaw       = loadImage("BabyMeemaw.png");

//***************

//        *** Load movie from data folder***

//    <<  Include the 3 video types supported by HTML5<<

      String moviename = "three_billy_goats_gruff";
 
      meemawMovie = new Movie( this, moviename+".mp4", moviename+".ogv", moviename+".webm" );


    meemawMovie.noLoop();

//***************

 //        ***font setup***

//    >> Load fonts for writing text and numbers to display screen from data folder <<

//     >>These fonts were created in .vlw format using “Create Font” from the Tools 
//          menu in Processing because app users might not have the fonts installed on 
//          their devices.<<

     font1 = createFont("Georgia-36", 36, true);

     font2 = createFont("Georgia-30", 30, true);
     font3 = createFont("Georgia-18", 18, true);

// >>>Change to loadFont later<<<

//    >> Load fonts used to display title<<

//   font1 = loadFont("Georgia-36.vlw");

//    >> Load fonts used to display time digitally<<

//      font2 = loadFont("Georgia-30.vlw");
//      font3 = loadFont("Georgia-18.vlw");


//***************************

//        ***cellphone audio setup***

      cellphonePlayer = meemawMaxim.loadFile("MeemawandPhoneCall.wav");

      cellphonePlayer.setLooping(false);


//***************************


 //        ***real-time analog clock setup***

//    >>Coordinates of center of clock face (with diameter clockDiameter)<<

      xCenter = width / 7;
      yCenter  = height / 6; 

//     >>edgeDistance is horizontal distance from left edge of display window to center of 
//         circular clock face (if width < height) and vertical distance from top edge (if 
//         height <width). <<

    int edgeDistance = width / 7;

//           ***NOTE: 6 concentric circles are used to display real-time analog clock***

       secondsRadius = edgeDistance * 0.72;
       minutesRadius = edgeDistance * 0.60;
       hoursRadius = edgeDistance * 0.50;
       clockDiameter = edgeDistance * 1.75;

//    >> Coordinates to display time digitally<<

      xDigital = edgeDistance*0.8;
      yDigital = edgeDistance * 2.8;
      

       }


//  ########################>>>BEGIN draw<<############################


void draw()

     {
  
 //         ***Display window background image*** 

         image(timeimg, 0, 0);


//        ***Draw images and place movie on the display screen***

 
       image(babymeemaw, 0.015*width, height * 0.89); 

       image(robotimg, 0.07*width, height * 0.33);  

       image(callimg, 0.21*width, height * 0.40);

       image(TVscreenimg, 0.10*width, height*0.50);

      image(playbuttonimg, 0.24*width, height*0.90);

      image(pausebuttonimg, 0.49*width, height*0.90);

      image(stopbuttonimg, 0.74*width, height*0.90);

//     >>Show movie inside TV screen<<

tint(255,240);

if ( meemawMovie.available() )
     {
        meemawMovie.read();
     }

image(meemawMovie, 0.15*width, height*0.55, width*.74, height*.28);


//        ***Draw all of the text section***

//    >>Write title “CallMeemaw” in circular format in display window<<

//    >>Translate the origin to be the center of the invisible circle
//        around which the text is to be drawn.<<

      pushMatrix();

       translate(width/7, height/6);

//    >>Draw invisible circle centered at translated origin<<

      titleRadius = width/7;

      noFill();

      noStroke();

       ellipse(0, 0, titleRadius*2.1, titleRadius*2.1);

//    >> text() will draw characters around this invisible circle by making a second 
//         translation with origin (0,0) to the center of the currently drawn character, 
//         currentChar. After each character is drawn, the origin of the translation reverts 
//         back to the original translation with origin at the center of the invisible circle.<<

//     >>textFont sets the current font that will be drawn with the text() function. 
//         font1 will be used for each character and was created in setup().<<

      textFont(font1);

//     >>textAlign() sets the current alignment for drawing the text. Here the characters 
//         are positioned relative to their centers after a second translation.<<

         textAlign(CENTER);

//         Default is:  smooth();

//     >>Keep track of position along the curve to place next character<<

//      >>Arclength = theta * radius, where theta is the subtended angle of the arc<<

         float arclength = 0;

//        ***Begin for loop to draw the text***

              for (int i = 0; i < title.length(); i++)
                        {

                      char currentChar = title.charAt(i);

 //     >>Draw using the width of each individual character, instead of using a constant 
//           width<<

                     float w = textWidth(currentChar);

//     >>Each character is centered, so advance by half its width<<

                    arclength += w/2;

//      >>Current theta = current arclength divided by titleRadius<<

//      >>Determine character placement wrt polar coordinate system with radial 
//          coordinate titleRadius and angular coordinate theta, defined here (using axis 
//          orientation used by Processing) to be clockwise angle from the x-axis.  Polar 
//          angular coordinate will be translated by PI radians (to begin drawing from 
//          negative x-axis of the originally translated system plus an offset of
//          QUARTER_PI to position the first character drawn on the invisible circle.//<<  

                   float theta = PI + QUARTER_PI + arclength / titleRadius; 

//    >>pushMatrix() function saves the current coordinate system to the stack and 
//        popMatrix() restores the prior translation to the coordinate system with origin at 
//         the center of the invisible circle.<<

                 pushMatrix();

//    >>Convert from polar coordinates (titleRadius, theta) to cartesian coordinates (x,y) 
//         and translate origin to (x,y) for this iteration of the loop and translate back for the 
//         next character. Use pushMatrix/popMatrix to return to the original translation.<<

                translate(titleRadius*cos(theta), titleRadius*sin(theta));

    //    >>Rotate, offsetting by 90 degrees <<

                 rotate(theta+PI/2); 


               fill(255);

                text(currentChar,0,0); 

                popMatrix();

                arclength += w/2; 


                }

       popMatrix();

//        *** Draw real-time analog clock***

//    >>Draw the clock face background<<
  

//    >>Set tint of clock face to be white, half opacity<<

       tint(255,128); 

//     >>Disable drawing the stroke (outline) of the circle<<

       noStroke();

  
//     >>The default mode is ellipseMode(CENTER). The first two parameters of ellipse() 
//           are interpreted to be the shape's center point, while the third and fourth 
//           parameters are its width and height<<


//    >>Choose colors and draw the circles of the clock face<<


          fill(10,100,200); 

          ellipse(xCenter, yCenter, clockDiameter, clockDiameter);

          ellipse(xCenter, yCenter, 0.175*clockDiameter, 0.175*clockDiameter);


         fill(255,255,81);

         ellipse(xCenter, yCenter, 0.7*clockDiameter, 0.7*clockDiameter);


         fill(10,100,200); 

        ellipse(xCenter, yCenter, 0.4*clockDiameter, 0.4*clockDiameter);



//        ***Draw the hands of the clock to represent real-time.***

//             ***BACKGROUND MATHEMATICAL INFORMATION***
  
//    >>The traditional Cartesian Coordinate System defines a point in 2-dimensional 
//        space in terms of an x-coordinate, measured along a horizontal axis, oriented 
//        from left to right, and a y-coordinate, measured along a vertical axis, usually 
//        oriented from bottom to top. The coordinate system used by Processing (as is 
//        normally used in computer graphics and image processing) is a coordinate 
//        system with this same x axis orientation, but with the y axis pointing down (as 
//        displayed on a computer screen).<<

//    >>Here, it is more “intuitive” to me to first consider the traditional interpretation to 
//        to explain how this real-time analog clock is designed, using the periodicity of the 
//        graphs of sin(x) and cos(x) from 0 to TWO_PI. But it is easy to convince yourself 
//        that the graphs of sin(x) and cos(x) from 0 to TWO_PI radians in the traditional 
//        system--starting at the positive x axis (3:00 of the analog clock) and proceeding        
//         counterclockwise-- are exactly the same graphs of sin(x) and cos(x) in the 
//         coordinate system used by Processing, if you begin at the positive x axis (0 
//         radians) and proceed clockwise (as in the direction of the hands of the clock).<<

//     >>But since the clock begins its periodicity at 12:00 (HALF_PI for either system)
//         we must subtract this amount of radians from the angle computed as we proceed 
//         around the circular clock face over the interval [0,TWO_PI].<<

//    >>The period of the graphs of the sine and cosine functions used here ranges from 
//        0 to TWO_PI, beginning at the center [xCenter, yCenter] of the circle (clock face).
//        This new origin is a translation from the traditional Cartesian coordinate system 
//        origin [0,0].<<

//    >>To measure the arc transversed in time for the second, minute and hour hands, 
//        we will beginning with the positive x axis (0 radians) and proceeding clockwise 
//        around a unit circle centered at [xCenter,yCenter].<<
//  
//    >>Specifically, for a unit circle, centered at the point (xCenter, yCenter), the values 
//        of cos(x) in one period range from yCenter+1 at 0 radians, to yCenter at 
//        HALF_PI, to yCenter - 1 at PI , back to yCENTER at 3*PI/2 and yCenter+1 at 
//        TWO_PI. Similarly sin(x) ranges from yCenter at 0 radians, yCenter+1 at 
//       HALF_PI, yCenter at PI, yCenter-1 and 3*PI/2 and back to yCenter at TWO_PI.<<

//        >>Translating this scheme to a clock face, the second and minute hands 
//        traverse a unit circle (TWO_PI radians) once per cycle (in 60-second and 60-
//        minute intervals, respectively).<<

//        >>Similarly, in one day the hour hand must travel around the circular clock
//        twice (TWO_PI*2 = 4*PI radians) in 24 1-hour increments.<<

//       >>The circumference of a circle is TWO_PI times its radius, which is just TWO_PI
//            for a unit circle. So the distance traveled around a unit circle per movement of 
//            a given clock hand is just the arc length. Since we are using a 24-hour clock,
//            the “incremental” distance traveled by the second and minute hands is 
//            TWO_PI/60 and 4*PI/24 for the hour hand.<<

//        >>For an accurate measurement of the minutes, add the current value of the 
//            seconds. To compute the exact hour, add the minute and second 
//            components.<<

//**********

//    >>Find the endpoints for each clock hand for drawing a line from the center of 
//        the clock [xCenter, yCenter] to the appropriate point on the concentric 
//        circle with the tick marks.<<

//    >>First compute(in radians) the angle s made by the radius drawn to the point on
//        circle representing the current second value and the radius of the circle at 3:00<<

//     >> Re-map current second value to a radian in the range [0, TWO_PI] and subtract 
//          HALF_PI (see explanation above).


        float s = map(second(),  0,  60,  0, TWO_PI)  -  HALF_PI;


//    >>Find the angle m made by the minute hand with 3:00 using the current minute 
//        value plus fractional part of a minute for the current value of second).<<

//    >>NOTE: norm(value, start, stop) is equivalent to map(value, low, high, 0, 1)<<


       float m = map(minute() + norm(second(), 0, 60),  0, 60,  0, TWO_PI)  -  HALF_PI; 


//    >>Using a 24-hour clock designation, find angle h made b the hour hand between 
//         0 and 4*PI using current hour value and fractional part of a minute.
 

        float h = map(hour() + norm(minute(), 0, 60),  0, 24,  0, TWO_PI * 2)  -  HALF_PI;
 

  //    >>Draw the hands of the clock to be white<<

         stroke(200);

//    >>Draw second hand from [xCenter,yCenter] to point on circle with coordinates
//        [xCenter+cos(s)* secondsRadius, yCenter + sin(s) * secondsRadius] <<

//     >> x-coordinate of point on inner circle is x-coordinate of center of circle plus
//          x-distance to point on circle made by angle s in radians; 
//              since  cos(s) = (length of adjacent side) / hypotenuse 
//           x-distance to pt on circle = cos(s) * secondRadius<<

//    >>strokeWeight sets the width (in pixels) of the stroke used for these lines<<


         strokeWeight(1);
         line(xCenter,  yCenter,  xCenter + cos(s) * secondsRadius,  yCenter + sin(s) * secondsRadius);


      strokeWeight(2);
      line(xCenter,  yCenter,  xCenter + cos(m) * minutesRadius,  yCenter + sin(m) * minutesRadius);


      strokeWeight(4);
      line(xCenter,  yCenter,  xCenter + cos(h) * hoursRadius,  yCenter + sin(h) * hoursRadius);

  
//      >>Draw 60 points(tick marks) on circle with same radius as the second hand to 
//          represent a 60-minute hour divided into 1-minute intervals (and 60-second 
//          minute divided into 60 equal increments).<<

       strokeWeight(5);


//    >>Begin recording vertices for the shape POINTS.<<
  
            beginShape(POINTS);


//    >>Draw 60 points (0-59) equally spaced around inner concentric circle.<<
  
     for (int a = 0; a < 360; a+=6)
           {
    
               float angle = radians(a);
               float x = xCenter + cos(angle) * secondsRadius;
               float y = yCenter + sin(angle) * secondsRadius;

//    >> Draw point at [x,y]. 

 //     >> vertex() used exclusively within the beginShape() and endShape() functions.<<

             vertex(x, y);
    
           }

              endShape();


   fill(225, 225, 0);

      textFont(font3);

      text("3", xCenter + 0.48*clockDiameter, yCenter);
      text("6", xCenter, yCenter + 0.55*clockDiameter);
      text("9", xCenter - 0.48*clockDiameter, yCenter);
      text("12", xCenter, yCenter - 0.443*clockDiameter);


//         ***Display time digitally**

//    fill(225, 225, 0);

   textFont(font2);

//   fill(225, 225, 0);

   fill(240);
  
 String amTImeofday = "am";
 String pmTimeofday = "pm";
 String midnightTimeofday = "midnight";
 String noonTimeofday = "noon";

//  00:00:01 to 11:59:59 is am
//  12:00:00 is noon
//  12:00:01 to 23:59:59 is pm
//  00:00:00 is midnight


if ( hour() >12 )
     {

           text( nf( hour() - 12, 2 ) + ":" + nf( minute(), 2) + ":" + nf( second(),2),  xDigital,  yDigital);    
     
     }
                     
else
     {

            text( nf( hour(), 2 ) + ":" + nf( minute(), 2) + ":" + nf( second(),2),  xDigital,  yDigital);  
     
      }

if ( hour()>=12 )
      {

            if( hour()==12 && minute()==0 && second()==0)
                 {

                            text( noonTimeofday,  xDigital + 0.13*width,  yDigital);

                 }
          
              else
                  {

                           text( pmTimeofday,  xDigital + 0.13*width,  yDigital);

                  }

       }


else
      {
            if( hour()==0 && minute()==0 && second()==0)
                 {

                            text( midnightTimeofday,  xDigital + 0.13*width,  yDigital);

                 }
          
              else
                  {

                           text( amTimeofday,  xDigital + 0.13*width,  yDigital);

                  }

        }



//         ***Label play, pause, and stop buttons***

 textFont(font3);

 String playbutton = "PLAY";
 String pausebutton = "PAUSE";
 String stopbutton = "STOP";

     fill(56,160,52);
     text(playbutton, 0.268*width, 0.98*height);

     fill(186, 188, 70);
     text(pausebutton, 0.527*width, 0.98*height);

     fill(203, 8, 24);
     text(stopbutton, 0.775*width, 0.98*height); 
  
     }


/*

##############################################################

                                           BEGIN mouseDragged

##############################################################

*/

void mouseDragged()

{

}


/*

##############################################################

                                           BEGIN mousePressed

##############################################################

*/


void mousePressed()

     {

//    >>Code to play cellphone audio<<

      if ( mouseX <  width*0.35 && mouseY >  height*0.25 && mouseY < height*0.50 ) 
 
                  {

               cellphonePlayer.cue(0);
               cellphonePlayer.play();

                    }

//    >>Code to control playing of the movie<<


   
   if ( mouseX >  width*0.20 && mouseX  < width*0.30 && mouseY >  height*0.80 ) 
             {

                         meemawMovie.play();

               }


  if ( mouseX >  width*0.45 && mouseX  < width*0.55 && mouseY >  height*0.80 ) 
                  {

                        meemawMovie.pause();

                  }



  if ( mouseX >  width*0.70 && mouseX  < width*0.80 && mouseY >  height*0.80 ) 
                  {

                       meemawMovie.stop();

                    }

     }

/*

##############################################################

                                           BEGIN mouseReleased

##############################################################

*/


void mouseReleased()

 {

}



/*

##############################################################

                                        END OF SKETCH

##############################################################

*/
//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


