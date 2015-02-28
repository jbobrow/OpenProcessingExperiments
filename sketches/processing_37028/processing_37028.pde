
/*
BabaYagaHouse02Variables
"Baba Yaga House, version 02 using variables"

An object to be used for continuing examples
in the Processing course.
By Barton Poulson
13 September 2011

*/

// This is a version of Baba Yaga's house with the chicken legs
// from the Russian fairy tales.

int heightRoof = int(random(10, 200));
int heightLegs = int(random(10, 100));
int widthFeet = int(random(10, 200));
float r = random(255);
float g = random(255);
float b = random(255);

size(450, 450);
fill(r, g, b);
translate(width/2, height/2);                       // Moves the origin to the center of the screen
rectMode(CENTER);                                   // Draws the rectangle from the center.
rect(0, 0, 100, 100);                               // The box for the house.
triangle(-75, -50, 75, -50, 0, -50-heightRoof);     // The roof.
line(-30, 50, -30, 50+heightLegs);                  // Left leg.
line(30, 50, 30, 50+heightLegs);                    // Right leg.
triangle(-30,  50+heightLegs, -30, 70+heightLegs,   // Left foot.
  -30-widthFeet, 70+heightLegs);
triangle(30,  50+heightLegs, 30, 70+heightLegs,     // Right foot.
  30+widthFeet, 70+heightLegs);
fill(0);                                            // Makes the door black in the next line.
rect(0, 25, 30, 50);                                // Door
                                
