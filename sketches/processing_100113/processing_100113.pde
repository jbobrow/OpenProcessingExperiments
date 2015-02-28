
float x = 200;           // X-coordinate
float y = 440;          // Y-coordinate
int radius = 45;        // Head Radius
int thighHeight = 160;   // Body Height
int calfHeight = 70;    // Neck Height

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

  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }

  float ny = y - bodyHeight - neckHeight - radius;
  noStroke();
  background(30);
  
// Head
smooth();
fill(255);
triangle(x+50, 30, x+47, 70, x+53, 70);   // Antenna
ellipse(x+50, 30, 10, 10);              // Antenna
fill(222, 71, 42); // color flame
rect(x+10, 70, 80, 80, 20, 20, 20, 20); // Head

fill(209, 45, 28); // color dark red
ellipse(x+31, 102, 11, 11);             // Left Eye
ellipse(x+71, 102, 11, 11);             // Right Eye
fill(255); // color white
ellipse(x+30, 100, 10, 10);             // Left Eye
ellipse(x+70, 100, 10, 10);             // Right Eye
noFill();
stroke(255);
strokeWeight(5);
arc(x+50, 120, 20, 15, 0, PI);          // Smile
noStroke();


// Body
smooth();
fill(255); // color white
stroke(255);
line(x+25, 338, x+25, 418); // Left Calf
line(x+25, 258, x+25, 338); // Left Thigh
line(x+75, 338, x+75, 418); // Right Calf
line(x+75, 258, x+75, 338); // Right Thigh

line(x+10, 164, x-70, 260); // Left Arm
line(x+90, 164, x+170, 260); // Right Arm
noStroke();
fill(222, 71, 42); // color flame
ellipse(x+10, 167, 15, 15); // Left Shoulder
ellipse(x+90, 167, 15, 15); // Right Shoulder


// Legs
fill(255); // color white

fill(222, 71, 42); // color flame
ellipse(x+25, 258, 15, 15);             // Left Hip
ellipse(x+25, 338, 15, 15);             // Left Knee
fill(255); // color white
fill(222, 71, 42); // color flame
ellipse(x+75, 258, 15, 15);             // Right Hip
ellipse(x+75, 338, 15, 15);             // Right Knee

arc(x+25, 438, 20, 20, -PI, 0);         // Left Foot
arc(x+75, 438, 20, 20, -PI, 0);         // Right Foot



// joint ellipses
stroke(209, 45, 28);
strokeWeight(3);
ellipse(x+10, 167, 6, 6); // Left Shoulder
ellipse(x+90, 167, 6, 6); // Right Shoulder

ellipse(x+25, 258, 6, 6);             // Left Hip
ellipse(x+25, 338, 6, 6);             // Left Knee

ellipse(x+75, 258, 6, 6);             // Right Hip
ellipse(x+75, 338, 6, 6);             // Right Knee
noStroke();


fill(222, 71, 42); // color flame
beginShape();
vertex(x+55, 150); // Right Neck Up
vertex(x+55, 160); // Right Neck Down
vertex(x+80, 160); // Right Shoulder
vertex(x+80, 200);
vertex(x+60, 270); // Right Crotch
vertex(x+40, 270); // Left Crotch
vertex(x+20, 200);
vertex(x+20, 160); // Left Shoulder
vertex(x+45, 160); // Left Neck Down
vertex(x+45, 150); // Left Neck Up
endShape();






//chest shit
stroke(209, 45, 28);
strokeWeight(3);
quad(x+73, 204, x+55, 262, x+45, 262, x+28, 204);
line(x+42, 250, x+58, 250);
line(x+25, 166, x+75, 166);
noFill();
arc(x+25, 435, 10, 10, PI, TWO_PI);  // L_Foot
arc(x+75, 435, 10, 10, PI, TWO_PI);  // L_Foot

// chest hairs
stroke(255);
strokeWeight(2);
for (float i = x+25; i < x+75; i += 6) {
  line( i, 175, i, 195);
}

// toe nails
stroke(255);
strokeWeight(2);
for (float i = x+9; i < x+41; i += 5) {
  line( i, 434, i, 440);
}
for (float i = x+59; i < x+91; i += 5) {
  line( i, 434, i, 440);
}

} //end draw
