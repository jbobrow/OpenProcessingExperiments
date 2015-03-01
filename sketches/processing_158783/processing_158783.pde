
size(1240,750);
background(22,46,100);
smooth();
strokeJoin(ROUND);
strokeWeight(4);
stroke(255);

//Background one
beginShape();
fill(55,102,201,100);
vertex(0,350);
vertex(400,400);
vertex(700,250);
vertex(1250,275);
vertex(1250,750);
vertex(0,750);
endShape();
//End Background one

//Background two
beginShape();
fill(44,109,245,100);
vertex(0,600);
vertex(200,620);
vertex(250,610);
vertex(500,570);
vertex(1000,450);
vertex(1250,480);
vertex(1250,750);
vertex(0,750);
endShape();
//End Background two

//Ground
stroke(150);
beginShape();
fill(30);
stroke(255);
vertex(0,650);
vertex(400,605);
vertex(900,595);
vertex(1250,625);
vertex(1250,750);
vertex(0,750);
endShape();

stroke(100);
strokeWeight(2);
int i=0;
while (i<1250){
line(i,730,i+80,650);
i= i + 50;
}

//Endground

//Swirl One
stroke(52,167,234);
noFill();
strokeWeight(10);
beginShape();
vertex(0,100);
curveVertex(200,310);
curveVertex(300,280);
curveVertex(450,180);
curveVertex(620,140);
curveVertex(760,155);
curveVertex(785,200);
curveVertex(700,300);
endShape();
//End Swirl One

//Swirl Two
stroke(115,167,234);
strokeWeight(5);
beginShape();
vertex(0,400);
curveVertex(200,410);
curveVertex(200,410);
curveVertex(300,350);
curveVertex(550,220);
curveVertex(760,205);
curveVertex(730,325);
curveVertex(310,245);
endShape();
//End Swirl Two


//Swirl Three and Four
strokeWeight(5);
stroke(110,220,265);
curveTightness(.1);
beginShape();
curveVertex(740,280);
curveVertex(690,300);
curveVertex(700,350);
curveVertex(800,350);
curveVertex(900,300);
curveVertex(970,340);
curveVertex(960,380);
endShape();

beginShape();
curveVertex(690,250);
curveVertex(650,310);
curveVertex(700,350);
curveVertex(800,355);
curveVertex(900,300);
curveVertex(950,350);
curveVertex(910,390);
curveVertex(880,390);
curveVertex(830,300);
endShape();
//End Swirl Three and Four

//Black shape
fill(10);
strokeWeight(2);
stroke(5);
beginShape();
vertex(250,750);
vertex(225,700);
vertex(250,650);
vertex(235,600);
vertex(260,400);
vertex(257,350);
vertex(265,370);
vertex(270,350);
vertex(267,270);
vertex(259,250);
vertex(265,200);
vertex(272,250);
vertex(278,260);
vertex(280,275);
vertex(284,350);
vertex(290,400);
vertex(310,500);
vertex(315,470);
vertex(320,500);
vertex(330,550);
vertex(325,480);
vertex(335,460);
vertex(345,490);
vertex(356,500);
vertex(360,525);
vertex(375,550);
vertex(375,580);
vertex(393,650);
vertex(387,750);
vertex(250,750);
endShape(CLOSE);
//End shape two


//Stars
ellipseMode(CENTER);
fill(512,192,48);
ellipse(1120,100,150,150);
ellipse(677,400,30,30);
fill(240,159,7);
ellipse(100,50,25,25);
ellipse(322,50,19,19);
fill(220,110,22);
ellipse(250,88,32,32);
fill(255);
stroke(2);
ellipse(1135,80,100,100);
ellipse(370,400,100,100);
fill(222,198,16);
ellipse(200,300,44,44); 
fill(222,77,16);
ellipse(800,130,52,52);
//End Stars

//Buildings
beginShape();
stroke(255);
strokeWeight(2);
noFill();
vertex(480,680);
vertex(495,660);
vertex(510,680);
vertex(530,675);
vertex(540,610);
vertex(547,670);
vertex(547,700);
vertex(510,710);
vertex(510,680);
vertex(480,680);
vertex(480,712);
vertex(510,710);
vertex(510,680);
vertex(495,660);
vertex(530,655);
endShape();



