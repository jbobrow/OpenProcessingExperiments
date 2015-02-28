
// Code Written By: Chukwudi T. Unonu
// Date Created:  02/13/2012
// Date Finished: 02/28/2012
//
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: 
// Apple MAC OSX 10.5.8
// Processor 3.06 GHz Intel Core Duo
// Memory 4 GB 1067 MHZ DDR3
// &
// INSPIRON 1521 (Motherboard), INSPIRON 1520 (Screen) 
// 
// SKETCH 0 of 24: "Bezier Curve Iteration"
// DESCRIPTION: Have Bezier Curves within Spiral loop inside, 
// have diamond repeat outside....
//  ----====    START "Sketch"   ====----
//

void setup()
{
  // Screen Resolutions References via Wikiedia
  // (a) <http://en.wikipedia.org/wiki/720p>  
  // HD Size 720p    
    size(1280,720);
  
}

void draw()
{
  // Background Color References via Google.com Search Engine "", Feb 02, 2012.
  // (a) Prese Color Charts <http://www.tayloredmktg.com/rgb/>
  // (b) Color Generator <http://www.colorschemer.com/online.html>
  // (c) Color Calculator <http://drpeterjones.com/colorcalc/>
  // *** (d) Hexadecimal code and RGB value generator <http://www.blogtrickstream.com/2011/08/hexadecimal-color-html-code-rgb-values.html>    

  // "Charcoal" Background
 background(#000000);
// noStroke();
  
  strokeWeight(4);
  stroke(174, 221, 60);
// fill(#525252);
 rect(10, 10, 1260, 700); 
//// Bezier Curves
// Reference: Processsing.org <http://processing.org/reference/bezier_.html>; 
//            WikiPedia.org <http://en.wikipedia.org/wiki/Bézier_curve>
//
// There will be a total of eight seperate lines that are bezier curves
// Their plots should start, continue and end at the following
//
// --------------------------
// MAIN POINTS ( X , Y )
// --------------------------
// POINT 0001: (640,170)
// POINT 0002: (800,255)  
// POINT 0003: (960,340)
// POINT 0004: (800,425)
// POINT 0005: (640,510)
// POINT 0006: (480,425)
// POINT 0007: (320,340)
// POINT 0008: (480,255)
// --------------------------

// Loop
// Reference: Processsing.org <http://processing.org/reference/loop_.html>

strokeWeight(1);
//Lines 1 & 2
noFill();
stroke(0,255,0);
line(640,170, 800, 255);
line(800, 255, 960, 340);
// Lines 3 & 4
stroke(0,255,0);
line(800, 425, 640, 510);
line(960, 340, 800, 425);
// Lines 5 & 6
stroke(0,255,0);
line(480,425, 320,340);
line(640, 510, 480,425);
// Lines 7 & 8
stroke(0,255,0);
line(320,340, 480,255);
line(480,255, 640, 170);

// Curves 1 & 2
noFill();
stroke(0,255,0);
//bezier(x1,y1,cx1,cy1,x2,y2,cx2,cy2);
bezier(640,170,640,212.5,720,255,800,255);
// cave-in South West
bezier(800,255,880,255,960,255,960,340);
// cave-out North East
// ------------------
// Curves 3 & 4
noFill();
stroke(0,255,0);
// cave-in NW
bezier(960, 340, 880, 340, 800, 382.5, 800, 425);
// cave-out SE
bezier(800, 425, 800, 467.5, 720, 510, 640, 510);
// ------------------
// Curves 5 & 6
noFill();
stroke(0,255,0);
// cave-in NE
bezier(640, 510, 640,467.5, 560,425, 480, 425);
// cave-out SW
bezier(480, 425, 400,425, 320,382.5, 320,340);
// ------------------
// Curves 7 & 8
noFill();
stroke(0,255,0);
// cave-in SE
bezier(320,340,400,340, 480, 297.5, 480,255);
// cave-out NW
bezier(480,255, 480,255, 520,170, 640, 170);

}

//  ----====    END "Sketch"   ====----

