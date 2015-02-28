
size(400,550);
smooth();
background(126,192,238);
strokeWeight(2.5);
stroke(255);
noFill();
ellipse(45,10,10,10);
ellipse(45,100,20,20);
ellipse(45,200,10,10);
ellipse(45,300,20,20);
ellipse(45,400,10,10);
ellipse(45,500,20,20);
ellipse(355,10,10,10);
ellipse(355,100,20,20);
ellipse(355,200,10,10);
ellipse(355,300,20,20);
ellipse(355,400,10,10);
ellipse(355,500,20,20);

//head
strokeWeight(0.5);
noStroke();
fill(255);
ellipse(200,200,93,86);

//legs
strokeWeight(5);
stroke(255);
line(191,320,191,385);
line(208,320,208,385);

//arms
strokeWeight(5);
stroke(255);
line(190,267,175,238);
line(210,267,225,238);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

//body
//strokeWeight(0.1);
//stroke(0);
noStroke();
fill(193,255,193);
quad(190,262,210,262,217,322,183,322);

strokeWeight(0.2);
stroke(0);
fill(255,255,0);
triangle(200,270,190,265,190,275);
triangle(200,270,210,265,210,275);
ellipse(200,270,7,7);
ellipse(200,278,4,4);
ellipse(200,286,4,4);

//eyes
stroke(0);
fill(255);
strokeWeight(1);
line(180,185,187,190);
line(220,185,213,190);
strokeWeight(2);
ellipse(180,203,15,15);
ellipse(220,203,15,15);
noStroke();
fill(255,133,117);
ellipse(173,215,15,5);
ellipse(229,215,15,5);

//mouth
noStroke();
fill(170,38,38);
rect(189,217,23,28);



