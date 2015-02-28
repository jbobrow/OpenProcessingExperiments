
size(1000, 1000);
background(0, 250, 0);

//himmel
fill(0, 185, 234);
stroke(0, 185, 234);
rect(0, 0, 1000, 300);

//sol
stroke(255, 132, 0);
fill(255, 132, 0);
ellipse(950, 50, 60, 60);

//mand
stroke(0, 0, 0);
//mand 2
line(600, 500, 600, 550);
//mand 1
line(500,500,500,550);

//ben
//mand 2
line(600, 550, 580, 600);
line(600, 550, 620, 600);
//mand 1
line(500,550,480,600);
line(500,550,520,600);

//arme
//mand 2
line(600, 525, 620, 535);
line(600, 525, 580, 535);
//mand 1
line(500,525,520,535);
line(500,525,480,535);

//hoved
fill(255, 255, 255);
//mand 2
ellipse(600, 500, 40, 40);
//mand 1
ellipse(500,500,40,40);

//øjne
fill(0,0,0);
//mand 1
ellipse(490,500,4,4);
ellipse(510,500,4,4);

//mand 2
ellipse(590,500,4,4);
ellipse(610,500,4,4);
//hus
stroke(0,0,0);
fill(0,0,0);
rect(150,200,150,200);
//tag

fill(0,0,0);
stroke(0,0,0);
triangle(225,100,150,200,300,200);
