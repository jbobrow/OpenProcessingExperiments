
void setup(){size(400,400);
noCursor();
background(135,   206,   250);}

void draw(){frameRate(15);
noStroke();
if (mousePressed == true) {
fill(0);
ellipse(pmouseX,pmouseY,6,6);
fill(255,255,0,200);
ellipse(pmouseX,pmouseY,3,6);}
else {fill(0);
ellipse(mouseX,mouseY,2,2);}
fill(205,149,12);

ellipse(0,0,400,200);
ellipse(0,75,325,150);
ellipse(0,130,250,125);
ellipse(0,160,200,100);


if ((keyPressed == true) && (key == 'b'))
{fill(135,206,250);
rect(0,0,400,400);
fill(205,149,12);
ellipse(0,0,400,200);
ellipse(0,75,325,150);
ellipse(0,130,250,125);
ellipse(0,160,200,100);}}
