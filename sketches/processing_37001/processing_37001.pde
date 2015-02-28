
/*
An object to be used for continuing examples
in the Processing course.
By Barton Poulson
13 September 2011
*/

// This is a version of Baba Yaga's house with the chicken legs
// from the Russian fairy tales.

size(450, 450);
translate(width/2, height/2);            // Moves the origin to the center of the screen
rectMode(CENTER);                        // Draws the rectangle from the center.
rect(0, 0, 100, 100);                    // The box for the house.
triangle(-75, -50, 75, -50, 0, -90);     // The roof.
line(-30, 50, -30, 100);                 // Left leg.
line(30, 50, 30, 100);                   // Right leg.
triangle(-30, 100, -30, 120, -70, 120);  // Left foot.
triangle(30, 100, 30, 120, 70, 120);     // Right foot.
fill(0);                                 // Makes the door black in the next line.
rect(0, 25, 30, 50);                     // Door
                                                
