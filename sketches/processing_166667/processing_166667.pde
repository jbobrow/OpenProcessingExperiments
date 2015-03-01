
int d0;
int d1;
int d2;
int c=25;
int i = 0;
void setup () {
size (500,200);
d0=50; d1=d0+50; d2=d1+50;
frameRate (10);

}
void draw () {
background (150);
banderita(450,150);

if (i % 3 == 0){
segmento(d0 + c, 150, 50 - c, 20);
segmento(d1, 150, 50, 20);
segmento(d2, 150, 50, 20);
d0 = d0+c;
}

if (i % 3 == 1){
segmento(d0,150,50,20);
segmento(d1 + c, 150,50 - c,20);
segmento(d2,150,50,20);
d1 = d1 + c;
}

if (i % 3 == 2){
segmento(d0,150,50,20);
segmento(d1,150,50,20);
segmento(d2 + c,150,50-c,20);
d2 = d2 + c;
}

i = i + 1;
}
void segmento ( int xi, int yi, int ancho, int alto){
rect (xi,yi,ancho,alto);

}
void banderita( float Xi, float Yi){
line (Xi,Yi,Xi,Yi-60);
fill(180,110,200);
triangle (Xi,Yi-60, Xi-30,Yi-45,Xi,Yi-30);
fill(150,200,250);
}
