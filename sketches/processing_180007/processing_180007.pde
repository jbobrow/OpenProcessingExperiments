
/*
self portrait
*/

size(100,100);
background (255,255,255);

//hair
fill(77,43,5);
noStroke();
ellipse(50,26,71,44); //top
rect(14,25,25,81); //left side
rect(61,25,25,81); //right side

//face
fill(242,214,182);
noStroke();
ellipse(50,50,60,75);

//neck
rect(42,80,16,15);

//cheeks
fill(245,168,166);
ellipse(30,58,17,17);
ellipse(70,58,17,17);

//outer eyes
fill(255,255,255);
stroke(0,0,0,125);
strokeWeight(1);
ellipse(40,40,7,7); //left
ellipse(60,40,7,7); //right

//inner green eyes
fill(76,133,94);
noStroke();
ellipse(41,41,4,4);
ellipse(61,41,4,4);

//nose
fill(227,177,120);
noStroke();
ellipse(50,53,10,4);

//mouth
fill(242,72,34);
stroke(232,99,70);
strokeWeight(2);
ellipse(55,70,8,8);

//shirt
fill(86,86,245);
noStroke();
rect(25,90,50,10);

//bowtie
fill(5,5,77);
noStroke();
ellipse(50,92,9,9);
triangle(38,85,38,97,48,92);
triangle(52,92,62,85,62,97);








