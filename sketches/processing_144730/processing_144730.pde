
/*@pjs preload = "http://i.imgur.com/rT61ran.jpg"; */
PImage a;

void setup()
{
  
size(650, 600);
a=loadImage("http://i.imgur.com/rT61ran.jpg");
image(a, 0, 0, 600, 600);
}
void draw()
{
filter(THRESHOLD);
frameRate(30);

for (int i=0; i<50; i++) 
{

  stroke(#DC143C);
  strokeWeight(random(1, 3));
  line(340, 275, random(0, 150), random(0, 150));
  noStroke();
}
stroke(#7171C6);
line(265, 550, 200, 550);
line(270, 500, 200, 500);
line(260, 530, 200, 530);
line(260, 575, 200, 575);
noStroke();
stroke(#FFFFFF);
ellipse(405,292,2,2);
ellipse(415,292,2,2);
strokeWeight(1.5);
line(405,292,415,292);
}


