
size(600,500);
background(240,230,140);

fill(0);
noStroke();
quad(400,0, 600,0, 600,500, 200,500);

fill(240,230,140);
stroke(255,255,255,120);
strokeWeight(random(10,20));
ellipse(400,300,300,300);

//triangoli
fill(255,0,0);
noStroke();

triangle(100,250, 180,100,400,300); 
triangle(400,350, 375,400, 500,425);
triangle(500,450,485,480,550,490); 

//cerchi azzurri 
fill(135,206,235,120);
noStroke();
ellipse ( random (150, 450), random (150,400), 100, 100);

fill(135,206,235,90);
noStroke();
ellipse ( random (150, 450), random (150,400), 130, 130);

fill(135,206,235,230);
stroke(0);
strokeWeight(random(2,3));
ellipse ( random (150, 450), random (150,400), 130, 130);

//linee
stroke(255);
strokeWeight(random(3,5));
line(100,400,450,150);

stroke(0);
strokeWeight(2);
line(200,400,550,150);
line(300,100,300,500);

stroke(255);
strokeWeight(random(1,3));
line(50,50,200,150);
line(450,300,550,450);

stroke(0);
strokeWeight(random(2,5));
line(100,50,250,150);

stroke(0);
strokeWeight(random(3,5));
line(0,50,150,150);

//cerchi Verdi
fill(0,255,0,120);
noStroke();
ellipse ( random (300, 500), random (150,400), 130, 130);

ellipse ( random (50, 250), random (0,400), 50, 50);

fill(0,128,0,120);
stroke(0);
strokeWeight(1);
ellipse ( random (50, 250), random (0,400),100, 100);

noStroke();
ellipse ( random (250,450), random (150,350),100, 100);


//cerchi bianchi
fill(255,255,255,random(100,180));
stroke(0);
strokeWeight(1);
ellipse(random(350,550),random(300,450), random(20,50),random(20,50));
ellipse(random(350,550),random(300,450), random(50,100),random(50,100));
noStroke();
ellipse(random(350,550),random(300,450), random(20,50),random(20,50));

fill(255,255,255,random(190,220));
noStroke();
ellipse(random(150,300),random(250,450),150,150);
ellipse(random(0,200),random(0,550),80,80);
stroke(0);
strokeWeight(1);
ellipse(random(0,200),random(0,550),150,150);

fill(255,255,255,100);
stroke(0);
strokeWeight(1);
ellipse(500,100,random(25,50),100);
ellipse(500,100,random(50,75),100);
ellipse(500,100,random(100,150),100);
ellipse(500,100,random(150,200),100);
