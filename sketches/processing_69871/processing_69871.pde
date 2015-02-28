
void setup()
{

size(600,600);
background(200,20,20);

//draw face
strokeWeight(12.0);
strokeCap(ROUND);
ellipseMode(CENTER);
fill(250,200,200);
ellipse(300,300,300,300);

//draw eyes
strokeWeight(10.0);
ellipseMode(CENTER);
fill(255);
ellipse(257.5,247.5,59.5,90);
ellipse(347.5,247.5,59.5,90);

//draw mouth
strokeWeight(8.0);
bezier(220,320,269,386,345,383,380,320);
bezier(220,320,262,355,232,417,300,430);
bezier(380,320,338,355,368,417,300,430);

//draw nose
strokeWeight(6.0);
fill(250,200,200);
ellipseMode(CENTER);
ellipse(300,320,30,30);

//draw shoulder
fill(200,200,0);
bezier(230,432.665,169,448,131,532,115,580);
bezier(370,432.665,431,448,471,532,485,580);
line(115,580,485,580);

//draw shirt
fill(0,100,250);
beginShape();
vertex(230,500);
vertex(150,600);
vertex(450,600);
vertex(370,500);
endShape(CLOSE);}



//draw eyeballs
void draw()
{
   loop();
   fill(0);
   ellipse(random(247,270),random(230,260),25,49.5);
   ellipse(random(335,360),random(235,260),25,49.5);}
