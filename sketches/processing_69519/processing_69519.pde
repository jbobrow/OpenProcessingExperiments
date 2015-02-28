
size(500,500);
background(0);
noStroke();

//feet
fill(240,169,15);
triangle(195,390,225,390,213,350);
triangle(500-195,390,500-225,390,500-213,350);

//body
fill(152,91,17);
ellipse(250,250,200,250);
arc(185,280,150,200,PI,3*PI/2);
arc(315,280,150,200,3*PI/2,2*PI);

//eyes
fill(255,255,255);
ellipse(225,210,50,65);
ellipse(270,210,50,65);

//pupils
fill(0,0,0);
ellipse(225,220,25,25);
ellipse(270,220,25,25);

//belly
fill(209,205,194);
ellipse(250,300,90,100);

//beak
fill(240,169,15);
triangle(220,250,250,275,275,250);

//ears
fill(152,91,17);
triangle(160,100,170,180,225,130);
triangle(500-160,100,500-180,180,500-225,130);

//branch
stroke(178,109,18);
strokeWeight(30);
ellipse(250,410,500,7);

//leaves
noStroke();
fill(178,109,18);
bezier(450,475,400,350,320,430,350,400);

//stars and moon
fill(250,222,8);
ellipse(100,100,5,5);
ellipse(450,60,5,5);
ellipse(85,40,5,5);
ellipse(470,140,5,5);
ellipse(300,55,5,5);
fill(245,239,193);
ellipse(5,75,75,75);
