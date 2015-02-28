
size(300,300);

smooth();
background(20,170,200);

color body = color(230,230,230);
color earsnose = color(0,0,0);
color black = color(0,0,0);

//body
fill(body);
stroke(0,0,0);
ellipse(100,180,130,150);
stroke(0,0,0);
ellipse(100,205,90,100);
//feet
fill(body);
stroke(0,0,0);
ellipse(60,250,50,30);
stroke(0,0,0);
ellipse(140,250,50,30);

//ear
fill(body);
stroke(0,0,0);
triangle(50,30,50,70,90,40);
triangle(150,30,150,70,110,40);
//face
fill(body);
stroke(0,0,0);
ellipse(100,80,110,100);
//nose
fill(earsnose);
stroke(1);
triangle(100,115,90,105,110,105);
//eyes
strokeWeight(2);
line(60,85,85,90);
line(140,85,115,90);
