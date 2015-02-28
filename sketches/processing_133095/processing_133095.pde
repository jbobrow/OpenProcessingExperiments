
println("hello Kaitlyn");
size(600, 500);
float hectic = 300;
background(255,0,0);

fill(0,255,0);
noStroke();
ellipse(hectic, 200, 160, 160);

stroke(0,0,0);
strokeWeight(7);
strokeCap(SQUARE);
line(hectic-40, 200-20, hectic-10, 200-10);
line(hectic+40, 200-20, hectic+10, 200-10);

line(hectic+40,200,hectic+80,200);
line(hectic-30, 200, hectic+70, 200);
line(hectic-80, 200, hectic-34, 200);

ellipse(hectic-30, 200, 10, 10);
ellipse(hectic+30, 205, 20, 20);
ellipse(hectic, 240, 65, 30);

stroke(0);
ellipse(hectic+30, 205, 20, 20);
ellipse(hectic-30, 200, 3, 3);



noStroke();
fill(0,0,0);
triangle(hectic,300,hectic-100,350,hectic-100,250);
triangle(hectic,300,hectic+100,350,hectic+100,250);
rectMode(CENTER);
ellipse(hectic,335,20,20);
ellipse(hectic,360, 15, 15);


fill(0);
rect(225,550,50,50);
triangle(hectic-100,250,hectic, 400, hectic-100, 500);
triangle(hectic+100,250,hectic, 400, hectic+100, 500);

//triangle(hectic-100,500,hectic,400,hectic+100,500);
//line(hectic-100,500,hectic,400);
//line(hectic,400,hectic+100,500);
fill(200,200,200);


//bowtie
noStroke();
fill(0,0,0);
triangle(hectic,300,hectic-100,350,hectic-100,250);
triangle(hectic,300,hectic+100,350,hectic+100,250);
rectMode(CENTER);
ellipse(hectic,300,35,35);


rect(hectic-50,450,100,100);
rect(hectic+50,450,100,100);



//hat

fill(255,255,255);
noStroke();
ellipse(hectic, 130, 105, 75);
ellipse(hectic, 90, 70, 60);
ellipse(hectic,55,40,40);


//teeth
stroke(0, 0, 0);
strokeWeight(2);
rect(hectic+5, 232, 10, 10);
rect(hectic-5, 232, 10, 10);
rect(hectic, 248, 10, 10);

rectMode(CORNER);
fill(80,80,80,100);
noStroke();
rect(hectic,0,hectic,800);

//outline
//rectMode(CORNER);
//noStroke();
//fill(80,80,80,200);
//rect(400, 30, 200, 350);











