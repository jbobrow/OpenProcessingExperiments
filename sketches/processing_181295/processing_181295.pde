
void setup()
{
size(600,600);
}
void draw()
{
background(255);
//fill(30);
translate(width/2,height/2);
strokeWeight(20);
stroke(255,0,0);
point(0,0);
for (int i=0;i<8;i++)
{
 rotate(TWO_PI/8);
 fill(200,100,0);
 ellipse(0,70,30,80);
}
}
