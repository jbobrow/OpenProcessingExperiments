
color c1 = color(165,0,0), c2 = color(0,0,255), current;
void setup() { 
current = c1;
size(600,600);}
void draw() { 
background(current);
fill(165,0,0);
arc(500,100,90,90,PI+HALF_PI,TWO_PI);
arc(100,500,90,90,HALF_PI,PI);
rect(290,300,20,300);
fill(0,0,255);
arc(100,100,90,90,PI,PI+HALF_PI);
arc(500,500,90,90,0,HALF_PI);
rect(290,0,20,300);
fill(0,0,255);
rect(0,290,300,20);
fill(165,0,0);
rect(300,290,300,20);
triangle(0,400,300,300,200,600);
fill(0,0,255);
triangle(600,400,300,300,400,600);
fill(165,0,0);
triangle(400,0,300,300,600,200);
ellipse(550,50,80,80);
ellipse(50,550,80,80);
fill(0,0,255);
triangle(0,200,300,300,200,0);
ellipse(50,50,80,80);
ellipse(550,550,80,80);
fill(183,9,219);
ellipse(300,300,80,80);
fill(79,0,129);
quad(260,300,300,260,340,300,300,340);
line(260,300,340,300);
line(300,260,300,340);
}
void mousePressed() { if(current==c1) { current = c2; } else { current = c1; }}
// to get the background to change colors with the left click I used code from an outside source when looking for how to color the background.


