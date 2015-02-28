
void setup()
{
background(0);
size(500,500);
smooth();
frameRate(25);
colorMode (HSB, 360,100,100);

}
void draw()
{

translate(width/2, height/2);

for (int i=0; i<360; i+=170)
{
pushMatrix();
rotate(millis()/3000.0);
translate(0,-cos(-millis()/1000.0)*100);
noFill();
stroke(#FFFFFF,random(10));
rect(0,0,random(250),random(20));
stroke(#AAdd73,10);
line(0,0,random(100),random(200));
translate(10,cos(-millis()/1000.0)*100);
stroke(#FFFFFF,random(10));
line(20,20,random(100),random(20));
popMatrix();
}
}
