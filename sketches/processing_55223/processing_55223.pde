
size(600, 800);
smooth();
strokeWeight(3);
background(#E4EDBB);
ellipseMode(RADIUS);

//Neck
stroke(#D128C9);
line(250, 250, 250, 390);
line(260, 250, 260, 390);
line(270, 250, 270, 390);
line(280, 250, 280, 390);
line(290, 250, 290, 390);

//Antennae
strokeWeight(6);
stroke(#1119D3);
line(240, 220, 160, 120);
line(300, 220, 380, 120);
strokeWeight(12);
line(270, 220, 270, 60);
strokeWeight(9);
stroke(#ED7183);
line(255, 220, 230, 140);
line(285, 220, 305, 140);

//Head
noStroke();
fill(#9328A0);
ellipse(270, 220, 75, 35);
fill(#D9E355);
ellipse(240, 220, 15, 10);
ellipse(300, 220, 15, 10);
fill(0);
ellipse(240, 220, 5, 5);
ellipse(300, 220, 5, 5);

//Body
noStroke();
fill(0);
rect(255, 400, 30, 90);
fill(0);
rect(70, 400, 400, 9);
fill(#5296E8);
ellipse(70, 404, 15, 15);
ellipse(470, 404, 15, 15);
fill(#E52C17);
ellipse(270, 400, 45, 20);
fill(0);
rect(210, 490, 120, 20);
rect(210, 490, 20, 200);
rect(310, 490, 20, 200);


