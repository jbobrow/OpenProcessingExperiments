
void setup()
{
size(500,500);
frameRate(10);
point(210,325);
stroke(255,0,0);
fill(255,0,0);

triangle(250,0,20,125,470,125);
stroke(68,148,98);
fill(68,148,98);
rect(40,125,410,275);
stroke(23,227,21);
fill(23,227,21);
rect(0,400,500,100);
stroke(198,114,2);
fill(198,114,2);

rect(165,250,90,150);
stroke(0,0,0);
fill(240,222,27);
stroke(0,0,0);
}
int punkt1 =164;
int punkt2 =164;
int punkt3 =164;
int punkt4 =200;
int punkt5 =164;
int punkt6 =128;
void draw()
{
background(255,255,255);
ellipse(punkt5,240,40,40);
line(punkt1,260,punkt2,340);
line(punkt3,262,punkt4,340);
line(punkt1,262,punkt6,174);

line(punkt1,340,punkt3,400);
line(punkt2,340,punkt4,400);
punkt1 =punkt1+5;
punkt3 =punkt3+5;
punkt2 =punkt2+5;
punkt4 =punkt4+5;
punkt5 =punkt5+5;
punkt6 =punkt6+5;
}
