
//Nicole Strang
//ITGM 315 Processing
//Assignment 1 Part 2
//Odeer the Tiger-Deer
//
//9.12.2012: Wrote in shapes and colors based on design.


void setup() {
size(500,500);
background(255,255,204);

rectMode(CORNERS);
ellipseMode(CORNERS);
}


void draw() {
//Ears
stroke(225,225,225);
fill(225,225,225);
ellipse(120,80,160,120);
ellipse(210,80,250,120);

//Neck
stroke(255,204,102);
fill(255,204,102);
rect(200,190,210,230);

//Front leg
rect(210,280,220,360);
rect(210,360, 240,420);

//Back leg
rect(280,280,310,300);
rect(290,300,300,360);
rect(290,360,320,420);

//Tail
stroke(255,153,51);
fill(255,153,51);
rect(300,210,330,240);

//Head
rect(120,100,250,190);

//Body
rect(200,230,310,280);

//Hooves
stroke(102,102,102);
fill(102,102,102);
rect(200,420,240,440);
rect(280,420,320,440);

//Stripes, from top left to bottom left
line(120,120,160,120);
line(120,130,160,130);
line(210,120,250,120);
line(210,130,250,130);

line(240,230,240,250);
line(250,230,250,250);
line(260,230,260,250);
line(270,230,270,250);


//Eyes
stroke(225,225,225);
ellipse(130,160,150,180);
ellipse(210,160,230,180);
}
