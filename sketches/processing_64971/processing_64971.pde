
// Jeff Chien

// Init
size(640, 360);
background(207, 166, 107);
smooth();
noStroke();

// Canvas
fill(233, 222, 195);
rect(20, 10, 603, 300);

// Strange 3D object SE of blue block
{
  fill(185, 150, 140);
  beginShape();
  vertex(313, 195);
  vertex(329, 205);
  vertex(400, 185);
  vertex(373, 169);
  vertex(363, 171);
  endShape(CLOSE);
  
  fill(40);
  quad(313, 195, 329, 205, 329, 211, 307, 197);
    
  fill(235, 225, 200);
  stroke(220, 210, 193);
  strokeWeight(1);
  quad(376, 197, 382, 220, 386, 219, 380, 196);
  
  fill(85, 70, 60);
  triangle(376, 197, 382, 220, 356, 203);
  
  fill(230, 215, 175);
  quad(329, 205, 329, 211, 401, 189, 400, 185);
}

// Cube behind blue and red blocks
stroke(220, 210, 193);
fill(223, 216, 200);
quad(154, 156, 206, 144, 199, 124, 173, 130);
noStroke();
fill(35, 40, 65);
quad(154, 156, 206, 144, 209, 156, 158, 168);

// Black block above blue block
fill(25);
quad(257, 68, 339, 54, 344, 68, 260, 84); 

// Big blue block
fill(99, 163, 203);
quad(190, 93, 330, 64, 365, 184, 225, 213);

// Red block on left side
fill(232, 35, 32);
quad(36, 194, 270, 143, 279, 170, 46, 220);

// Lower right triangle
fill(255, 48, 38);
triangle(402, 209, 554, 190, 432, 254);

// Black ellipse
fill(40);
ellipse(234, 211, 96, 82);

// Arcs to right of blue block
{
  noFill();
  strokeCap(SQUARE);
  
  // Blue
  stroke(99, 163, 203);
  strokeWeight(23);
  arc(244, 4, 320, 290, radians(25), radians(45));
  
  // White
  stroke(205, 195, 175);
  strokeWeight(26);
  arc(244, 4, 300, 280, radians(15), radians(40));
  
  // Red
  stroke(237, 40, 40);
  strokeWeight(19);
  arc(244, 4, 280, 260, radians(27), radians(80));

  noStroke();
}

// Lower left 3D block
{
  fill(248, 48, 40);
  quad(162, 288, 210, 188, 215, 192, 168, 290);
  stroke(220, 210, 193);
  strokeWeight(1);
  fill(232, 223, 202);
  quad(215, 192, 168, 290, 185, 283, 229, 187);
  fill(220, 210, 193);
  quad(215, 192, 210, 188, 223, 184, 229, 187);
  noStroke();
}

// Lower left: gray
fill(170, 170, 170);
quad(169, 229, 171, 237, 259, 220, 256, 212);

// Lower left: Yellow L
fill(231, 189, 60);
beginShape();
vertex(181, 217);
vertex(183, 228);
vertex(225, 220);
vertex(228, 228);
vertex(239, 226);
vertex(235, 205);
endShape(CLOSE);

// Yellow block to the right
fill(235, 210, 160);
quad(563, 151, 446, 70, 430, 75, 544, 157);
stroke(187, 137, 66);
strokeWeight(2);
line(563, 151, 446, 70);
stroke(0);
line(430, 75, 446, 70);
noStroke();

// Long white/red line
fill(200, 200, 200, 200);
quad(235, 179, 237, 183, 448, 140, 447, 137);
stroke(232, 35, 32);
strokeWeight(1);
line(237, 183, 448, 140);

// Long black line
stroke(40);
strokeWeight(3);
line(300, 160, 598, 101);

// Short white/red line
stroke(200);
strokeWeight(2);
line(375, 179, 420, 169);
stroke(232, 35, 32);
strokeWeight(1);
line(378, 179, 420, 170);
noStroke();

// Right white/red line
fill(232, 35, 32);
quad(413, 118, 414, 122, 543, 103, 542, 100);
fill(223, 223, 197);
quad(413, 118, 410, 116, 539, 98, 542, 100);
fill(0);
quad(414, 122, 413, 118, 410, 116, 410, 119);


