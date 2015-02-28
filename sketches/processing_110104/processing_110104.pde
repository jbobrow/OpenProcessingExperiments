

void setup()
{

size(400, 500); 

background(#1A34D6);



rectMode(CENTER);

float x = 150;
float x1quad = 75;
float x2quad = 10;
fill(#FCFDFF);
noStroke();
rect(285, 104, 20, 400);
rect(285 + 40, 104, 20, 400);
rect(285 + 80, 104, 20, 400);



fill(#FCFDFF);
stroke(#000105);
strokeWeight(3);
stroke(#FCFDFF);


fill(#000105);
triangle(177,30,177,139,347,30);


ellipse(x - 20,90, width / 3, width / 3);
fill(#000105);
ellipse(x + 20,90, width / 3, width / 3);
ellipse(x + 40,90, width / 3, width / 3);

arc(0, 500, 200, 200, TWO_PI-PI/2, TWO_PI);
strokeWeight(2);
fill(#1A34D6);

arc(215, 110, 50, 50, 0, PI/2);

fill(#FCFDFF);

arc(200, 100, 130, 130, PI, TWO_PI-PI/2);

stroke(#000105);
strokeWeight(2);
rect(162,376,800,20);
noStroke();
fill(#000105);
rect(162,376.5,800,10);


fill(#000105);
stroke(#FCFDFF);
strokeWeight(3);
quad(x1quad,200,x1quad,275,x2quad,350,x2quad,275);
quad(x1quad + 70,200,x1quad + 70,275,x2quad + 70 ,350,x2quad + 70 ,275);
quad(x1quad + 140,200,x1quad + 140,275,x2quad + 140 ,350,x2quad + 140 ,275);
rect(350,300, 200, 100);
rect(300,450, 250, 100);


fill(#FCFDFF);
stroke(0);

triangle(15, 275, 70, 275, 15, 340); 
quad(178,271,178,249,211,210,211,271);
ellipse(327,373,125,125);
fill(#1A34D6);
ellipse(327,373,115,115);
noStroke();
fill(#000105);
arc(327, 373, 100, 100, 0, PI/2);
fill(#FCFDFF);
arc(327, 373, 100, 100,PI, TWO_PI-PI/2);
fill(#1A34D6);
stroke(#FCFDFF);
strokeWeight(2);
ellipse(327,373,25,25);


}



