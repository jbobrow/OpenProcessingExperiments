
size(150,160);
noStroke();

//pink-ish square #1
fill(203,206,188);
rect(0, 0, 60, 45);

//orange square
fill(210,170,40);
rect(65, 0, 85, 45);

//blue square
fill(70,90,140);
rect(0, 53, 97, 107);

//pink-ish square #2
fill(203,206,188);
rect(105, 53, 45, 64);

//red-ish square
fill(190,140,120);
rect(105, 125, 45, 35);

//aight. let's leave these squares, go to the bathroom and do some lines instead.
stroke(0);
strokeWeight(8);
beginShape(LINES);
vertex(61, 0);
vertex(61, 45);
vertex(0, 49);
vertex(150, 49);
vertex(101, 53);
vertex(101, 160);
vertex(105, 122);
vertex(150, 122);
endShape();

