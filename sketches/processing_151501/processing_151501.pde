
//
//  Program  Sketch name  RGBcolourViewer by PJ Cousins June 2014

/*
 * As part of the Future Learn Creative Coding Course
 * run by Monash University in week 3 a challenge was
 * set as follows
 
 Start with the w3_01 sketch. 
 This simple sketch changes the background colour based on 
 movement of the mouse in x and y. 
 Notice how the map() function is used to map mouse location 
 to colour, in particular the relationship between horizontal 
 and vertical movements and colour change. 
 Can you think of a better method to map mouse position to colour? 
 Modify the code to see how well your idea works.
 
 
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to 
 * background colour 
 * by Indae Hwang
 
 
 All following code by PJ Cousins June 2014
 except code for producing equilateral triangle.
 
 The equilateral triangle is based on code found at
      http://processing.org/discourse/beta/num_1262805360.html
      by abel.  Thank you.
 
Intend to change W3_01 from a square to an equilateral triangle.

Cannot get full range of colours from W3_01 as original.
Especially no black and no white.

The 3 corners will be R G B and value 0 at corner for the
relevant colour. Mouse will select one or more colours.

1   1 colour will increase from 0 to 255 as mouse approaches
      another corner

2   2 colours selected will mix in manner depending on
      distance to 3rd corner. If at 3rd corner, both selected
      colours to have value 255.

3   3 colours selected will mix in manner depending on
      distance to centre of triangle. If at centre, all 3
      colours to have value 255.
      This is impractical as it requires the maths to operate
      over 2 different scales. Problem solved by moving away
      from 3rd corner as mentioned above, but outside the 
      triangle. Need to draw a smaller triangle to allow
      the 3rd colour to reach 255 outside the triangle.
      This is the LIGHT option and will produce WHITE.
      
The above options still do not allow a full range of
colours to be obtained. To try and increase the mix
available a clickable text section at the top of the
screen now offers changing the corner colour range
from 0 - 255 to 255 - 0.

It seems impossible to get the full mix of 3 colours
without resorting to 3 controls, for example, sliders.

The program ends up resorting to SLIDERS.

Please note that to employ the various options
available in this sketch it is necessary to
Click on the appropriate text,
for example: SMALL, RED ON, BLUE OFF, SLIDERS.

If RED, GREEN, and BLUE are all OFF together
the GRAY Scale can be viewed.
      
In the final sketch presented here, map() of W3_01
is not used, but instead dist() is more suitable.
      
      The equilateral triangle is based on code found at
      http://processing.org/discourse/beta/num_1262805360.html
      by abel.  Thank you.

*/

PFont f;                      // Declare PFont for text

float angle=2*PI/3; //120 Degrees
float angle_rect=PI/2;
int b = 2;          // Used to calculate corners of triangle
float d=274;        // 274 = big triangle, DARK ON
// float d=120;     // 120 = small triangle, LIGHT ON
float centerX=300;  // centre of equilateral triangle X
float centerY=330;  // centre of equilateral triangle Y

float red;          // value of red component of colour mix
float green;        // value of green component of colour mix
float blue;         // value of blue component of colour mix

boolean slider = false;
boolean redON = true;
boolean greenON = true;
boolean blueON = true;
boolean large = true;
boolean zero = true;

float redX;      // coordinates of red corner, bottom left
float redY;
float greenX;    // coordinates of green corner, top
float greenY;
float blueX;     // coordinates of blue corner, bottom right
float blueY;

float redD;     // distance of mouse from corner colours
float greenD;
float blueD;




void setup() {
  size(600,600);
  calculateCorners();
  
    // initialise the colour variables
  red = 0;
  green = 0;
  blue = 0;
  noStroke();
  smooth(); 
}    //  end of setup


void draw() {
 background(100);
 
 beginShape();
   vertex(redX,redY);          // Red corner, bottom left
   vertex(greenX,greenY);      // Green, apex top
   vertex(blueX,blueY);        // Blue, bottom right
 endShape();
 
 f = createFont("Arial",16,true); // Create Font
 
 textFont(f,12);                  // font size
 text("RGB Colour Mixer with RGB Value Display",190,20);   // Display Text
 if(!slider){  // slider = false
     if(zero){
         text("Corner Colour Values 0 , Click for 255",200,40);    // Display Text
     }else{
         text("Corner Colour Values 255 , Click for 0",200,40);    // Display Text
     }
 
     if(!redON && !greenON && !blueON){
         text("Gray Level ON",greenX-40,greenY-3);
     }else{
         if(!redON){
             text("Red OFF",redX-55,redY);   // Display Text
         }else{
             text("Red  ON",redX-55,redY);   // Display Text
         }
        if(!greenON){
             text("Green OFF",greenX-30,greenY-3);   // Display Text
        }else{
             text("Green  ON",greenX-30,greenY-3);   // Display Text
        }
        if(!blueON){
             text("Blue OFF",blueX+5,blueY);   // Display Text
        }else{
             text("Blue  ON",blueX+5,blueY);   // Display Text
        }
     }
 
   if(!redON && !greenON && !blueON){
       text("Gray Level = " + red,greenX - 45,redY +20);
   }else{
       text("Red = " + red,redX-5,redY +20);
       text("Green = " + green,greenX - 39,redY +20);
       text("Blue = " + blue,blueX - 63,redY +20);
    }
 
     if(large){
         text("Select SMALL size",greenX-55,redY +40);  // Display Text
     }else{
         text("Select LARGE size",greenX-55,redY +40);  // Display Text
     }
  
    text("Toggle colours ON or OFF by clicking Colour text at corners.",140,redY +60);   // Display Text
    text("Mix selected colours by moving mouse and observe RGB values.",130,redY +80);   // Display Text
    text("Gray levels can be viewed by toggling all three colours to OFF.",135,redY +100);   // Display Text
    text("Select SMALL for full mix , LARGE less mix but finer control.",138,redY +120);   // Display Text
    if(!large)text("Complete Colour Control click here for SLIDERS",170,redY +160);   // Display Text


    }else{    // slider = true
         text("SLIDERS SELECTED",240,60);    // Display Text
         text("Click here to EXIT",250,80);
         
         text("Move mouse in slider to adjust colour value",185,120);
         text("Exit slider vertically to fix colour value",200,140);
         
         text("Red = " + red,redX-5,redY +20);
         text("Green = " + green,greenX - 39,redY +20);
         text("Blue = " + blue,blueX - 63,redY +20);
         
         fill(200,0,0);   // border rectangle in red value 200
         rect(greenX-127,redY+38, 259, 19);  // border
         fill(200);       // Gray value 200 for unselected part of slider
         rect(greenX-125+red,redY+40, 255-red, 15); // Unselected part, 255 - length red
         fill(red,0,0);   // Colour selected part of slider in 'red' value
         rect(greenX-125,redY+40, red, 15); // Selected part length 'red'
         
         fill(0,200,0);   // border rectangle in green value 200
         rect(greenX-127,redY+103, 259, 19);   // border
         fill(200);       // Gray value 200 for unselected part of slider
         rect(greenX-125+green,redY+105, 255-green, 15); // Unselected part, 255 - length green
         fill(0,green,0); // Colour selected part of slider in 'green' value
         rect(greenX-125,redY+105, green, 15); // Selected part length 'green'
         
         fill(0,0,200);   // border rectangle in blue value 200
         rect(greenX-127,redY+168, 259, 19);  // border
         fill(200);       // Gray value 200 for unselected part of slider
         rect(greenX-125+blue,redY+170, 255-blue, 15); // Unselected part, 255 - length blue
         fill(0,0,blue);  // Colour selected part of slider in 'blue' value
         rect(greenX-125,redY+170, blue, 15); // Selected part length 'blue'
         
         fill(red,green,blue);
    } // end of 'else'

}   // end of draw


void calculateCorners() {
     redX = centerX + d*sin(angle + b*angle_rect);
     redY = centerY + d*cos(angle + b*angle_rect);
     greenX = centerX + d*sin(b*angle_rect);
     greenY = centerY + d*cos(b*angle_rect);
     blueX = centerX + d*sin(angle*2 + b*angle_rect);
     blueY = centerY + d*cos(angle*2 + b*angle_rect);
}   // end of calculateCorners

void mousePressed() {
  if(!slider){  // slider = false
             // test for toggle of Corner Colour Values 0 - 255 or 255 - 0
      if(mouseX>=190 && mouseX<410 && mouseY<=40 && mouseY>30){
           zero = !zero;  // Flip logic state
      }
  
             // test for toggle of LARGE or SMALL
      if(mouseX>=greenX-60 && mouseX<greenX+65 && mouseY<=redY+40 && mouseY>redY+30){
           large = !large;  // Flip logic state
           if(large){
                d = 274;                           // large triangle
           }else{
                d = 120;                           // small triangle
           }
            // recalculate triangle corner coordinates
      calculateCorners();
      }
   
            // test for SLIDER selection if in SMALL triangle screen
      if(mouseX>=greenX-130 && mouseX<greenX+130 && mouseY<=redY+160 && mouseY>redY+150 && !large){
          slider = !slider;  // Flip logic state
      }
   
   
          // test for toggle of Red ON or OFF
      if(mouseX>=redX-55 && mouseX<redX-10 && mouseY<=redY && mouseY>redY-10){
           redON = !redON;  // Flip logic state
      }
  
          // test for toggle of Green ON or OFF
      if(mouseX>=greenX-30 && mouseX<greenX+30 && mouseY<=greenY-3 && mouseY>greenY-14){
           greenON = !greenON;  // Flip logic state
      }
  
         // test for toggle of Blue ON or OFF
      if(mouseX>=blueX+5 && mouseX<blueX+55 && mouseY<=blueY && mouseY>blueY-10){
           blueON = !blueON;  // Flip logic state
      }
  }else{  // SLIDERS selected if here, slider = true
      if(mouseX>=250 && mouseX<350 && mouseY<=80 && mouseY>70){
          slider = !slider;  // Flip logic state
      }   // end of 'if'
  }       // end of 'else'
 
}         // end of mousePressed

void mouseMoved() {
  if(!slider){                                     // slider = false
      redD = dist(redX,redY,mouseX,mouseY);        // calculate distance of mouse
      greenD = dist(greenX,greenY,mouseX,mouseY);  // from each corner colour
      blueD = dist(blueX,blueY,mouseX,mouseY);
  
      red = redD * 255 / (blueX - redX);           // convert distance onto
      green = greenD * 255 / (blueX - redX);       // 0 to 255 colour scale
      blue = blueD * 255 / (blueX - redX);
  
      if(!redON)red = 0;                           // only use selected colours
      if(!greenON)green = 0;
      if(!blueON)blue = 0;
  
      if (red > 255) red = 255;
      if (green > 255) green = 255;
      if (blue > 255) blue = 255;
  
      if(!zero){                                   // colour value start at 255
           if(redON)red = 255 - red;               // at corners instead of 0
           if(greenON)green = 255 - green;
           if(blueON)blue = 255 - blue;
      }
  
      red = (int)red;        // get rid of decimals
      green = (int)green;
      blue = (int)blue;
  
      if(!redON && !greenON && !blueON){      // all colours off
          red = redD * 255 / (blueX - redX); // use red for gray level fill
          if(red>255)red = 255;
          red = (int)red;
          fill(red);
      }else{
          fill(red,green,blue);
          }
          
  }else{    //  Slider screen in use here,   slider = true
  
       if(mouseX>=greenX-125 && mouseX<=greenX-125+255){  // mouseX in valid colour selection bounds
          if(mouseY>redY+40 && mouseY<redY+55)red = mouseX - (greenX-125);      // get red value
          if(mouseY>redY+105 && mouseY<redY+120)green = mouseX - (greenX-125);  // get green value
          if(mouseY>redY+170 && mouseY<redY+185)blue = mouseX - (greenX-125);   // get blue value
       }          // end of 'if' checking if mouse in a slider
   }              // end of 'else'
 
}                 // end of mouseMoved





