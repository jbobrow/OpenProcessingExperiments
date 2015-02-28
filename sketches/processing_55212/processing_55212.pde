
size (500, 500);

//Head
noStroke();
beginShape(); 
vertex (240, 210);
vertex (200, 125);
vertex (220, 140);
vertex (280, 140);
vertex (300, 125);
vertex (260, 210);
endShape();

//Tail 
noStroke ();
fill (225);
beginShape();
vertex (250, 312);
vertex (320, 312); 
vertex (350, 240);
vertex (300, 300);
vertex (250, 312);
endShape();

//Feet
noStroke();
fill(0);
ellipse (290, 310, 50, 25);
ellipse (210, 310, 50, 25);

//Body
fill (255, 255, 255);
smooth();
noStroke();
ellipse (250, 250, 125, 125); 

//Nose&Eyes
fill (0);
triangle (250, 185, 235, 165, 265, 165);
stroke (0);
strokeWeight (4);
line (225, 155, 240, 155);
line (275, 155, 260, 155);

//Hands
ellipse (312, 230, 25, 25);
ellipse (188, 230, 25, 25);








