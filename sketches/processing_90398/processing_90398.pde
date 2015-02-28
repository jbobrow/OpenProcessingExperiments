
/*Ces variables sont destinées aux données premières 
d'un sketch (size...)*/
int z;
z=500;
int y;
y=250;
int x;
x=255;
int w;
w=10;
int v;
v=70;
int u;
u=1;

size(z,z);
background(y);
stroke(x,w,w,v);
strokeWeight(u);
translate(y,y);



/*ces variables me permettent de coder les premières 
lignes rotatives de mon sketch.*/
int a;
a=0;
int b;
b=150;
int c;
c=300;
int A;
A=190;
int B;
B=90;
int e;
e=100;

for (int i = 0; i < 1800; i = i+3) {
rotate(PI/c);
line(a,a,a,b);
stroke(A,e,e,B);
}



/*ces variables me permettent de coder les lignes 
plus ressentrées de mon sketch.*/
int d;
d=120;
int C;
C=210;

for (int i = 1800; i < 3600; i = i+3) {
rotate(PI/c);
line(a,a,a,d);
stroke(C,e,e,B);

}



/*ces variables me permettent de coder les lignes 
plus ressentrées de mon sketch.*/
int D;
D=190;
int E;
E=120;
int F;
F=140;
int G;
G=30;

for (int i = 3600; i < 5400; i = i+3) {
rotate(PI/c);
line(a,a,a,e);
stroke(D,E,F,G);
}



/*ces variables me permettent de coder les lignes 
plus ressentrées de mon sketch.*/
int f;
f= 80;
int H;
H=198;
int I;
I=140;
int J;
J=105;
int L;
L=94;

for (int i = 5400; i < 7200; i = i+3) {
rotate(PI/c);
line(a,a,a,f);
stroke(H,I,J,L);
}



/*ces lignes de codes correspondent aux lignes rotatives 
les plus au centre de la forme.*/
int g;
g= 50;
int M;
M=255;
int N;
N=93;

for (int i = 7200; i < 9000; i = i+3) {
rotate(PI/c);
line(a,a,a,g);
stroke(M,N);
}



