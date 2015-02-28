
size(400,400);
background(120,120,180);
//mouse
fill(70,40,30,220);
ellipse(190,190,120,120);
ellipse(130,130,50,50);
ellipse(250,130,50,50);
ellipse(190,315,150,150);
//nose
fill(0);
triangle(190,190,180,200,200,200);
//eyes
fill(55,150,100);
ellipse(170,170,20,15);
ellipse(210,170,20,15);
fill(0,0,0,0);
//smile
arc(190,220,15,15, 0, PI+QUARTER_PI);
fill(50);
rect(0,350,400,400);
//cat
quad(0,220,0,230,200,20,250,40);
arc(0, 20, 250, 400, 0, PI+QUARTER_PI);
quad(200,20,250,40,300,70,330,40);
fill(255);
stroke(255);
triangle(0,120,10,130,5,150);
//cateye
stroke(0);
fill(25,250,175,200);
quad(38, 31, 86, 20, 69, 63, 30, 76);
line(86,20,30,76);
//cheese
fill(250,255,5,255);
stroke(280,245,20,255);
triangle(30,250,30,350,120,320);
