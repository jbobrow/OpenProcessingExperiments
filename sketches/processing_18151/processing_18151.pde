
//Week one homework: Image Recreation, by Chen^2, 2011
//ID: 1337399

//setup

void setup()
{
  
  size(500, 500);
  background(0);
  
}

//HL2 logo

void draw()
{
  color black = color(#000000);
  color orange = color(#e16919);
  color grey = color(#2b2b2b);
  fill(orange);
  noStroke();
  
//The harder way:
  
//  arc(220, 255, 230, 230, PI, TWO_PI-PI/2);
//  arc(220, 256, 230, 230, PI/2, PI);
//  arc(221, 255, 230, 230, TWO_PI-PI/2, TWO_PI);
//  arc(221, 256, 230, 230, 0, PI/2);

//...And the easier way.

 arc(221, 255, 230, 230, PI/2-1, PI+1.56);
  
//  noFill();
  fill(orange);
  stroke(orange);
  arc(350, 180, 80, 80, TWO_PI-PI/2, TWO_PI+.5);
  
//MiddlePiece
  
  beginShape();
  
  fill(orange);

//The harder way:  

//  line(350, 139, 385, 200);
//  line(220, 139, 350, 139);
//  line(385, 200, 318, 317);
//  line(220, 139, 220, 250);

//...And the easier way.
  
  vertex(220, 139);
  vertex(350, 139);
  vertex(385, 200);
  vertex(318, 317);
  vertex(220, 254);
  
  endShape(CLOSE);
  
//Inner ellipse

  fill(black);
  noStroke();
  ellipse(220, 255, 191, 191);
  
//The lambda sign:
  
  beginShape();
  
  fill(orange);
  stroke(black);
  vertex(184, 190);
  vertex(220, 190);
  vertex(258, 285);
  vertex(274, 279);
  vertex(284, 300);
  vertex(242, 316);
  vertex(218, 250);
  vertex(185, 313);
  vertex(161, 313);
  vertex(205, 225);
  vertex(200, 210);
  vertex(184, 210);
  
  endShape(CLOSE);
  
//Whew! What a chore! All that measuring is making me thirsty. Probably be
// easier in a Java IDE.
    
//The 2 on the right:

  beginShape();
  
  fill(black);
  stroke(black);
  vertex(322, 160);
  bezierVertex(327, 140, 384, 147, 345, 190);
//  bezierVertex(310, 130, 380, 135, 310, 165);   Dear god...
  curveVertex(345, 190);
  curveVertex(340, 195);
  curveVertex(338, 200);
  curveVertex(339, 205);
  curveVertex(340, 207);
  vertex(343, 205);
  vertex(359, 205);
  vertex(359, 215);
  vertex(323, 215);
  vertex(323, 204);
  
  bezierVertex(327, 190, 345, 180, 347, 167);
  
  curveVertex(347, 167);
  curveVertex(350, 163);
  curveVertex(341, 159);
  curveVertex(338, 159);
  curveVertex(338, 157);

  vertex(329, 161);  
  vertex(322, 165);
  vertex(322, 160);
  
  endShape(CLOSE);
  
//HL, too many coordinate.
  
  beginShape();
  fill(orange);
  vertex(175, 400);
  vertex(185, 400);
  vertex(185, 430);
  vertex(215, 430);
  vertex(215, 400);
  vertex(225, 400);
  vertex(225, 470);
  vertex(215, 470);
  vertex(215, 440);
  vertex(185, 440);
  vertex(185, 470);
  vertex(175, 470);
  endShape(CLOSE);
  
  beginShape();
  fill(orange);
  vertex(255, 400);
  vertex(265, 400);
  vertex(265, 460);
  vertex(300, 460);
  vertex(300, 470);
  vertex(255, 470);
  endShape(CLOSE);
  
//to see where all of those little coordinates are.
  
  println("X: " + mouseX);
  println("Y: " + mouseY);
  
}


