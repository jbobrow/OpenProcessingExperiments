
float z=0;
void setup()
{
size(1000,1000,P3D);
smooth();
}
void draw()
{
//noStroke();
background(255);
lights();
z-=10;
minjae(200,mouseX,mouseY,z);
}
void minjae(float r, float x, float y, float z)
{
translate(x,y,z);
sphere(r);
translate(-x,-y,-z);
}
