
size(300,300);

noStroke();
fill(140,219,101);
rect(0,0,300,300);

//ears
stroke(1);
fill(242,185,84,220);
ellipse(80,150,20,40)
ellipse(220,150,20,40)

//head
strokeWeight(3)
fill(79,185,209,255);
ellipse(150,150,140,185);



//eyes
fill(225,166,245);
strokeWeight(1)
ellipse(128,127,20,14);
ellipse(178,127,20,14);


//nose
fill(35);
triangle(155,140,135,160,160,160);

//eyeballs
strokeWeight(1)
ellipse(120,128,8,8);
ellipse(170,128,8,8);



//glasses
strokeWeight(1)
noFill();
rect(160,115,35,20);
rect(110,115,35,20);
strokeWeight(4)
stroke(110);
line(110,115,195,115);

//mouth
strokeWeight(2);
fill(242,185,84,190);
triangle(135,185,150,205,165,185);


