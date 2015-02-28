
size(300,360);
background(255);
//first we draw the squares
noStroke();
fill(66,83,163);
rect(90,0,210,206);
fill(0,0,0);
rect(0,210,92,102);
fill(228,80,43);
rect(0,210,30,102);
fill(252,218,9);
rect(206,315,75,45);

//the horizontal lines
stroke(0);
strokeCap(SQUARE);
strokeWeight(8);
line(0,35,90,35);
line(0,210,300,210);
line(90,138,300,138);
line(10,310,280,310);

//the vertical lines


line(86,0,86,210);
line(280,210,280,344);
line(206,138,206,355);

//done




