
size(600,600);
background(39,164,170);
smooth();

//background--done first so that everything else shows up on top
noFill();
stroke(229,255,150); //yellow ellipses
strokeWeight(50);
ellipse(300,300,500,500);
strokeWeight(20);
ellipse(300,300,750,750);

stroke(223,71,78); //red ellipses
strokeWeight(70);
ellipse(300,300,620,620);
strokeWeight(30);
ellipse(300,300,350,350);

noStroke();
fill(229,255,150); //yellow smaller circles
ellipse(210,595,50,50);
ellipse(130,560,50,50);
ellipse(75,512,50,50);
ellipse(30,450,50,50);
ellipse(4,380,50,50);
ellipse(-8,300,50,50);
ellipse(3,220,50,50);
ellipse(30,150,50,50);
ellipse(75,90,50,50);
ellipse(132,43,50,50);
ellipse(200,8,50,50);
ellipse(280,-4,50,50);
ellipse(360,0,50,50);
ellipse(435,25,50,50);
ellipse(500,65,50,50);
ellipse(550,120,50,50);
ellipse(585,180,50,50);
ellipse(605,250,50,50);
ellipse(608,330,50,50);
ellipse(595,400,50,50);
ellipse(565,465,50,50);
ellipse(520,520,50,50);
ellipse(465,565,50,50);
ellipse(400,595,50,50);

//hair from the back of the head
fill(37,111,161);
beginShape();
vertex(300,200);
vertex(450,300);
bezierVertex(450,300,480,400,550,450);
bezierVertex(550,450,640,500,600,500);
vertex(600,600);
vertex(0,600);
vertex(0,500);
bezierVertex(0,500,-40,500,50,450);
bezierVertex(50,450,120,400,150,300);
endShape(CLOSE);

//neck/shoulders/arms
fill(174,222,191);
beginShape();
vertex(350,350);
bezierVertex(300,450,350,450,350,450);
vertex(350,470);
vertex(320,470);
vertex(330,350);
endShape(CLOSE);
beginShape();
vertex(250,350);
bezierVertex(300,450,250,460,225,450);
vertex(270,470);
vertex(300,470);
vertex(290,350);
endShape(CLOSE);
noStroke();
rect(270,350,60,150);
rect(225,450,150,200);
beginShape();
vertex(370,490);
vertex(420,480);
vertex(450,600);
vertex(405,600);
endShape(CLOSE);
beginShape();
vertex(235,490);
vertex(185,480);
vertex(130,600);
vertex(175,600);
endShape(CLOSE);

//clothes
fill(103,191,166);
ellipse(215,490,100,100);
ellipse(390,490,100,100);
rect(225,470,150,200);


//head
fill(174,222,191);
ellipse(300,250,200,200);
arc(200,250,200,300,PI,PI/2);
arc(300,250,200,300,0,PI/2);
arc(300,250,200,300,PI/2,PI);

//face
noFill();
stroke(229,255,150);
strokeWeight(5);
strokeCap(ROUND);
strokeJoin(ROUND);
arc(300,300,100,100,PI/3,TWO_PI/3);
arc(250,230,100,100,PI/3,TWO_PI/3);
arc(350,230,100,100,PI/3,TWO_PI/3);
line(377,271,407,274);
line(370,276,380,280);
line(223,271,193,274);
line(230,276,220,280);

//hair in front
noStroke();
fill(37,111,161);
beginShape();
vertex(300,120);
bezierVertex(400,80,450,104,500,250);
bezierVertex(500,250,530,300,580,250);
bezierVertex(580,250,660,200,640,280);
vertex(600,300);
bezierVertex(620,280,590,300,580,320);
bezierVertex(580,320,500,450,330,200);
bezierVertex(330,200,300,160,300,200);
endShape();
beginShape();
vertex(300,120);
bezierVertex(200,80,150,104,100,250);
bezierVertex(100,250,70,300,20,250);
bezierVertex(20,250,-60,200,-40,280);
vertex(0,300);
bezierVertex(-20,280,10,300,20,320);
bezierVertex(20,320,100,450,270,200);
bezierVertex(270,200,300,160,300,200);
endShape();








