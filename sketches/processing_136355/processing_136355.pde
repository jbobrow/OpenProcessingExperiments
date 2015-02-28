
int x1;
int x2;
int x3;
int y1;
int y2;
int y3;

int z1;
int z2;
int z3;
int q1;
int q2;
int q3;

int e1;
int e2;
int e3;
int r1;
int r2;
int r3;


void setup() {
 size(600,600);
  
 x1 = width/2;
 y2 = height/2;
 x2 = x1;
 y2 = y1;
x3 = x1;
y3 = y1;

z1=600;
q2=600;
z2=z1;
q2=q1;
z3=z1;
q3=q1;

e1=0;
r2=0;
e2=e1;
r2=r1;
e3=e1;
r3=r1;



}
 
void draw(){
x2 = constrain( (x2-20+(round(random(40)))), -20, width+50);
y2 = constrain( (y2-20+(round(random(40)))), -20, width+50);
smooth();

stroke(round(random(200)));
fill(round(random(200)),130,50);
triangle(x1, y1, x2, y2, x3, y3);
 
x3=x2;
y3=y2;

z2 = constrain( (z2-20+(round(random(40)))), -20, width+50);
q2 = constrain( (q2-20+(round(random(40)))), -20, width+50);
smooth();
 
stroke(round(random(200))); 
fill(round(random(205)),210,150);
triangle(z1, q1, z2, q2, z3, q3);
 
z3=z2;
q3=q2;

e2 = constrain( (e2-20+(round(random(40)))), -20, width+50);
r2 = constrain( (r2-20+(round(random(40)))), -20, width+50);
smooth();
 
stroke(round(random(200))); 
fill(round(random(150)),45,50);
triangle(e1, r1, e2, r2, e3, r3);
 
e3=e2;
r3=r2;
}




