
/*
This is a simple illustration of a timepiece
inspired by, "The Editor", from Inside The Edit
https://vimeo.com/90125079
This sketch is for exercise 2 in Design 479 —
Interactive Data Visualization, Winter '15
Prof. Tad Hirsch
by Brian Studwell
*/
  

// canvas

size(400, 400);                                // set canvas size
smooth();                                      // turn on anti-aliasing
background(255);                               // set background to white

translate(200, 200);                           // set origin to center center to make rotations easier on my brain



//  background arc

fill(#3A383A); //background arc fill dark grey
arc(0, 0, 5000, 5000, radians(25), radians(270)); // create an arc which will flow off the canvas, which begins 25 degrees below horizontal center and ends at vertical center



//  clock face ellipse

noStroke();                                     // remove stroke
ellipse(0, 0, 200, 200);                        // create a circle, 200 pixels in diameter, around the origin



//  minute and second graduations

float offset = radians((360/60));               // creates an offset variable for minute and second graduations

stroke(#F34075);                                // set stroke to Cerise Pink
strokeWeight(.5);                               // set strokeWeight to .5
for(int i = 1; i < 20; i++){                    // for a given variable i, whose starting value is 1, so long as i is less than 20 add 1 to its value every cycle
  rotate(offset);                               // rotate each graduation 6 degrees around the center
  if (i > 0 && i%5==0){                         // if i is greater than zero and is divisible 
    line(0, -100, 0, -120);                     // create a new minute graduation
  } else {                                                  
    line(0, -100, 0, -103);                     // otherwise, create a new second graduation
  }
}



// dot outline of remaining clock face

for(int i = 1; i < 41; i++){                    // for a given variable i, whose starting value is 1, so long as i is less than 41 add 1 to its value every cycle
  int dot = int(random(0, 2));                  // creates integer, "dot", whose value is a random float between 0 and 2, casted as an integer, either 0 or 1
  rotate(radians(6));                           // rotate every shape 6 degrees further around the center, or, more accurately, rotate the origin another 6 degrees every iteration
  if (dot == 0){                                // if the value of dot in this iteration is 0
    stroke(180);                                // set stroke to light grey
    noFill();                                   // remove any fill
    ellipse(0, -100, 5, 5);                     // create an ellipse beginning where the graduations ended, following the same perimeter they did, with a diameter of 5 pixels
  } else {
    noStroke();                                 // otherwise remove any stroke
    fill(180);                                  // set the fill to light grey
    ellipse(0, -100, 5, 5);                     // and do the same
  }
}



// center text

rotate(radians(-6*59));                         // un-rotate the coordinate system
PFont font;                                     // I'm not quite sure how PFont works. This may be redundant as I'm dynamically creating a font below with creatFont()       
fill(200);                                      // Set fill to light grey
font = createFont("Baskerville", 16);           // create font variable
textFont(font);                                 // set active font to baskerville
text("tick tock", -25, 0);                      // render text to sketch



