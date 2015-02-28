
size(800,1000);
stroke(20);
background(0, 50, 100);

//sun
fill(204, 102, 0);
ellipse(500,200,200,200);

//Clouds
fill(255);
ellipseMode(CENTER);
ellipse(600,100,200,50);
ellipse(700,90,100,100);
ellipse(650,150,200,100);

//ground
fill(0,100,0);
quad(200,650,1000,650,1000,1000,200,1000);
fill(0,45,0);
quad(280,750,1000,750,1000,1000,280,1000);
fill(0,60,0);
quad(200,650,280,750,280,1000,200,1000);

//leggs back
fill(150,150,100);
ellipseMode(CENTER);
ellipse(300,580,100,200);
ellipse(600,580,100,200);

//tail
triangle(640,450,680,500,700,250);

//Body
ellipseMode(CORNER);
ellipse(240,400, 440,200);

//neck
quad(200,220,240,500,260,520,240,220);

//leggs front
ellipseMode(CENTER);
ellipse(350,615,100,200);
ellipse(540,615,100,200);

//head
ellipseMode(CENTER);
rectMode(CORNER);
rect(80,120,200,160);
arc(180,280, 120, 60, 0, PI);

//eyes
fill(225);
ellipse(120,120,60,60);
ellipse(240,120,60,60);

//pupils
fill(0);
ellipse(115,110,15,15);
ellipse(245,115,15,15);

//nostrils
fill(100);
line(160,160,160,200);
line(200,160,200,200);
line(160,200,140,220);
line(200,200,220,220);
rectMode(CENTER);
ellipse(160,240,30,30);
ellipse(200,240,30,30);

//mouth
ellipse(180,280,80,20);
line(140,280,220,280);


