
//setup
size(400,400);
background(230,230,250);

//box
noStroke();
rect(90,90,220,240);

//feet
noStroke();
fill(255,165,0);
triangle(110,320,170,320,170,280);
triangle(290,320,230,320,230,280);

//wings
fill(147,112,219);
ellipse(285,240,30,100);
ellipse(115,240,30,100);

//body
fill(147,112,219);
ellipse(200,170,170,150);
ellipse(200,230,200,180);

//white spot
fill(255);
ellipse(200,250,120,100);

//beak
fill(255,165,0);
triangle(180,180,220,180,200,220);

//eyes
strokeWeight(10);
stroke(0);
line(150,150,150,170);
line(250,150,250,170);



