
// Gregory Taxerman, Penguin, CP1 16/17
//http://gtprograms.hostei.com/Spider.html

size(800,800);
background(255,255,255);

//web
stroke(140,140,140,90);
strokeWeight(10);
noFill();

beginShape();
vertex(100,400);
vertex(200,50);
vertex(600,50);
vertex(700,400);
vertex(600,750);
vertex(200,750);
endShape(CLOSE);

beginShape();
vertex(150,400);
vertex(200,100);
vertex(600,100);
vertex(650,400);
vertex(600,700);
vertex(200,700);
endShape(CLOSE);

beginShape();
vertex(200,400);
vertex(200,150);
vertex(600,150);
vertex(600,400);
vertex(600,650);
vertex(200,650);
endShape(CLOSE);

beginShape();
vertex(200,400);
vertex(300,200);
vertex(500,200);
vertex(600,400);
vertex(500,600);
vertex(300,600);
endShape(CLOSE);

rect(300,200,200,400);

beginShape();
vertex(300,400);
vertex(350,250);
vertex(450,250);
vertex(500,400);
vertex(450,550);
vertex(350,550);
endShape(CLOSE);

rect(350,250,100,300);

line(200,50,350,250);
line(600,50,450,250);
line(600,750,450,550);
line(200,750,350,550);
line(100,400,350,400);
line(700,400,450,400);

//spider body
strokeWeight(6);
stroke(0,0,0);
fill(62,35,139);
ellipse(550,350,200,200);
ellipse(550,450,150,150);

//eyes
stroke(255,0,0);
point(500,450);
point(525,450);
point(575,450);
point(600,450);
point(510,475);
point(535,475);
point(565,475);
point(590,475);

//fangs
quad(520,510,500,520,500,530,520,560);
quad(580,510,600,520,600,530,580,560);

//legs
stroke(0,0,0);
line(470,400,450,500);
line(630,400,650,500);
line(455,385,425,505);
line(650,380,675,510);
line(475,285,400,505);
line(630,285,700,505);
line(490,280,450,200);
line(615,280,650,200);
