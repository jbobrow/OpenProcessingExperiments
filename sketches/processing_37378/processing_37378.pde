
size(300, 300);
background(0);
for (int a = 4; a <= 300; a += 6) {
  smooth();

//Vertical Points
  stroke(0, 0, 255);
  strokeWeight(3);
  point(1, 0+a);

//Reference Lines like in a perspective
  strokeWeight(1);
  stroke(23, 180, 255);
  line (5, 150, 300, a);
  
//Second set of Perspective Lines
  strokeWeight(.25);
  stroke(255,0,0);
  line(5,15,300,a); 
  
//Third set of Perspective Lines
  stroke(255,0,0);
  line(5,285,300,a);
  
//Bounding Ellipses
  noFill();
  strokeWeight(1);
  stroke(0,0,255);
  ellipse(a*2, 6, 8, 10);
  ellipse(a*2, 294, 8, 10);
}


