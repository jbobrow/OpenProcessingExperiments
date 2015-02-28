
size(600,600);
background(0,210, 205);
stroke(0);
strokeWeight(10);
ellipse(300,300,600,600);

//X
stroke(200,5,20);
strokeWeight(20);
line(260,50,350,130);
line(350,50,260,130);

//eyes
fill(200,5,20);
ellipse(170,220,175,175);
ellipse(430,220,175,175);

//pupils
fill(0);
stroke(0,210, 205);
ellipse(170,220,150,155);
ellipse(430,220,150,155);

//light/reflection
fill(255);
ellipse(130,175,35,45);
ellipse(390,175,35,45);
fill(255);
ellipse(200,250,60,75);
ellipse(460,250,60,75);

//nose
strokeWeight(2);
fill(200,5,20);
triangle(245,350,300,320,355,350);

//mouth
noFill();
stroke(0);
strokeWeight(4);
bezier(5,250,100,450,500,450,595,250);

//teeth
fill(200,5,20);
triangle(300,600,355,400,245,400);
triangle(150,375,245,400,215,587);
triangle(450,375,355,400,385,587);
triangle(60,325,150,375,135,553);
triangle(540,325,450,375,465,553);
triangle(65,483,5,250,60,325);
triangle(535,483,595,250,540,325);
