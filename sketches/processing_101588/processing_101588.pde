
size (600, 400);
background (109, 138, 250);
stroke (73, 160, 83); // gramado
fill (73, 160, 83); 
rect (0, 245, 600, 155);
stroke (75, 75, 75); // laje
fill (255, 255, 255);
rect (140, 175, 420, 7);
rect (138, 171, 424, 3);
rect (140, 240, 420, 7); // base
stroke (162, 136, 79); //dentro
fill (162, 136, 79);
rect (345, 182, 170, 58); 
stroke (75, 75, 75); // parede
fill (255, 255, 255, 120);
rect (260, 182, 300, 58); 

int x=168; //pilares
int y=176;
fill (255, 255, 255);
rect (x, y, 5, 91);
x+=120;
rect (x, y, 5, 91);
x+=120;
rect (x, y, 5, 91);
x+=120;
rect (x, y, 5, 91);

rect (20, 252, 300, 7); // base 2

int z=48; //suporte base 2
int t=253;
rect (z, t, 5, 14);
z+=120;
rect (z, t, 5, 14);
z+=120;
rect (z, t, 5, 14);

int r=350; //vidro
int s=182;
stroke (75, 75, 75);
line (r, s, r, s+58);
r+=120;
line (r, s, r, s+58);

int u=199; //escadas
int v=242;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=1;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=3;
line (u, v, u+62, v);
v+=1;
line (u, v, u+62, v);

noStroke(); //nuvens
fill (255, 255, 255, 150);
ellipse (150, 90, 150, 70);
ellipse (260, 70, 180, 80);
