
size(500,500); // size of window
background(0,236,255);// background color
noStroke();// takes away outside lines
ellipse(250,350,300,200); // bottom circle of snowman
ellipse(250,250,250,150);// middle circle of snowman
ellipse(250,150,150,150);// head of snowman
stroke(67,13,3); // stroke color is brown
strokeWeight(5); // the lines' thickness
fill(67,13,3); // color of lines is brown
line(150,220,50,220); // right arm 
line(50,220,30,200); // top finger
line(50,220,30,220); // middle finger
line(50,220,30,240); // bottom finger

line(350,220,450,220); // left arm
line(450,220,470,200); // top finger
line(450,220,470,220); // middle finger
line(450,220,470,240); // bottom finger

ellipse(275,130,10,15); // right eye
ellipse(225,130,10,15); // left eye

ellipse(250,210,10,10); // top button
ellipse(250,235,10,10); // middle button
ellipse(250,260,10,10); // bottom button
fill(255); // color of arc
arc(180, 150, 200, 60, 0, PI/3); // smile
strokeWeight(1); // thickness of nose
fill(255,94,0); // color of nose is orange
triangle(250, 160, 250, 150, 200, 170); //nose

