
void setup () {
  
  size (450, 300);
background (50);
}

void draw () {

int A;
int B;
int C;
int D;
int E;
int F;
int G;
int H;
  
A = mouseX; //200
B = 250;
C = 260;
D = mouseX; //290
E = 302;
F = 280;
G = 290;
H = mouseY; //290
  
smooth ();
quad (A,B,C,D,E,F,G,H);


int x;

for (x=0; x<13; x++) {
quad (A+100,B+10,C+A,D+200,E,x,x*10,H);
}

//for (x=0; x<13; x++) {
//quad (A+100,B+10,C+A,D+200,E,x,x*10,H);
//}

for (x=0; x<13; x++) {

  quad (A,x*10,C,D,E,F,G,H);

}


for (x=0; x<13; x++) {

  quad (A,B,C,D+100,E,F,x*10,H);

}

for (x=0; x<13; x++) {

  quad (A,B,C,D+200,E,F,x*10,H);

}

for (x=0; x<13; x++) {

  quad (A+100,B+100,C+A,D+200,E,F,x*10,H);

}
}


