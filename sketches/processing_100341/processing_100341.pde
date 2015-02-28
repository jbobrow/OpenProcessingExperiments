
float x = 200;           // X-coordinate
float y = 388;          // Y-coordinate
int radius = 45;        // Head Radius
int thighHeight = 200;   // Body Height
int calfHeight = 200;    // Neck Height
int legBone = 100;

float easing = 0.02;

void setup() {
  size(500, 500);
  smooth();
  frameRate(40);
  ellipseMode(RADIUS);
}

void draw() { 
  
    int targetX = mouseX;
  x += (targetX - x) * easing;
  
    int targetY = mouseY;
  y += (targetY - y) * easing;

  float legy = y-130;
  float legy2 = y+30;
  float legLength = legy2-legy;
  float legMiddle = legy + legLength/2;
  float footTop = legy2+20;
  
  if (mousePressed) {
    legy2 = y-50;
    legMiddle = (legy + legLength/2) - 35;
    footTop = legy2+20;
  } else {
    legy2 = y+30;
  }


  noStroke();
  background(30);
  
// Head
smooth();
fill(255);
triangle(x+50, y-358, x+47, y-318, x+53, y-318); // Antenna
ellipse(x+50, y-358, 10, 10);              // Antenna
fill(222, 71, 42); // color flame
rect(x+10, y-318, 80, 80, 20, 20, 20, 20); // Head

fill(209, 45, 28); // color dark red
ellipse(x+31, y-286, 11, 11);             // Left Eye
ellipse(x+71, y-286, 11, 11);             // Right Eye
fill(255); // color white
ellipse(x+30, y-288, 10, 10);             // Left Eye
ellipse(x+70, y-288, 10, 10);             // Right Eye
noFill();
stroke(255);
strokeWeight(5);
arc(x+50, y-268, 20, 15, 0, PI);          // Smile
noStroke();


// Body
smooth();
fill(255); // color white
stroke(255);

line(x+25, legy, x+25, legy2); // Left LEG *************

line(x+75, legy, x+75, legy2); // Right LEG ************

line(x+10, y-224, x-70, 200); // Left Arm
line(x+90, y-224, x+170, 200); // Right Arm
noStroke();
fill(222, 71, 42); // color flame
ellipse(x+10, y-221, 15, 15); // Left Shoulder
ellipse(x+90, y-221, 15, 15); // Right Shoulder


// Legs
fill(255); // color white

fill(222, 71, 42); // color flame
ellipse(x+25, legy, 15, 15);            // Left Hip
ellipse(x+25, legMiddle, 15, 15);             // Left Knee *************
fill(255); // color white
fill(222, 71, 42); // color flame
ellipse(x+75, y-130, 15, 15);            // Right Hip
ellipse(x+75, legMiddle, 15, 15);             // Right Knee *************

//arc(x+25, y+50, 20, 20, -PI, 0);         // Left Foot **********
//arc(x+75, y+50, 20, 20, -PI, 0);         // Right Foot ************
arc(x+25, footTop, 20, 20, -PI, 0);         // Left Foot **********
arc(x+75, footTop, 20, 20, -PI, 0);         // Right Foot ************


// joint ellipses
stroke(209, 45, 28);
strokeWeight(3);
ellipse(x+10, y-221, 6, 6); // Left Shoulder
ellipse(x+90, y-221, 6, 6); // Right Shoulder

ellipse(x+25, y-130, 6, 6);             // Left Hip
ellipse(x+25, legMiddle, 6, 6);             // Left Knee *************

ellipse(x+75, y-130, 6, 6);             // Right Hip
ellipse(x+75, legMiddle, 6, 6);             // Right Knee *************
noStroke();


fill(222, 71, 42); // color flame
beginShape();
vertex(x+55, y-238); // Right Neck Up
vertex(x+55, y-228); // Right Neck Down
vertex(x+80, y-228); // Right Shoulder
vertex(x+80, y-188);
vertex(x+60, y-118); // Right Crotch
vertex(x+40, y-118); // Left Crotch
vertex(x+20, y-188);
vertex(x+20, y-228); // Left Shoulder
vertex(x+45, y-228); // Left Neck Down
vertex(x+45, y-238); // Left Neck Up
endShape();






//chest shit
stroke(209, 45, 28);
strokeWeight(3);
quad(x+73, y-184, x+55, y-126, x+45, y-126, x+28, y-184);
line(x+42, y-138, x+58, y-138);
line(x+25, y-222, x+75, y-222);
noFill();
arc(x+25, footTop-1, 10, 10, PI, TWO_PI);  // L_Foot ******
arc(x+75, footTop-1, 10, 10, PI, TWO_PI);  // R_Foot ******

// chest hairs
stroke(255);
strokeWeight(2);
for (float i = x+25; i < x+75; i += 6) {
  line( i, y-213, i, y-193);
}

// toe nails **************
stroke(255);
strokeWeight(2);
for (float i = x+9; i < x+41; i += 5) {
  line( i, footTop-3, i, footTop+2);
}
for (float i = x+59; i < x+91; i += 5) {
  line( i, footTop-3, i, footTop+2);
}

} //end draw
