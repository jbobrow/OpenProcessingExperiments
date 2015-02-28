
//David Avetisyan, CP1, (4/5)
float x =0;
float y=0;
int a=0;
int b=0;
int c=0;
void setup()

{
size(500,500,P3D);
}
void draw()
{
ellipse(20,20,30,30);
frameRate(60);
background(255);
noStroke();
a=a+25;

lights();
translate(250,250,0);
//rotateX(x);
rotateY(y);
x=x-.03;
y=y+.03;


pointLight(0,0,255,-235,-240, 275);
fill(255,15,15);
sphere(100);
fill(0);
translate(-75,-115,0);
sphere(50);
translate(175,15,0);
sphere(50);
translate(-125,150,105);
sphere(25);
translate(35,-55,-25);
fill(0);
sphere(25);
translate(-50,-2.5,-10);
fill(0);
sphere(25);

}

