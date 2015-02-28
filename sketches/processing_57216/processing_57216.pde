
boolean button = false; // Skull eyes button

import ddf.minim.*; // Imports the library b/c Minim is not built-in
Minim minim; // declares "minim" to be a on object of type "Minim"
AudioPlayer WindSd; // Creates one object of type AudioPlayer

// Declare shapes and Images as variables - to contain svg files
PImage Bkgds;  // Background
PShape ArBs; // Armadillo Body
PShape Hds; // Armadillo Head
PShape Shs; // Short Hand
PShape Lhs; // Long Hand
PImage Skl; // Skull

// Global variables for animation and interactivity
int time = 0; // Keeps track of time passing in my sketch
float opac = 1; // Causes background to get light to dark rapidly
float deg = -5; // Degrees for long hand
float x = -.0044  ; // Degrees for short hand
float a = 1; // Alpha
float headW = 79; // Scale armadillo's head width
float headH = 130; // Scale armadillo's head height
float r = random (255); // Red
float g = random (255); // Green
float b = random (255); // Blue
float skla = 0; // Skull alpha
// Tree
float xpos1 = 203.13; // R LongBranch
float xpos2 = 210.75; // R Middle Short Branch
float xpos3 = 309.67; // L Small Middle Branch
float xpos4 = 308.05; // Left Branch
float xpos5 = 269; // Long Middle Branch Light Brown
float xpos6 = 206.25; // L Tiny Middle Branch X Position
float ypos6 = 251;  // L Tiny Middle Branch Y position
float xspeed1 = .1;
float xspeed2 = .15;
float xspeed3 = .05;
float xspeed4 = .05;
float xspeed5 = .05;
float xspeed6 = .25;
float yspeed6 = .25;

void setup() {
  size (800, 600);
  smooth ();
  
// Create an instance of Minim and use this instance to load the Wind.wav into the AudioPlayer object
  minim = new Minim(this); 
  WindSd = minim.loadFile("Wind.wav"); // Wind sound was recorded by Mike Koenig.
  
// Initialize shape and image variables with loadShape and loadImage function
  Bkgds = loadImage("Landscape_Background.jpg");
  ArBs = loadShape ("Armadillo_Body.svg");
  Hds = loadShape ("Head.svg");
  Shs = loadShape ("Shorthand.svg");
  Lhs = loadShape ("Long_Hand.svg");
  Skl = loadImage ("Skull.png");
}


void stop() {
 minim.stop(); // stop Minim
}
    
void draw() {
  smooth();  

  // Display Shapes and Images
  tint(255, 255);  // White tint color, alpha
  image (Bkgds, 0, 0);  // Background
  shape (ArBs, 571, 430); // Armadillo Body
  shape (Hds, 568, 520, headW, headH); // Armadillo Head
  
 // Draw R Long Branch
  beginShape();
  noStroke();
  fill(14, 14, 15);
  vertex (xpos1-69.38, 187);
  vertex (xpos1-52.38, 210);
  vertex (xpos1-47.38, 233.5);
  vertex (xpos1-42.88, 267.5);
  vertex (xpos1-42.88, 298);
  vertex (xpos1-38.63, 306.25);
  vertex (xpos1-27.88, 282.75);
  vertex (xpos1-39.13, 322.5);
  vertex (xpos1-42.88, 358.25);
  vertex (xpos1-41.13, 405.25);
  vertex (xpos1-23.13, 434.75);
  vertex (xpos1, 457.55);
  vertex (xpos1-3.74, 477.97);
  vertex (xpos1-37.63, 437.75);
  vertex (xpos1-54.38, 385.5);
  vertex (xpos1-49.88, 320.75);
  vertex (xpos1-51.88, 290.25);
  vertex (xpos1-53.63, 287.5);
  vertex (xpos1-50.88, 282);
  vertex (xpos1-70.49, 253);
  vertex (xpos1-67.88, 251);
  vertex (xpos1-49.88, 269.25);
  vertex (xpos1-49.38, 256.25);
  vertex (xpos1-51.63, 233);
  vertex (xpos1-56.88, 212.75);
  vertex (xpos1-69.38, 190.75);
  endShape(CLOSE);

  xpos1 = xpos1 + xspeed1; // Change the location by speed
  if (xpos1 > 209 || xpos1 < 203.13 ) {
    xspeed1 = xspeed1 * -1; // Reverses the speed
  }

  // Draw R Middle Short Branch
  beginShape();
  noStroke();
  fill(16, 15, 13);
  vertex (xpos2-95.75, 307.25);
  vertex (xpos2-63, 312.77);
  vertex (xpos2-43.57, 319);
  vertex (xpos2-18.75, 337.25);
  vertex (xpos2-15, 340.44);
  vertex (xpos2, 354.25);
  vertex (xpos2, 364);
  vertex (xpos2-10.13, 367.08);
  vertex (xpos2-25.25, 358.77);
  vertex (xpos2-64.5, 358.77);
  vertex (xpos2-80.25, 360);
  vertex (xpos2-76, 355.5);
  vertex (xpos2-16.5, 353.25);
  vertex (xpos2-7.62, 355);
  vertex (xpos2-45.75, 324.25);
  endShape(CLOSE);

  xpos2 = xpos2 + xspeed2; // Change the location by speed
  if (xpos2 > 220 || xpos2 < 210) {
    xspeed2 = xspeed2 * -1; // Reverses the speed
  }

  // Draw L Small Middle Branch
  beginShape();
  noStroke();
  fill(11, 12, 13);
  vertex (xpos3-84.15, 377.55);
  vertex (xpos3-84.15, 369);
  vertex (xpos3-77.92, 360.25);
  vertex (xpos3-73.16, 358.46);
  vertex (xpos3-59.17, 362.25);
  vertex (xpos3-50.92, 365.5);
  vertex (xpos3-24.31, 359.67);
  vertex (xpos3-13.67, 358.31);
  vertex (xpos3-4.92, 365.5);
  vertex (xpos3-1.42, 361);
  vertex (xpos3-1.42, 358.33);
  vertex (xpos3, 355.67);
  vertex (xpos3-4.92, 360.5);
  vertex (xpos3-15.42, 353);
  vertex (xpos3-19.67, 351.67);
  vertex (xpos3-46.92, 359.5);
  vertex (xpos3-58.34, 355.25);
  vertex (xpos3-73.42, 352.5);
  vertex (xpos3-90.67, 363.25);
  vertex (xpos3-80.42, 333);
  vertex (xpos3-67.76, 337.05);
  vertex (xpos3-67.34, 333.33);
  vertex (xpos3-79.92, 330);
  vertex (xpos3-77.92, 318);
  vertex (xpos3-74.67, 294.25);
  vertex (xpos3-72.92, 275.75);
  vertex (xpos3-77.42, 289.5);
  vertex (xpos3-81.42, 282.25);
  vertex (xpos3-84.15, 287.25);
  vertex (xpos3-80.67, 304.75);
  vertex (xpos3-87.42, 326.65);
  vertex (xpos3-88.92, 312.75);
  vertex (xpos3-88.92, 304.25);
  vertex (xpos3-88.92, 282.25);
  vertex (xpos3-86.67, 278.75);
  vertex (xpos3-84.42, 283.25);
  vertex (xpos3-85.42, 275.75);
  vertex (xpos3-84.92, 264.25);
  vertex (xpos3-81.67, 264.25);
  vertex (xpos3-84.42, 261);
  vertex (xpos3-79.92, 253.5);
  vertex (xpos3-77.67, 248);
  vertex (xpos3-87.42, 255.75);
  vertex (xpos3-91.67, 271.75);
  vertex (xpos3-94.42, 281.5);
  vertex (xpos3-96.42, 301.25);
  vertex (xpos3-96.42, 375.5);
  endShape(CLOSE);

  xpos3 = xpos3 + xspeed3; // Change the location by speed
  if (xpos3 > 310 || xpos3 < 308) {
    xspeed3 = xspeed3 * -1; // Reverses the speed
  }

  // Draw Tree Trunk
  beginShape();
  noStroke();
  fill(17, 16, 17);
  vertex(227, 553);
  vertex(197.33, 553.67);
  vertex(197.88, 478.38);
  vertex(201.5, 456.63);
  vertex(201.63, 447.75);
  vertex(203.13, 416.5);
  vertex(205.88, 378.38);
  vertex(217.67, 377.5);
  vertex(225.67, 413);
  vertex(225.67, 423.67);
  vertex(225.67, 477);
  endShape(CLOSE);

  // Draw Left Branch
  beginShape();
  noStroke();
  fill(17, 16, 17);
  vertex (xpos4-82.38, 413);
  vertex (xpos4-102.17, 378.38);
  vertex (xpos4-81.38, 377.5);
  vertex (xpos4-68.88, 352.17);
  vertex (xpos4-65.72, 333.33);
  vertex (xpos4-59.88, 243.33);
  vertex (xpos4-57.88, 242);
  vertex (xpos4-57.88, 251.17);
  vertex (xpos4-56.72, 249.67);
  vertex (xpos4-54.72, 197.17);
  vertex (xpos4-52.72, 190.67);
  vertex (xpos4-44.55, 170.83);
  vertex (xpos4-52.05, 155.83);
  vertex (xpos4-56.72, 144);
  vertex (xpos4-60.05, 133.33);
  vertex (xpos4-62.05, 125.67);
  vertex (xpos4-58.72, 123.67);
  vertex (xpos4-56.05, 136.33);
  vertex (xpos4-48.72, 151.33);
  vertex (xpos4-44.38, 162);
  vertex (xpos4-41.05, 159);
  vertex (xpos4-40.38, 162.33);
  vertex (xpos4-44.05, 167);
  vertex (xpos4-44.05, 173.33);
  vertex (xpos4-49.38, 196.33);
  vertex (xpos4-49.38, 216.33);
  vertex (xpos4-42.38, 213.67);
  vertex (xpos4-42.38, 216.67);
  vertex (xpos4-49.20, 224.16);
  vertex (xpos4-52.86, 286.82);
  vertex (xpos4-40.30, 283);
  vertex (xpos4, 284.27);
  vertex (xpos4-1.72, 286.33);
  vertex (xpos4-21.55, 288.25);
  vertex (xpos4-41.30, 287.5);
  vertex (xpos4-52.72, 291);
  vertex (xpos4-53.05, 316.25);
  vertex (xpos4-35.80, 315.25);
  vertex (xpos4-21.55, 308.75);
  vertex (xpos4-20.35, 311.57);
  vertex (xpos4-39.55, 320);
  vertex (xpos4-47.05, 318.33);
  vertex (xpos4-52.72, 325);
  vertex (xpos4-60.38, 354.33);
  vertex (xpos4-60.38, 358.33);
  vertex (xpos4-66.38, 363.67);
  endShape(CLOSE);

  xpos4 = xpos4 + xspeed4; // Change the location by speed
  if ( xpos4 > 308 || xpos4 < 306) {
    xspeed4 = xspeed4 * -1; // Reverses the speed
  }

  // Draw Long Middle Branch Light Brown
  beginShape();
  noStroke();
  fill(37, 33, 31); 
  vertex (xpos5-63.07, 379.72);
  vertex (xpos5-66.75, 357.5); 
  vertex (xpos5-73.50, 345);
  vertex (xpos5-77.00, 332.5);
  vertex (xpos5-80.00, 296.75);
  vertex (xpos5-76.00, 274.75);
  vertex (xpos5-71.50, 259);
  vertex (xpos5-70.00, 244.75);
  vertex (xpos5-65.25, 232.25);
  vertex (xpos5-63.75, 208.75);
  vertex (xpos5-68.75, 203.25);
  vertex (xpos5-66.75, 202.25);
  vertex (xpos5-62.00, 204.25);
  vertex (xpos5-64.00, 190.75);
  vertex (xpos5-73.50, 186);
  vertex (xpos5-62.25, 183.5);
  vertex (xpos5-67.25, 146.75);
  vertex (xpos5-71.75, 140.75);
  vertex (xpos5-66.50, 138);
  vertex (xpos5-66.00, 126);
  vertex (xpos5-67.00, 123.17);
  vertex (xpos5-62.50, 117);
  vertex (xpos5-63.75, 100.5);
  vertex (xpos5-66.25, 89.5);
  vertex (xpos5-59.50, 97.5);
  vertex (xpos5-59.00, 81.75);
  vertex (xpos5-61.00, 68);
  vertex (xpos5-60.25, 64.28);
  vertex (xpos5-58.00, 65.5);
  vertex (xpos5-54.75, 65.3);
  vertex (xpos5-56.50, 72.25);
  vertex (xpos5-55.00, 75.75);
  vertex (xpos5-55.25, 125.75);
  vertex (xpos5-58.00, 125.75);
  vertex (xpos5-59.25, 146.25);
  vertex (xpos5-54.75, 163.5);
  vertex (xpos5-53.00, 183.75);
  vertex (xpos5-40.25, 167.5);
  vertex (xpos5-37.25, 166.25);
  vertex (xpos5-38.50, 170.25);
  vertex (xpos5-36.75, 171);
  vertex (xpos5-16.42, 156);
  vertex (xpos5-7.54, 151.5);
  vertex (xpos5, 147.25);
  vertex (xpos5-12.14, 157.85);
  vertex (xpos5-36.25, 177.75);
  vertex (xpos5-40.00, 177.75);
  vertex (xpos5-53.69, 198);
  vertex (xpos5-53.75, 216.25);
  vertex (xpos5-59.75, 261.5);
  vertex (xpos5-67.25, 301.75);
  vertex (xpos5-55.75, 337);
  vertex (xpos5-43.48, 377.53);
  vertex (xpos5-48.50, 385.5);
  endShape(CLOSE);

  xpos5 = xpos5 + xspeed5; // Change the location by speed
  if (xpos5 > 270 || xpos5 < 268) {
    xspeed5 = xspeed5 * -1; // Reverses the speed
  }

  // Draw L Tiny Middle Branch
  beginShape();
  noStroke();
  fill(2, 2, 3);
  vertex (xpos6-5.00, ypos6);
  vertex (xpos6-7.45, ypos6-7.27);
  vertex (xpos6-22.00, ypos6-40.00);
  vertex (xpos6-27.25, ypos6-67.50);
  vertex (xpos6-36.00, ypos6-87.75);
  vertex (xpos6-36.25, ypos6-92.50);
  vertex (xpos6-34.75, ypos6-97.75);
  vertex (xpos6-23.75, ypos6-64.25);
  vertex (xpos6-16.75, ypos6-40.50);
  vertex (xpos6-2.50, ypos6-18.75);
  vertex (xpos6, ypos6-12.25);
  endShape(CLOSE);

  xpos6 = xpos6 + xspeed6; // Change the location by speed
  ypos6 = ypos6 + xspeed6;
    if (xpos6 > 258 || xpos6 < 300 && ypos6 > 250 || ypos6 < 247) {
      xspeed6 = xspeed6 * -1; // Reverses the speed
      yspeed6 = yspeed6 * -1; // Reverses the speed
  }
  
  fill(0, 0, 0, a);
  rect (0, 0, 800, 600);
  time++;  // Time increments by 1
    if (time>2500){  // Higher the time causes background to change less frequently
        time=0;  // If time is greater than 2500, time is reset to 0
 }
  
  a = a + opac; // Increments alpha by opac
    if (time==0 || time==2000 || a==0 || a==255) {
        opac = opac*-1; // Reverses opac
}
 
 // Local Variables: Clock
 for (int i = 480; i < 551; i+=66) { // Horizontal circles 
    for (int j = 118; j < 189; j+=66) { // Vertical circles
     fill (random(0,255));
      ellipse (i,151,5,5);
      ellipse(513,j,5,5);
     }
    } 
    
  // Draw Light Gray Clock base
  noStroke();
  fill(180);
  ellipse (513, 151, 51, 51); 

  // Display Shapes:
  // Broke up display shapes so clock base goes behind Hands
  shape (Shs, 510, 151); // Short Hand
  shape (Lhs, 510.5, 151);  // Long Hand

  // Draw White Center Circle
  strokeWeight (2);
  stroke(120);
  fill(230);
  ellipse (513, 151, 15, 15);

  // Draw Center Orange Circle
  noStroke();
  fill (160, 129, 6);
  ellipse (513, 151, 5, 5);
  
   // Hot spot on Armadillo's head to scale larger
   if (mouseX > 520 && mouseX < 580 && mouseY > 478 && mouseY < 600) {
     headW++;
     headH++;
   }  else {
     headW--;
     headH--;
   } 
  headW = constrain (headW,79,219);
  headH = constrain (headH,130,270);

  // Hot spot on Clock to rotate clockwise
  if (mouseX > 476 && mouseX < 555 && mouseY > 112 && mouseY < 189) {
    Shs.rotate(-x);
    Lhs.rotate(radians(-deg));
   } else {  
    Shs.rotate(x);
    Lhs.rotate(radians(deg));
   }
  
  // Local variables: Skull's button eyes
   if (button) {
     for (int k = 53; k < 149; k+=55) { 
        fill(r,g,b);
        ellipse (k,440,5,5);    
      }
   }
   
   tint(255, skla); // (White tint color, Skull Alpha)
   image (Skl, -15, 320); // Skull
  
   // Hot spot on Rock to make skull fade in
   if (mouseX > 0 && mouseX < 318 && mouseY > 256 && mouseY < 551 || mouseX > 476 && mouseX < 555 && mouseY > 112 && mouseY < 189) {
      skla+=5;
   } else {
      skla-=5;
    }
    skla = constrain(skla, 0,255);

// Cause the WindSd to play using the play() method
WindSd.play();
}

void mousePressed() {
   button = !button;
   r = random (255); // Red
   g = random (255); // Green
   b = random (255); // Blue
 }
 

