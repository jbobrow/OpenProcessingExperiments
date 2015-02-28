
size(200,200);
background(255);
smooth();
//body
fill(200,200,0);
ellipseMode(CENTER);
ellipse(50,50,50,25);

//roga
/*fill(200,0,0);
line(48,40,38,5);
fill(200,0,0);
line(52,40,62,5);*/
noFill();
arc(48,40,38,5,0,TWO_PI-PI/2);
fill(200,100,0);
ellipse(38,5,2,2);
fill(200,100,0);
ellipse(62,5,2,2);

//eyes
fill(100,200,0);
ellipse(40,50,2,2);
fill(100,200,0);
ellipse(60,50,2,2);
