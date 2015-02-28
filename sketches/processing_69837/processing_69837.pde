
Assingment#1
Name: Siyang You
E-mail: syou@brynmawr.edu
Course: CS 110 - Section #1
Submitted: 09/12/2012


void setup()
{

size(600,600);
background(200,20,20);

//draw face
strokeWeight(12.0);
strokeCap(ROUND);
arc(300,300,300,300,-1.047,4.189);


line(225.5,170,215.5,192.5);
line(375.5,170,385,192.5);
line(375.5,170,485,200);

strokeWeight(9.0);
line(225.5,215,225.5,280);
line(290,215,290,280);
line(310,215.5,310,280);
line(375,215,375,280);

strokeWeight(12.0);
line(125,270,152.5,270);
line(125,330,152.5,330);
line(447.5,270,475.5,270);
line(447.5,330,475.5,330);

bezier(230,432.665,169,448,131,532,115,580);
bezier(370,432.665,431,448,471,532,485,580);

line(115,580,485,580);

//draw mouth
strokeWeight(8.0);
bezier(220,320,269,386,345,383,380,320);
bezier(220,320,262,355,232,417,300,430);
bezier(380,320,338,355,368,417,300,430);

//draw nose
strokeWeight(6.0);
ellipseMode(CENTER);
ellipse(300,320,30,30);

strokeWeight(12.0);
bezier(125,270,94,273,83,325,125,330);
bezier(475.5,270,506.5,273,517.5,325,475.5,330);

//draw eyes
strokeWeight(10.0);
bezier(225.5,215,231,181,290,182,290,216);
bezier(310,215,320.5,181,370.5,182,375.5,216);
bezier(225.5,270,231,310,290,310,290,270);
bezier(310,270,320.5,310,370.5,310,375.5,270);


line(105,200,225.5,170);}


//draw hat
void draw()
{
  fill(random(255),random(255),random(255));
rectMode(CORNER);
rect(225,100,150,70);


//draw eyeballs

  fill(random(255),random(255),random(255));
ellipseMode(CENTER);
ellipse(275,245.5,25,49.5);
ellipse(360,245.5,25,49.5);}
