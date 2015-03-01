
int petali;
void setup()
{
size(600,600);
petali=10;
}
void draw()
{
background(255);
scale(1,2);
//fill(30);
translate(width/2,height/2);
strokeWeight(20);
stroke(255,0,0);
point(0,0);
for (int i=0;i<petali;i++)
{
 rotate(TWO_PI/petali);
 fill(200,100,0);
 ellipse(0,70,30,80);
}
}
