
void setup()
{
background(255);
size(500,500);
smooth();
frameRate(25);
}
void draw()
{
translate(width/2, height/2);
for (int i=0; i<360; i+=170)
{
pushMatrix();
rotate(millis()/800.0);
translate(0,-cos(-millis()/10000.0)*100);
noFill();
stroke(0,random(50));
rect(0,0,random(250),random(2));
stroke(0,random(10));
line(0,0,random(100),random(20));
popMatrix();
}
}

