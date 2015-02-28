
size(650,450);
 
background(25,57,100);
smooth();
noStroke();
rectMode(CORNERS);
 
fill(123,234,220);
rect(0,350,650,450);
 
fill(188,47,47);
stroke(0);
 //Torres
beginShape();
vertex(75,400);
vertex(75,325);
vertex(95,325);
vertex(95,75);
vertex(165,75);
vertex(165,325);
vertex(185,325);
vertex(185,400);
vertex(75,400);
endShape();
 
beginShape();
vertex(575,400);
vertex(575,325);
vertex(555,325);
vertex(555,75);
vertex(485,75);
vertex(485,325);
vertex(465,325);
vertex(465,400);
vertex(575,400);
endShape();
 
strokeWeight(3);
line(556,325,484,325);
line(556,315,484,315);
line(556,275,484,275);
line(556,265,484,265);
line(556,175,484,175);
line(556,165,484,165);
line(556,125,484,125);
line(556,115,484,115);
 
line(94,325,166,325);
line(94,315,166,315);
line(94,275,166,275);
line(94,265,166,265);
line(94,175,166,175);
line(94,165,166,165);
line(94,125,166,125);
line(94,115,166,115);
 
strokeWeight(1);
fill(188,47,47);
 //triãngulos centro, coloridos
triangle(535,85,505,85,520,15);
triangle(115,85,145,85,130,15);
fill(175);
triangle(95,75,115,75,105,25);
triangle(165,75,145,75,155,25);
triangle(555,75,535,75,545,25);
triangle(485,75,505,75,495,25);
 
 //cabos base
fill(188,47,47);
rect(165,135,485,155);
rect(555,310,650,325);
rect(0,310,95,325);
fill(255);
rect(0,312,90,318);
rect(560,312,650,318);
rect(170,140,480,150);
 
stroke(255);
fill(0);
rectMode(CENTER);
rect(130,300,5,20);
rect(120,300,5,20);
rect(140,300,5,20);
rect(510,300,5,20);
rect(530,300,5,20);
rect(520,300,5,20);
rect(130,250,5,20);
rect(120,250,5,20);
rect(140,250,5,20);
rect(510,250,5,20);
rect(530,250,5,20);
rect(520,250,5,20);
rect(130,150,5,20);
rect(120,150,5,20);
rect(140,150,5,20);
rect(510,150,5,20);
rect(530,150,5,20);
rect(520,150,5,20);
 
 //bases que levantam
stroke(157);
strokeWeight(20);
line(185,325,275,210);
line(465,325,375,210);
strokeWeight(5);
stroke(255);
line(185,325,275,210);
line(465,325,375,210);
