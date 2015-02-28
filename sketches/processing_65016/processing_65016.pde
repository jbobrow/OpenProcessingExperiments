
void setup()
{
  size(640, 360);
  smooth();
  noStroke();
}

void draw()
{
  background(231, 220, 203); //background grey color
  
  fill(52, 49, 45);
  quad(639, 141, 614, 124, 592, 132, 639, 166); //black stripe on the left side
  
  fill(164, 145, 143);
  triangle(639, 141, 614, 124, 639, 117); //grey triangle above black left side
  
  fill(105, 146, 190);
  quad(493, 159, 639, 122, 639, 0, 360, 0); //blue rectangle left side
  
  fill(217, 48, 53);
  quad(0, 129, 487, 10, 484, 0, 0, 0); //red quad top left
  
  fill(42, 39, 38);
  ellipse(304, 200, 389, 357); //black circle center
  
  stroke(80);
  fill(206, 205, 203);
  quad(515, 0, 305, 48, 308, 67, 599, 0); //grey part of top block (above red)
  
  noStroke();
  fill(178, 27, 24);
  quad(308, 67, 599, 0, 633, 0, 315, 75); //red part of top block (above grey)
  
  fill(207, 47, 44);
  quad (93, 359, 201, 90, 228, 104, 123, 359); //red part of middle block

  fill(227, 220, 204);
  quad (201, 90, 257, 68, 285, 83, 228, 104); //grey part of middle block - top
  
  stroke(150);
  fill(227, 220, 204);
  quad(228, 104, 285, 83, 174, 359, 123, 359); //grey part of middle block - side
  
  noStroke();
  fill(163, 166, 163);
  quad(34, 285, 397, 200, 406, 240, 43, 324); //grey stripe center bottom (below yellow)
  
  beginShape();
  fill (228, 195, 79);
  vertex(92, 272);
  vertex (83, 225);
  vertex (307, 170);
  vertex (332, 271);
  vertex (279, 284);
  vertex (267, 231);
  endShape(CLOSE);
}

