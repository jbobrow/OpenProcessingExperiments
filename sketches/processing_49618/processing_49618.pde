
size(640,360); 
background(230,223,201); 
stroke(153);
strokeWeight(.5);
smooth();

//yellow
fill(227,216,156);
quad(387,311, 245,360, 311,360, 390,333);

//brown
fill(174,146,128);
beginShape();
vertex(387,311);
vertex(272,228);
vertex(0,295);
vertex(0,360);
vertex(245,360);
endShape();

//blue
fill(104,156,195);
beginShape();
vertex(27,360); 
vertex(242,311);
vertex(164,0);
vertex(0,0);
vertex(0,360);
endShape();

//black
fill(37,37,36);
quad(0,185, 0,164, 640,18, 640,35);

//creme
fill(230,223,201);
quad(0,227, 598,87, 593,70, 0,207);
quad(482,230, 285,280, 275,276, 477,225);
quad(285,280, 285,288, 275,284, 275,276);

//red
fill(210,50,53);
triangle(0,0, 0,42, 75,0); 
quad(0,227, 598,87, 600,97, 0,237);
quad(285,288, 285,280, 482,230, 482,238);



