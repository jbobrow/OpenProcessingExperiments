
//Hello Mondrian by Luo

size(300, 300);
background(238, 76, 63); //main background is red(-ish)

//white boxes
noStroke();
fill(253, 251, 236);
rect(0, 0, 70, 300);
rect(0, 220, 300, 220);

//blue box
fill(57, 147, 192);
rect(0, 220, 70, 220);

//yellow box
fill(250, 222, 0);
rect(275, 265, 50, 50);

stroke(50, 50, 50);
strokeCap(SQUARE);
strokeWeight(13);
line(0, 90, 70, 90); //short thicker horizontal line

strokeWeight(8);
line(70, 0, 70, 300); //long vertical line
line(0, 220, 300, 220); //long horizontal line

//right bottom corner lines
line(275, 220, 275, 300); //short vertical line
line(275, 265, 300, 265); //short horizontal line
