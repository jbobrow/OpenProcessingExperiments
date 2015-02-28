
// Archer the Seal
// ITGM 315 Fundamentals of Programming for Artists
// Tian Chen
// Assignement 1 Part 3
// Part 2:  The creature is redrawn to the localx and localy.  Once the left mouse is pressed,
// then the creature will follow the cursor around, but once the mouse is released, the creature
// will go back to the localx and localy.  Archer's horn will also change colors and the background will change colors.
// When the right mouse is clicked, Archer's spots will change to cyan and purple colors.  When a key is pressed,
// Archer will blink.

int localx = 400;
int localy = 435;

// New variables for colors on his body
color black = 0;
color white = 255;
color g1=80; color g2=100; color g3=120; color g4=160; 
color g5=185; color g6=120; color g7=140; color g8=150;
color g9=170; color g10=220; color g11=240;

// Body spot colors
color s1=g1; color s2=g2;

//New variables for rainbow color change when left mouse is pressed
void setup() {
  size(800,800);
}

void draw() {
  background(mouseX/2,mouseY/2,204);

 
  draw_creature(localx,localy);// States new location to draw the creature
}

void draw_creature (int localx, int localy){
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  if (mousePressed) {
    if (mouseButton == LEFT)
    {
      s1=color(random(255), random(255), random(255));
      s2=color(random(255), random(255), random(255));
    }
  }


// Everytime the left mouse is pressed, the position of the creature will
// reposition itself onto the mouse cursor  
  

// Main Body Components  
// Right Arm
  noStroke();
  fill(g5);
  quad(mouseX+10 ,mouseY-100, mouseX+20, mouseY-35, mouseX+60, mouseY-105, mouseX+50, mouseY-125);
  triangle(mouseX+50, mouseY-125, mouseX+60, mouseY-105, mouseX+95, mouseY-135);

// Left Arm
  noStroke();
  fill(g5);
  quad(mouseX-95, mouseY+25, mouseX-80, mouseY+45, mouseX-20, mouseY-5, mouseX-50, mouseY-95);
  triangle(mouseX-95, mouseY+25, mouseX-80, mouseY+45, mouseX-127, mouseY+45);

// Legs
  noStroke();
  fill(g5);
  quad(mouseX+90, mouseY-25, mouseX+110, mouseY+10, mouseX+145, mouseY-10, mouseX+160, mouseY-55); // Right Legs
  fill(g2);
  quad(mouseX+120, mouseY-5, mouseX+80, mouseY+25, mouseX+160, mouseY+55, mouseX+145, mouseY+10); // Leg Legs

// Body
  noStroke();
  fill(g3);
  ellipse(mouseX+35, mouseY, 190, 100); // Lower Body
  ellipse(mouseX-20, mouseY-55, 110, 180); // Upper Body

//Body Spots
  noStroke();
  fill(s2);
  ellipse(mouseX-50, mouseY-55, 50, 50);
  fill(s2);
  ellipse(mouseX+10, mouseY-75, 20, 20);
  fill(s1);
  ellipse(mouseX-30, mouseY+15, 40, 40);
  fill(s1);
  ellipse(mouseX-15, mouseY-5, 20, 20);
  fill(s1);
  ellipse(mouseX+50, mouseY-30, 35, 35);
  ellipse(mouseX+80, mouseY-10, 15, 15);
  fill(s2);
  ellipse(mouseX+40, mouseY+25, 25, 25);

// Head
  noStroke();
  fill(g4);
  ellipse(mouseX-40, mouseY-155, 105, 105);

// Eyes
  stroke(black); 
  fill(black);
  ellipse(mouseX-60, mouseY-145, 25, 25); //Left Eye
  ellipse(mouseX-20, mouseY-152, 25, 25); //Right Eye

// Eye highlights
  stroke(white);
  fill(white);
  ellipse(mouseX-66, mouseY-152, 10, 10); //Left Large Reflection
  ellipse(mouseX-60, mouseY-145, 6, 6); //Left small Reflection
  ellipse(mouseX-26, mouseY-159, 10, 10); //Right Large Reflection
  ellipse(mouseX-20, mouseY-152, 6, 6); //Right small Reflection

// Cheeks
  stroke(g4);
  strokeWeight(2);
  fill(g10);
  ellipse(mouseX-60, mouseY-110, 55, 55);
  ellipse(mouseX-6, mouseY-120, 55, 55);

// Nose
  stroke(g1);
  strokeWeight(2);
  fill(g4);
  ellipse(mouseX-36, mouseY-125, 35, 35);

// Horn
  noStroke();
  fill(g6);
  ellipse(mouseX-50, mouseY-195, 25, 25); // Bottom part of horn
  fill(g7);
  ellipse(mouseX-53, mouseY-205, 20, 20);
  fill(g8);
  ellipse(mouseX-55, mouseY-215, 17, 17);
  fill(g9);
  ellipse(mouseX-57, mouseY-223, 15, 15);
  fill(g10);
  ellipse(mouseX-59, mouseY-230, 12, 12);
  fill(g11);
  ellipse(mouseX-61, mouseY-237, 10, 10); // Tip of horn

// Whiskers
  stroke(black);
  fill(black);
  line(mouseX-65, mouseY-120, mouseX-100, mouseY-115);
  line(mouseX-65, mouseY-110, mouseX-90, mouseY-100);
  line(mouseX-3, mouseY-130, mouseX+30, mouseY-138);
  line(mouseX, mouseY-120, mouseX+25, mouseY-120);

}


