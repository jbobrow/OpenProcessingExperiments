



float x; 
void setup()


{
size(250,250);
noStroke();
frameRate(70);
}

void draw()
{
background(0);

stroke(#4AD8D7);
strokeWeight(5);

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(220,0,260,40);
fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(210,30,260,80);
fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(220,70,260,110);
fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(210,100,260,150);
fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(220,140,260,180);
fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(210,170,260,220);
fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(210,210,260,260);

x = x + 1.5;
translate(x, 150); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);


translate(60,-60); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(20,-100); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(-90,-20); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(-70,40); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(40,70); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(-50,50); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(-80,20); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);

translate(20,-60); 

fill(255);
smooth();
ellipseMode(CORNERS);
ellipse(40,40,80,80);




}

