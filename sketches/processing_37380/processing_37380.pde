
size(300, 300);
background(0);
for (int a = 4; a <= 300; a += 6) {
  smooth();

//Vertical Points
  stroke(0, 255, 220);
  strokeWeight(3);
  point(1, 0+a);

//Horizontal Lines
  strokeWeight(.5);
  stroke(255,0,0);
  line(5,a,300,a); 
  
//Curved Lines
  strokeWeight(1);
  stroke(23, 180, 240);
  line (a, 150, 300, a);
  
//Bounding Ellipses
  noFill();
  stroke(230, 50, 250);
  ellipse(a*2, 6, 8, 10);
  ellipse(a*2, 294, 8, 10);
}


