
size(400,500); //sets canvas size (w,h)
background(133,133,133); //set background - grey

//bolts
fill(57,53,53);  // Set color for bolts
rect(75,150,250,10); //temple bolts shaft - runs behind face
rect(65,145,10,20); //left botl cap
rect(325,145,10,20); //right bolt cap

//face
fill(75,192,136); // sets color for face - it aint easy being green
rect(100,100,200,300,25,25,200,200); //franks face with corners rounded


//glasses
fill(0,0,0,220);
rect(205,185,70,60, 10,10,40,40); //Left lense
rect(125,185,70,60, 10,10,40,40); //Right Lense
strokeWeight(7);
strokeCap(SQUARE); //sets stroke cap to square for over the ear bit of shades
line(100,150,130,190); //left over the ear(bolt)
line(300,150,270,190); //right over the ear(bolt)
line(190,200,210,200); //nose rest

// 1970's stash
noStroke();
fill(65,53,54);
rect(165,300,12,30,10,0,20,10);
rect(180,300,12,20,0,0,20,10);
rect(195,300,12,20,0,0,20,10);
rect(210,300,12,20,0,0,20,10);
rect(225,300,12,30,0,100,20,10);

//tight lipped
stroke(1); //sets stroke for line
line(180,340,220,340); //this is the mouth
noStroke();
triangle(200,485, 185,385, 215,385);  //triangle(x1, y1, x2, y2, x3, y3)
