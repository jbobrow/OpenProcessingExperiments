
PImage img;
  img = loadImage("disco.jpg");
  size(720, 480);
  image(img, 0, 0, 720, 480);

size(720, 480);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);

//Neck
stroke(0);                                     // Set stroke to gray
line(260, 250, 260, 160);                      // Left
line(270, 250, 270, 160);                      // Right

//Antennae
line(270, 110, 260, 80);                       // Antennae
line(199, 155, 342, 155);                      // Horizontal antennae
noStroke();              
fill(0);                                       // Antennae dots                                         
ellipse(260, 80, 4, 4);                       
ellipse(199, 155, 4, 4);
ellipse(342, 155, 4, 4);

//bottom orbit
noStroke();                                    // Disable stroke
fill(102);                                     // Set fill to gray
ellipse(268, 355, 35, 35);                     // Antigravity orb
fill(0);                                       // Set fill to black

//Mainbody
fill(137, 139, 144);                           // Set fill to dark gray
rect(223, 235, 90, 120 );                      // Mainbody
rect(189, 245, 70, 9);                         // L Arm
rect(189, 245, 9, 70);                         // L Arm
rect(178, 306, 20, 9);                         // L Arm

rect(275, 245, 70, 9);                         // R Arm
rect(336, 180, 9, 70);                         // R Arm
rect(336, 180, 20, 9);

fill(198, 200, 206);                           // Set fill to gray
rect(232, 270, 75, 30);                        // Gray buttons

fill(163, 179, 237);                           // Set fill to blue
rect(232, 280, 75, 8);                         // blue stripe
  
fill(232, 56, 121);                            // set fill to red 
rect(232, 305, 8, 8);                          // Small buttons1

fill(232, 144, 56);                            // Set fill to orange
rect(254, 305, 8, 8);                          // Small buttons2

fill(183, 203, 68);                            // Set fill to lime
rect(276, 305, 8, 8);                          // Small buttons3

fill(68, 203, 146);                            // Set fill to green
rect(298, 305, 8, 8);                          // Small buttons4

//Head
fill(137, 139, 144);                           // Set fill to grey
rect(219, 110, 100, 100);                      // Head
rect(219, 119, 80, 9);

// mouoth
fill(255);
rect(250, 180, 30, 9);
//eyes
fill(255);                                     // Set fill to white
ellipse(288, 150, 14, 14);                     // R Outer eye
ellipse(244, 150, 14, 14);                     // L Outer eye
fill(0);                                       // Set fill to black
ellipse(288, 155, 9, 9);                       // R eyeball
ellipse(244, 155, 9,9);                        // L eyeball



