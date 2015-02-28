
void setup() {
  //do once

size(300,300); // Set the size of the window background(255); // Draw a black background smooth();
}

void draw() {
  //repeat endlessly

// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CORNER);
background(51);
smooth();

// Draw head
stroke(0);
fill(255,255,0);
quad(130, 100, 190, 100, 210, 150, 110, 150);

// Draw antennas
stroke(255);
line(155, 100, mouseX+20, mouseY-20);
line(165, 100, mouseX+50, mouseY-20);
fill(75, 255, 63);
stroke(0);
ellipse(mouseX+20, mouseY-20, 18, 18);
ellipse(mouseX+50, mouseY-20, 18, 18);

//Draw body
stroke(0);
fill(255,255,0);
rect(110,150,100,60);

//Draw legs
quad(60, 180, 110, 150, 110, 250, 60, 250);
quad(210, 150, 260, 180, 260, 250, 210, 250);

// Draw eyes
fill(255, 0, 0);
ellipse(145, 130, 12, 12);
ellipse(175, 130, 12, 12);

// Draw eyebrows
strokeWeight(2);
line(130, 130, 145, 110);
line(145, 110, 155, 120);
line(165, 120, 175, 110);
line(175, 110, 190, 130);

// Draw nose
fill(0);
rect(155, 150, 12, 16);

// Draw mouth
strokeWeight(1.5);
line(120, 175, 200, 175);

// Draw teeth
strokeWeight(1.5);
line(125, 175, 140, 195);
line(140, 195, 150, 175);
line(170, 175, 184, 195);
line(184, 195, 195, 175);
}



