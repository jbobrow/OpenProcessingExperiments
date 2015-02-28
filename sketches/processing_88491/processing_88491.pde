
size(500,500);
background(255,255,255);
//hair
fill(0,0,0);
ellipse(250,250,320,320);

//head
noStroke();
fill(205,133,63);
ellipse(250,300,250,250);

//eyebrows
stroke(0,0,0);
strokeWeight(4);
noFill();
bezier(140,280,140,200,200,200,220,220);
stroke(255,255,255);
stroke(0,0,0);
bezier(360,280,360,200,300,200,280,220);

//glasses
fill(255,255,255);
rect(155,282,80,60);
rect(265,282,80,60);
line(235,310,265,310);

//eyes
fill(0,0,0);
ellipse(195,310,40,40);
ellipse(305,310,40,40);
fill(255,255,255);
noStroke();
ellipse(202,300,20,20);
ellipse(298,300,20,20);

//smile
noFill();
stroke(0,0,0);
bezier(175,375,175,390,315,390,325,375);










