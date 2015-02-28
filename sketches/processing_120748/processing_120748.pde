
void setup()
{
size(800,600);
}

void draw()

{
translate(200,200);
float XC =100;
float YC =50;
for(int i = 0; i < 100; i++){
line (mouseX,mouseY,XC,YC);
rotate (radians(20));
}

XC=XC+5;
YC=XC+5;

line(mouseX,mouseY,XC,YC);



}
