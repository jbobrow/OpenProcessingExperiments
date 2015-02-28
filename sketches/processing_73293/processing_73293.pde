
//Perry Phan, 4/5, Rotating Cube
float y = 0;
float x = 0;
void setup()
{
size(400, 400, P3D);
}

void draw()
{
background(12,5,250,0);
camera(10*mouseX,10*mouseY,-200,0,0,0,0,1,0);
rotateX(x);
rotateY(y);
lights();
rotateZ(1000);
fill(random(255),random(255),random(255),200);
box(100);
fill(random(255),random(255),random(255),200);
sphere(50);
strokeWeight(2);
line(0,0,300,300);
line(100,100,200,200);
line(150,150,250,250);
y=y+1;
x=x+1;
}
