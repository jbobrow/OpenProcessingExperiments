
//canvas
size(600,662);
background(255);

//horizontal lines
fill(0);
strokeWeight(16);
smooth();
strokeCap(SQUARE);
line(0,56,576,56);
line(0,384,600,384);
line(38,230,580,230);
line(405,500,600,500);
line(175,630,600,630);

//vertical lines
fill(0);
smooth();
strokeCap(SQUARE);
rect(45,0,1,380);
rect(180,0,1,662);
rect(258,0,1,380);
rect(405,0,0,662);
rect(430,0,0,662);
rect(465,0,0,620);
rect(520,0,0,662);
rect(578,0,0,384);

//colored rectangles
noStroke();
//red
fill(206,31,27);
rect(0,0,38,49);
rect(0,64,38,70);
rect(0,340,38,37);
rect(528,305,43,38);
//blue
fill(49,66,169);
rect(188,0,64,49);
rect(528,638,78,24);
//yellow
fill(245,198,39);
rect(190,238,60,138);










