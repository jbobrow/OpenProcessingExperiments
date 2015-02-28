
int a =0;
int y = 0;
int b =0;
int c =0;
int d =0;
int e =0;
int f =0;
int g =0;
int h = 0;
int i = 0;
int count = 0;
int z = 0;

void setup(){
size(200,200);
background(0);
}
void draw(){
background(0);
fill(94,234, 26);
ellipse(40+a, 25+z, 25, 25);
ellipse(55+b, 25+y, 25, 25);
fill(45,67,98);
ellipse(70+c, 25+z, 25, 25);
ellipse(85+d, 25+y, 25, 25);
fill(123,100,99);
ellipse(100+e, 25+z, 25, 25);
ellipse(115+f, 25+y, 25, 25);
fill(98,54,200);
ellipse(130+g, 25+z, 25, 25);
ellipse(145+h, 25+y, 25, 25);
ellipse(160+i, 25+y, 25, 25);
fill(180,40,155);
ellipse(155+i, 20+y, 5, 5);
ellipse(165+i, 20+y, 5, 5);
fill(180,99,32);
ellipse(160+i, 25+y,4,4);
fill(255);
arc(155+i,15+y,24,25,radians(250),radians(260));
arc(165+i,15+y,24,25,radians(270),radians(280));
if (mousePressed==true){
y++;
a++;
b++;
c++;
d++;
e++;
f++;
g++;
h++;
i++;
count++;
if(count >10){
z++;
}
}
}

