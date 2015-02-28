
size (400, 400);
background (20, 52, 247);
for (int j=0; j<1000; j++) 
{
  stroke (255, random (50, 255));
  strokeWeight (4);
  point (random (0, 400), random (0, 400));
}
stroke (95, 54, 3);
strokeWeight (8);
line (180, 180, 75, 75);
line (220, 220, 325, 75);
stroke (0);
strokeWeight (4);
ellipse (200, 75, 100, 100);
ellipse (200, 175, 125, 125);
ellipse (200, 275, 150, 150);
fill (0);
ellipse (175, 55, 20, 20);
ellipse (225, 55, 20, 20);
ellipse (170, 90, 10, 10);
ellipse (185, 95, 10, 10);
ellipse (200, 100, 10, 10);
ellipse (215, 95, 10, 10);
ellipse (230, 90, 10, 10);
ellipse (200, 130, 20, 20);
ellipse (200, 180, 20, 20);
ellipse (200, 235, 20, 20);
stroke (229, 131, 9);
fill (229, 131, 9);
beginShape ();
vertex (190, 81);
vertex (210, 83); 
vertex (190, 85); 
endShape (CLOSE);
stroke (255);
fill (255);
rect (0, 355, 400, 45);

