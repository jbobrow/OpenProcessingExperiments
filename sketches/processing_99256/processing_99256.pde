
size(900,500);
background(0,128,128);
//drawing the land
strokeWeight(7);
line( 0, 430, 900,430);
//the first third of power meter
strokeWeight(5);
fill(123,45,67);
rect(5,10,45,30);
//the second third of power meter
fill(1150,80,90);
rect(50,10,90,30);
// the third third of the power meter
fill(0,255,255);
rect(100,10,90,30);
//color of text
fill(0);
//font and waht it will say and location
font = loadFont("LetterGothicStd-32.vlw");
textFont(font, 32);
text("power",200, 30);
// first blue circle
fill(0,0,255);
ellipse(30, 400, 55, 55);
//eye
fill(0);
ellipse(40,390,7,7);
//white part of eye
fill(255);
ellipse(40,390,10,10);
// green circle
strokeWeight(4);
fill(0,255,0);
ellipse(60, 410, 35, 39);
//black part of eye
fill(0);
ellipse(65,400,3,3);
// white part of eye
fill(255);
ellipse(65,400,5,5);
//triangle monster
strokeWeight(3);
fill(255,0,0);
triangle(79,380,79,430,120,430);
//black part of eye
fill(0);
ellipse(90,405,6,6);
//white part of eye
fill(255);
ellipse(90,405,8,8);
//basket
strokeWeight(3);
fill(255);
rect(500,400,210,430);
// typing word basket 
fill(0);
font = loadFont("LetterGothicStd-32.vlw");
textFont(font, 32);
text("basket", 550, 450);
