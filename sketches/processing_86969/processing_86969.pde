
background(220, 231, 243);
size(640, 480);

//face
noStroke();
fill(250,180,180);
ellipse(150,187,50,50);
ellipse(480,187,50,50);
fill(158,153,159);
rect(155,15,325,280);
ellipse(317,299,324,324);

//eyes
fill(255);
ellipse(240,150,90,90);
ellipse(400,150,90,90);
//negspace
fill(158,153,159);
ellipse(240,115,90,80);
ellipse(400,115,90,80);
fill(0);
ellipse(240,175,10,10);
ellipse(400,175,10,10);

//mouth
fill(180,6,6);
ellipse(320,340,120,120);

//mustache
fill(0);
quad(330,225, 330,255, 450,275, 435,255);
quad(310,225, 310,255, 190,275, 205,255);

//nose
stroke(250,180,180);
smooth();
strokeCap(SQUARE);
strokeWeight(7);
line(310,255,310,191);
line(330,255,330,191);

//brows
stroke(115,0,0);
strokeWeight(15);
smooth();
strokeCap(SQUARE);
line(195,105,278,85);
line(360,85,443,105);

//hair
fill(0);
noStroke();
triangle(155,15,155,75,271,15);
triangle(271,15,480,75,480,15);
triangle(310,417,330,417,320,435);



