
int red=100;
int green=70;
int blue=70;
int px;

void setup() {
size(500,400);
frameRate(15);
px =0; 
}
 
void draw() {
background(blue,green,red);
   
if(blue<64)blue+=3;
if(green<136)green+=2;
if(red<225)red+=2;

px+=1;
noStroke ();
fill (243,207,65);
ellipse (px,80,60,60);
 
fill (125);
rect (0,340,500,60);//piso

fill (20,120,30); // grama-arvores
rect (340,343,180,27);

fill(94,47,0); // tronco das arvores 
int x; 
for (x=350; x<495; x=x+37)
rect (x,320,10,45);

fill (0,128,64); // copa das arvores 
stroke (0,185,192);
int x; 
for (x=355; x<500; x=x+37)
ellipse(x,325,70,27);

for (x=357; x<500; x=x+37)
ellipse(x,307,50,21);

for (x=359; x<500; x=x+37)
ellipse (x,293,35,15);

fill (185);    
rect (50,210,340,115);// retangulo frontal

stroke (0); //janelas
int x; 
for (x=60; x<400; x=x+10)
line (x,210,x,325);

stroke (0);
line (50,267,400,267);

stroke (255,0,0);// primeira coluna lateral
fill (255,0,0);
rect (30,210,20,170);

stroke (255,0,0);// segunda coluna lateral
fill (255,0,0);
rect (390,210,20,170);

stroke (255,0,0);// barra superior
fill (255,0,0);
rect (30,190,380,20);

stroke (80); // barras-superior e inferior
fill (80);
int y;
for (y=210; y<400; y=y+105) 
rect (50,y,340,10);

stroke (255); //nuvens
fill (201);
ellipse (50,95,90,40);
ellipse (120,115,130,40);
ellipse (280,40,90,30);
ellipse (400,150,160,40);
ellipse (320,50,104,28);
ellipse (355,170,110,30);
}
