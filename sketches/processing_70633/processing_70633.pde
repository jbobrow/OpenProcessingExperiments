
void setup(){
size( 500, 500);
background(255);
}
void draw(){
smooth();
noStroke();
fill(35,67,108);
//torso
ellipseMode(CORNERS);
ellipse(80,130,140,180);
fill(25,72,131);
ellipse(70,70,150,150);
rectMode(CORNERS);
fill(140,205,247);
rect(70,80,50,130);
rect(150,80,170,130);
fill(53,110,165);
ellipse(45,70,75,100);
ellipse(145,70,175,100);
ellipse(90,20,130,80);
//head triangle
fill(129,167,216);
triangle(80,20,110,50,140,20);
//hands
fill(100);
ellipse(50,210,80,240);
ellipse(140,210,170,240);
//legs and feet
stroke(0);
strokeWeight(5);
line(90,210,100,235);
line(130,210,120,235);
noStroke();
ellipse(90,230,110,240);
ellipse(110,230,130,240);
//arms and hands
fill(21,49,85);
triangle(20,120,50,130,30,170);
triangle(175,130,200,120,190,170);
fill(53,110,165);
ellipse(30,110,80,230);
ellipse(140,110,190,230);
//moar legs
ellipse(80,160,100,220);
ellipse(120,160,140,220);
//eyes
strokeWeight(1);
fill(224,18,73);
stroke(255,46,64);
triangle(95,50,105,65,105,50);
triangle(115,50,115,65,125,50);
}
