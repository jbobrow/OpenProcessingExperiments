
size(600,600);
background(255);

//épaisseur du trait pour toutes les formes
strokeWeight(3);

//1 RECTANGLE (en bas poisoon pêché)
rect(100,200,100,100);
line(200,200,150,250);
line(150,250,150,300);
line(120,250,100,300);
line(150,250,100,250);
line(100,200,100,250);
line(100,200,200,300);


//2 RECTANGLE (souris)
rect(300,400,100,100);
line(400,400,350,450);
line(350,450,300,450);
line(350,450,350,470);
line(350,470,320,470);
line(320,470,320,400);


//3 (gauche bas)
rect(300,200,100,100);
line (320,200,320,280);
line(320,280,380,280);
line(380,280,380,230);
line(320,280,400,240);
line(380,230,400,240);

//4 (1er gauche-première ligne)
rect(100,50,100,100);
line(150,50,150,100);
line(150,100,200,100);
ellipse(142,110,20,20);


//5 ( 2eme milieu-première ligne)
rect(300,50,100,100);
line(350,50,350,100);
line(350,100,300,100);
ellipse(358,110,20,20);

//6 (1er triangle)
rect(450,50,100,100);
noFill();
arc(450,50,25,25,0,HALF_PI);
arc(550,50,25,25,HALF_PI,PI);
triangle(500,148,452,65,548,65);


//7 (2ème triangle)
rect(450,200,100,100);
noFill();
arc(450,200,25,25,0,HALF_PI);
arc(550,200,25,25,HALF_PI,PI);
line(450,210,500,300);
line(500,300,550,210);


//8 (3ème triangle)

rect(450,350,100,100);
noFill();
arc(450,350,25,25,0,HALF_PI);
arc(550,350,25,25,HALF_PI,PI);
line(500,350,450,450);
line(500,350,550,450);


// 9 (4ème bas)

rect(450,470,100,100);
noFill();
arc(450,470,25,25,0,HALF_PI);
arc(550,470,25,25,HALF_PI,PI);
line(458,480,500,570);
line(458,480,550,570);
line(458,480,458,570);


