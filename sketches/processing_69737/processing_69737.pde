
//Jimmy C ; Block 6; Programming 1

size(500,500);
background(0,0,200);
smooth();

//background
fill(240,225,68);
rect(0,250,500,250);

//Body
fill(101,208,245);
stroke(101,208,245);
ellipse(250,250,250,350);

//dorsal
stroke(255,255,255);
fill(255,255,255);
ellipse(250,305,200,240);

//eyes
ellipse(250-20,135,50,80);
ellipse(250+20,135,50,80);
stroke(0,0,0);
fill(0,0,0);
ellipse(250-20,135,17,32);
ellipse(250+20,135,17,32);

//nose
stroke(251,255,54);
fill(251,255,54);
triangle(250-12,160,250+12,160,250,195);

//feet
stroke(251,255,54);
fill(251,255,54);
ellipse(250-45,420,75,40);
ellipse(250+45,420,75,40);

//arms
fill(101,208,245);
stroke(101,208,245);
triangle(250-120,210,250-120,270,250-170,300);
triangle(250+120,210,250+120,270,250+170,300);

//crown
stroke(251,255,54);
fill(251,255,54);
rectMode(CENTER);
rect(250,78,100,18);
stroke(251,255,54);
fill(251,255,54);
triangle(250,30,250-18,78,250+18,78);
triangle(250-25,40,250-30,78,250-5,78);
triangle(250+25,40,250+30,78,250+5,78);
triangle(250-50,35,250-50,78,250-20,78);
triangle(250+50,35,250+50,78,250+20,78);

//glasses
stroke(0,0,0);
strokeWeight(5);
fill(0,0,150,150);
rect(250-30,135,45,30);
fill(150,0,0,150);
rect(250+30,135,45,30);
//nosepiece
fill(0,0,0);
rect(250,130,5,10);
//piece
rect(250-70,130,30,10);
rect(250+70,130,30,10);
