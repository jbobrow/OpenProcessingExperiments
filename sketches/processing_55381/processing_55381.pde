
size(540,340);
background(48,74,103);



//BODY
fill(130);
smooth();
strokeWeight(8); 
strokeJoin(ROUND);// Round the stroke corners
rect(185,150, 135, 110);

fill(0);
smooth();
strokeWeight(7); 
strokeJoin(ROUND);// Round the stroke corners
rect(185,175, 135, 60);

fill(130);
strokeWeight(8);
beginShape(); 
vertex(225,175); 
vertex(280,175); 
vertex(280,235);
vertex(270,260);
vertex(235,260);
vertex(225,235);
vertex(225,175);
endShape();

//foreveralone

fill(255);
strokeWeight(2);
beginShape(); 
vertex(235,210);
vertex(239,195);
vertex(242,190);
vertex(254,185); 
vertex(260,192);
vertex(268,194);
vertex(275,210);
vertex(269,222);
vertex(250,223);
vertex(235,210);
endShape();

fill(0);
ellipse(250, 196, 2, 2);

fill(0);
ellipse(255, 194, 2, 2);

noFill();
strokeWeight(2);
arc(255,198,8,5,0,2.16);

strokeWeight(1);
line(245,210,255,220);

strokeWeight(1);
line(250,208,257,216);

strokeWeight(1);
line(267,206,262,216);

//NECK
fill(130);
strokeWeight(7);
line(240,120,240,150);
line(265,120,265,150);


//HEAD
fill(0);
smooth();
strokeWeight(10); 
strokeJoin(ROUND);// Round the stroke corners
rect(220,60, 65, 65);

fill(130);
smooth();
strokeWeight(10); 
strokeJoin(ROUND);
rect(205, 20, 95, 95);

fill(0);
smooth();
strokeWeight(10); 
strokeJoin(ROUND);
rect(240, 90, 26, 34);

fill(255);
noStroke();
ellipse(230, 55, 33, 33);
fill(0);
noStroke();
ellipse(230, 55, 30, 30);
fill(255);
ellipse(230, 55, 3, 3);
fill(0);
noStroke();
ellipse(245, 55, 16, 16);
fill(255);
noStroke();
ellipse(280, 55, 20, 20);
fill(0);
noStroke();
ellipse(280, 55, 16, 16);
fill(237,28,36);
noStroke();
ellipse(280, 55, 10, 10);
fill(255);
ellipse(280, 35, 10, 10);
fill(255);
ellipse(280, 75, 10, 10);
fill(255);
ellipse(280, 95, 10, 10);

//tear
strokeWeight(2);
stroke(237,28,36);
line(249,197,247,201);

//BACKGROUND
strokeWeight(1);
stroke(0,255,30);
line(0,170,280,340);
line(0,170,275,340);
line(0,170,270,340);
line(0,170,265,340);
line(0,170,260,340);
line(0,170,255,340);
line(0,170,250,340);
line(0,170,245,340);
line(0,170,240,340);
line(0,170,235,340);
line(0,170,230,340);
line(0,170,225,340);
line(0,170,220,340);
line(0,170,215,340);
line(0,170,210,340);
line(0,170,205,340);
line(0,170,200,340);

strokeWeight(1);
stroke(0,255,30);
line(540,170,280,340);
line(540,170,275,340);
line(540,170,270,340);
line(540,170,265,340);
line(540,170,260,340);
line(540,170,255,340);
line(540,170,250,340);
line(540,170,245,340);
line(540,170,240,340);
line(540,170,235,340);
line(540,170,230,340);
line(540,170,225,340);
line(540,170,220,340);
line(540,170,215,340);
line(540,170,210,340);
line(540,170,205,340);
line(540,170,200,340);

//WHEELS
fill(0);
smooth();
strokeWeight(10); 
stroke(0);
strokeJoin(ROUND);// Round the stroke corners
rect(160,220, 15, 80);

fill(0);
smooth();
strokeWeight(10); 
stroke(0);
strokeJoin(ROUND);// Round the stroke corners
rect(330,220, 15, 80);


