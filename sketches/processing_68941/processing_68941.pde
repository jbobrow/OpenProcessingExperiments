
size(500,400);
background(140);

//NIÑO1____________________
//Variables
int fat=(50);
int smile=(15);
int ojos=(5);
//Cuerpo
fill(130,180,240);
noStroke();
rect(70,160,80,50);
beginShape();
vertex(20,220);
vertex(220,220);
vertex(130,240);
vertex(150,380);
vertex(110,300);
vertex(70,380);
vertex(90,240);
endShape(CLOSE);
ellipse(110,265,50+fat,100);
//Ojos
fill(255);
ellipse(90,180,15+ojos,20+ojos);
ellipse(130,180,15+ojos,20+ojos);
//Boca
arc(110,195,40,10+smile,0,PI);
//Pelo
fill(240,150,0);
beginShape();
vertex(70,160);
vertex(85,135);
vertex(90,150);
vertex(120,130);
vertex(125,140);
vertex(140,145);
vertex(145,125);
vertex(150,160);
endShape(CLOSE);

//NIÑO2____________________
//Variables
int muv=(260);
int pelo=(90);
int alt=(20);
//Cuerpo
fill(130,180,240);
noStroke();
rect(70+muv,160-alt,80,50);
beginShape();
vertex(20+muv,220-alt);
vertex(220+muv,220-alt);
vertex(130+muv,240-alt);
vertex(150+muv,380);
vertex(110+muv,300-alt);
vertex(70+muv,380);
vertex(90+muv,240-alt);
endShape(CLOSE);
ellipse(110+muv,265-alt,50,100);
//Ojos
fill(255);
ellipse(90+muv,180-alt,15,20);
ellipse(130+muv,180-alt,15,20);
//Boca
arc(110+muv,195-alt,40,10,0,PI);
//Pelo
fill(pelo);
beginShape();
vertex(70+muv,160-alt);
vertex(85+muv,135-alt);
vertex(90+muv,150-alt);
vertex(120+muv,130-alt);
vertex(125+muv,140-alt);
vertex(140+muv,145-alt);
vertex(145+muv,125-alt);
vertex(150+muv,160-alt);
endShape(CLOSE);

//RATA_____________________
//Variables
int dientes=(15);
int ojosr=(3);
int bigote=(5);
//Cuerpo
fill(230);
beginShape();
vertex(230,300);
vertex(250,300);
vertex(270,340);
vertex(255,335);
vertex(265,390);
vertex(241,380);
vertex(215,390);
vertex(225,335);
vertex(210,340);
endShape(CLOSE);
fill(255,150,110);
ellipse(225,335,10,20);
ellipse(255,335,10,20);
arc(215,390,20,15,PI,TWO_PI);
arc(265,390,20,15,PI,TWO_PI);
//Dientes
stroke(1);
fill(255,255,150);
rect(237,300,3,10+dientes);
rect(240,300,3,10+dientes);
//Cabeza
noStroke();
fill(255);
triangle(220,280,260,280,240,320);
ellipse(220,280,20,40);
ellipse(260,280,20,40);
fill(255,100,100);
ellipse(235,290,8,8-ojosr);
ellipse(245,290,8,8-ojosr);
//Bigotes
stroke(1);
line(235,305,209-bigote,305);
line(235,307,212-bigote,308);
line(235,309,215-bigote,312);
line(245,305,270+bigote,305);
line(245,307,268+bigote,308);
line(245,309,265+bigote,312);
