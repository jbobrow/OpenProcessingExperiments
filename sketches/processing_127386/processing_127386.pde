
int counter = 0;

void setup()
{
size(400,400);
background(255);

strokeWeight(5);
stroke(#090595);
line(0,0,200,200);

strokeWeight(5);
stroke(#090595);
line(200,200,400,0);

stroke(0,255,0);
fill(#090595);

ellipse(300,100,100,100);
ellipse(100,100,100,100);
fill(255);

ellipse(300,100,50,50);
arc(300,300,100,100,0,radians(45));
}


