
void setup()

{

size(400,400);
background(#1A293D);
}

void draw()

{
float r=random(20);
for (int i=-100;i<=100;i=i+50)
{
stroke(200+i,(i),i+100);
fill(100+i,(150+i),i+100);
ellipse(mouseX+r+i,mouseY, 10, 10);

}

}



