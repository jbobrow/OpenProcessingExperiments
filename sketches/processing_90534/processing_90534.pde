
void setup()
{
 size(610,510);
  background(250);
}

void draw()
{
println(mouseX);
println(mouseY);

smooth();

fill(0);

//Variables triangles
int Ax;
Ax=10;
int Ay;
Ay=100;
int Bx;
Bx=65;
int By;
By=10;
int Cx;
Cx=120;
int Cy;
Cy=100;

//Variables trait
int T;
T=25;
int T1;
T1=72;
int T2;
T2=92;
int T3;
T3=100;

triangle (Ax,Ay,Bx,By,Cx,Cy);

//Premier
stroke(255);
strokeWeight(1);
line(T,T1,T2,T3);

}


