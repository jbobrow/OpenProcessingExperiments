
int heightRoof = int(random(10, 200));              // Randomizes heith of roof
int heightLegs = int(random(10, 100));              // Rondomizes height of legs
int widthFeet = int(random(10, 200));               // Randomizes width of the feet
float r = random(255);                              //Randomizes color of everything
float g = random(255);
float b = random(255);

background(0, 180, 200);
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
fill(234);                                          // Makes the door/windows white.
rect(0, 25, 30, 50);                                // Door.
rect(30, -23, 25, 25);                              // Window right.
rect(-30, -23, 25, 25);



