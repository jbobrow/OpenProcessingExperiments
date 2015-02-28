
float v;

PShape s;
PShape sm;
void setup()
{

size(900,900);
smooth();
s = loadShape("asterisk.svg");
sm = loadShape("asterisk_mag.svg");


}
void draw()
{
background(255);
strokeWeight(1);
strokeCap(ROUND);







beginShape();
noFill();
stroke(v+20);
strokeWeight(1);
vertex (609,122);
vertex (881,279);
vertex (881,591);
vertex (609,748);
vertex (338,591);
vertex (338,279);
endShape(CLOSE);

//line(338,279,881,591);
line(338,279,881,591);
line(338,279,881,591);
line(609,122,609,748);
line(338,591,881,278);

line(338,435,745,670);
line(474,200,881,436);
line(338,435,745,201);
line(474,200,474,670);
line(745,201,745,670);
line(474,670,881,436);

shape(sm, 568, 245, 75, 75); //top
shape(sm, 568, 400, 75, 75); //middle 
shape(s, 568, 556, 75, 75); //bottom
shape(s, 434, 477, 75, 75); //left corner
shape(s, 434, 322, 75, 75); //top left corner
shape(sm, 705, 322, 75, 75); //top right corner
shape(sm, 705, 477, 75, 75); //bottom right corner


v=mouseX/5;
float v2 = map(v,0,255,0,255);

float mx = map(mouseX, 0, width, 5,50);

}




