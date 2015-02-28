
// be happy
size(600,600);
smooth();
background(0);
//head
stroke(255);
fill(255,255,0);
ellipse(300,300,300,300);
//eyes
stroke(0);
strokeWeight(30);
point(250,250);
stroke(0);
strokeWeight(30);
point(350,250);
//mouth
stroke(0);
strokeWeight(10);
noFill();
arc(300,300,200,200,0,radians(180));
//body
stroke(255,255,0);
strokeWeight(20);
line(300,450,300,600);
//left arm
stroke(255,255,0);
strokeWeight(20);
line(300,450,250,600);
//right arm (upper)
stroke(255,255,0);
strokeWeight(20);
line(300,450,350,550);
// right arm (lower)
stroke(255,255,0);
strokeWeight(20);
line(350,550,400,450);
