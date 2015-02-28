
size(320,300);

background(200);

rectMode(CENTER);
ellipseMode(CENTER);

stroke(200); //lower jaw
fill(255,235,230);
triangle(105,210,160,340,215,210);

fill(200); // jaw blockers
stroke(200);
triangle(135,280,145,290,125,300);
triangle(145,290,160,298,125,300);
triangle(160,298,175,290,195,300);
triangle(175,290,185,280,195,300);
triangle(125,298,195,298,160,340);

stroke(255,200,200); //Gums
strokeWeight(4);
line(112,215,140,280);
line(140,280,150,290);
line(150,290,160,295);
line(160,295,170,290);
line(170,290,180,280);
line(180,280,208,215);

stroke(190);
strokeWeight(1);
fill(255,255,235);
ellipse(160,170,140,130); //head

triangle(95,160,100,150,0,130); //antennae
triangle(225,160,220,150,320,130);
triangle(110,130,120,125,70,40);
triangle(210,130,200,125,250,40);
triangle(140,120,150,120,145,20);
triangle(170,120,180,120,175,20);

stroke(255,255,235); // antennae line blockers
line(95,160,100,150);
line(225,160,220,150);
line(110,130,120,125);
line(210,130,200,125);
line(140,120,150,120);
line(170,120,180,120);

stroke(235,235,215);
triangle(160,280,150,250,170,250); // beak tip
triangle(140,250,140,240,150,250); // teeth beak 1
triangle(180,250,180,240,170,250); // 2
triangle(140,280,150,290,150,280); //teeth bottom 1
triangle(170,290,170,280,180,280); // 2
triangle(130,260,140,260,135,270); //teeth middle 1
triangle(190,260,180,260,185,270); // 2
triangle(122,240,135,240,126,250); //teeth top 1
triangle(187,240,198,240,192,250); // 2

stroke(240); // eyes
fill(220);
ellipse(120,140,20,10);
ellipse(200,140,20,10);
stroke(240); // pupils
fill(235,235,215);
ellipse(120,140,6,6);
ellipse(200,140,6,6);

stroke(130); // nostrils
fill(130);
ellipse(140,190,5,10);
ellipse(180,190,5,10);

strokeWeight(2);
stroke(255,255,235);
fill(255,255,235);
triangle(100,200,220,200,160,260); // beak
stroke(235,235,215);
line(170,170,220,200);
line(100,200,150,170);
bezier(150,170,155,160,165,160,170,170);

stroke(225,225,205); //Mandible 1
triangle(15,245,100,200,115,215);
triangle(15,245,55,245,115,215);
triangle(15,245,55,245,100,285);
triangle(55,245,100,285,125,280);
triangle(100,285,125,280,125,290);
triangle(125,290,125,280,140,275);
triangle(125,290,150,275,140,275);
triangle(140,270,140,275,150,275);

stroke(225,225,205); // Mandible 2
triangle(205,215,220,200,305,245);
triangle(205,215,265,245,305,245);
triangle(265,245,305,245,220,285);
triangle(265,245,195,280,220,285);
triangle(195,280,195,290,220,285);
triangle(195,280,195,290,180,275);
triangle(170,275,195,290,180,275);
triangle(170,275,180,270,180,275);

stroke(255,255,235,160); // Mandible Line Blocker
line(100,200,115,215);
line(205,215,220,200);
