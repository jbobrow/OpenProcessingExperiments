
// Drawing the Time
// From http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-07.pdf


void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {
translate(width/2, height/2);
background(0);
noStroke();
fill(80);
// Angles for sin() and cos() start a 3 o'clock,
// subtract HALF_PI to make them start at the top
ellipse(0, 0, 180, 180);
stroke(255);
strokeWeight(4);   // Thicker
float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
line(0, 0, cos(s) * 80, sin(s) * 80);
line(0, 0, cos(m) * 60 * 2, sin(m) * 60);
line(0, 0, cos(h) * 30 * 2, sin(h) * 30);
}

                
                
