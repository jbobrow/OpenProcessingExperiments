
size(100,100);
//variables for position
int x=50;
int y=50;

background(255,226,106);
smooth();
noStroke();

//body
fill(25,89,173);
ellipse(x,y,70,70);
ellipse(x-20,y-35,15,15);
ellipse(x+20,y-35,15,15);

//eyes
fill(255,89,173);
ellipse(x-10,y-22,5,5);
ellipse(x+10,y-22,5,5);

//teeth
fill(255);
arc(x-5,y-15,10,10,0,PI);
arc(x+5,y-15,10,10,0,PI);
