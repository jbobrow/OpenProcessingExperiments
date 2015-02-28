
int a;
int d;
size(400,400);
a= width;
d= a/4;
background(250,250,250);
fill(242,219,0);
stroke(85,68,9);
//cos
strokeWeight(5);
rect(d,d,a/2,height-d,20);
// boca
stroke(0,0,0);
strokeWeight(5);
ellipse(a/2,a/2+d/2,d,d);
strokeWeight(5);
stroke(242,219,0);
rect(a/2-d/1.5,a/2,d/2,d/2);
rect(a/2+d/28,a/2,d/2,d/2);

// olleres
stroke(0,0,0);
fill(0,0,0);
rect(a/4,2*d,a/2,height/32);
//ulls
stroke(147,140,133);
fill(250,250,250);
ellipse(a/2+d/2,2*d,a/5,a/5);
ellipse(a/2-d/2,2*d,a/5,a/5);

strokeWeight(1);
stroke(113,64,14);
fill(113,64,14);
ellipse(a/2-d/2,2*d,a/10,a/10);
ellipse(a/2+d/2,2*d,a/10,a/10);

strokeWeight(1);
stroke(113,64,14);
fill(0,0,0);
ellipse(a/2-d/2,2*d,a/15,a/15);
ellipse(a/2+d/2,2*d,a/15,a/15);

//xaleco
strokeWeight(2);
stroke(0,0,0);
fill(53,157,245);
rect(a/4+d/3,d*3+10,d+d/3,d-12,10);

rect(d,d*3+10,d/2+d/6,d/4,10);
rect(d*2+d/3,d*3+10,d/2+d/6,d/4,10);
//botons
fill(0,0,0);
ellipse(d+d/2+d/6-d/8,d*3+10+d/8,d/6,d/6);
ellipse(d*2+d/3+d/8,d*3+10+d/8,d/6,d/6);

//gorru
fill(53,157,245);
triangle(d*2,d/2,d+d/2,d,d*2+d/2,d);

//cabells
line(d+10,d-10,d+20,d+10);
line(d+40,d-10,d+30,d+10);
line(d+65,d-10,d+65,d+10);
line(d+80,d-10,d+70,d+10);
line(d+100,d-10,d+80,d+10);
line(d+110,d-10,d+120,d+10);
line(d+130,d-10,d+140,d+10);
line(d+160,d-10,d+150,d+10);
line(d+180,d-10,d+170,d+10);


















