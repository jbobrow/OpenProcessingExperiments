
//specify size of sketch window
size(800,600);

//fills all shapes after the command
fill(100, 40, 200);

//specify color; red green blue
background(100, 40, 200);

//changes the line color and how big the line is
stroke(50,200,100);
strokeWeight(10);

//make the j (x1, y1, x2, y2)
//long line
line(150,100,150,350);
//bottom arc
arc(100,350,100,100,0,PI);
//right line
line(50,350,50,300);

//make the a
//the circle
ellipse(220,350,100,100);
//the line coming off
line(270,350,275,400);

//make the m
//first arc
arc(350, 350, 100,100, PI,TWO_PI);
//second arc
arc(450, 350, 100,100, PI,TWO_PI);
//first line, line on the left
line(300,300,300,400);
//line in the middle
line(400,350,400,400);
//line on the right
line(500,350,500,400);

//make the e
//the outside of the e
arc(570, 350, 100,100, QUARTER_PI,TWO_PI);
//the line in the middle of the e
line(520,350,620,350);

//make the y
//top arc
arc(700,350,100,100,0,PI);
//left line
line(650,300,650,350);
//right line
line(750,300,750,500);
//bottom arc
arc(700,500,100,100,0,PI);

//initials

//make the j (x1, y1, x2, y2)
//long line
line(400,50,400,150);
//bottom arc
arc(350,150,100,100,0,PI);

//make the a
//left line
line(460,50,420,200);
//right line
line(460,50,500,200);
//middle line
line(440,150,480,150);

//make the p
//left line
line(530,51,530,200);
//arc that makes swoopy p
arc(537,90,100,80,PI,TWO_PI+HALF_PI);

//other options for the p
//arc that makes regular p
//arc(535,90,100,80,PI+HALF_PI,TWO_PI+HALF_PI);
//circle makes weird looking p
//ellipse(570,90,70,90);

//changes the line color
stroke(100,190,240);
strokeWeight(15);


//the line going up and down from left to right
line(50,450,150,420);
line(150,420,250,450);
line(250,450,350,420);
line(350,420,450,450);
line(450,450,550,420);
line(550,420,650,450);
line(650,450,750,420);





