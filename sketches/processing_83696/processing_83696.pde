
void setup()
{
size(500,500);
background(255);

}

void draw()
{
strokeWeight(50);
stroke(#0625CB, 80);
line(100,100,400,400);
stroke(#EA00C0, 80);
line(400,100,100,400);
noFill();
stroke(#0625CB, 70);
rotate(PI/4);
translate(105,-250);
strokeWeight(20);
rect(205,205 , 90,90);

noLoop();
}


