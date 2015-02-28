
void setup () {
  size (500, 500);
  background (0, 0, 75);
  fill (0, 50, 25);
  smooth ();
  stroke (0, 50, 25);
  rect (0, 350, 500, 500);
  fill (150);
  stroke (150);
  ellipse(180, 180, 275, 100);
  fill (255, 0, 0);
  stroke (0, 0, 0);
  strokeWeight (10);
  ellipse (180, 180, 25, 25);
  ellipse (125, 180, 25, 25);
  ellipse (235, 180, 25, 25);
  ellipse (290, 180, 25, 25);
  ellipse (70, 180, 25, 25);
  strokeWeight (0);
  stroke (255, 255, 0);
  fill (255, 255, 0);
  arc(410, 100, 90, 90, PI/2, PI);
  arc (410, 100, 90, 90, 0, PI/2);
  arc (410, 100, 90, 90, PI, TWO_PI-PI/2);
  fill (0, 0, 75);
  stroke (0, 0, 75);
  ellipse (430, 90, 80, 80);
  fill (250, 250, 0, 50);
  arc (180, 230, 50, 25, PI, TWO_PI-PI/2);
  arc (180, 230, 50, 25, TWO_PI-PI/2, TWO_PI);
  stroke (250, 250, 0, 50);
  quad (157, 230, 203, 230, 400, 450, 265, 450);
  fill (255, 255, 255, 50);
  arc (180, 138, 150, 190, PI, TWO_PI-PI/2);
  arc (180, 138, 150, 190, TWO_PI-PI/2, TWO_PI);
  noSmooth();
  stroke (55);
  strokeWeight (0);
  strokeJoin (BEVEL);
  fill (80);
  rect (152, 57, 55, 55); 
  rect (169, 113, 20, 15);
  fill (120, 0, 0);
  stroke (200, 0, 0);
  ellipse (167, 80, 15, 15);
  ellipse (193, 80, 15, 15);
  rect (165, 95, 30, 8);
  stroke (255, 0, 0);
  strokeWeight (5);
  line (160, 65, 173, 70);
  line (201, 65, 186, 70);
  fill (80);
  strokeWeight (0);
  stroke (55);
  beginShape (TRIANGLES);
  vertex (180, 45);
  vertex (190, 57);
  vertex (170, 57);
  vertex (207, 75);
  vertex (207, 91);
  vertex (215, 83);
  vertex (152, 75);
  vertex (152, 91);
  vertex (143, 83);
  endShape ();
  smooth ();
  strokeJoin (ROUND);
  strokeWeight (2);
  noFill ();
  stroke (255);
  curve (250, 375, 289, 425, 279, 430, 400, 375);
  fill (255);
  stroke (0);
  ellipse (314, 425, 50, 25);
  fill (0);
  ellipse (328, 425, 10, 10);
  ellipse (313, 425, 10, 10);
  ellipse (299, 425, 10, 10);
  strokeWeight (4);
  line (296, 434, 296, 445);
  line (304, 438, 304, 441);
  line (325, 437, 325, 445);
  line (333, 434, 333, 441);  
  stroke (0);
  strokeWeight (2);
  fill (0);
  ellipse (279, 430, 3, 3);
  stroke (0);
  fill (255);
  ellipse (340, 414, 20, 16);
  ellipse (341, 417, 7, 5);
  fill (0);
  strokeWeight (0);
  ellipse (336, 413, 4, 4);
  ellipse (346, 413, 4, 4);
  ellipse (340, 417, 1, 1);
  ellipse (342, 417, 1, 1);
  fill (255);
  strokeWeight (1);
  beginShape (TRIANGLES);
  vertex (331, 408);
  vertex (339, 406);
  vertex (334, 401);
  vertex (343, 406);
  vertex (350, 410);
  vertex (348, 402);
}
