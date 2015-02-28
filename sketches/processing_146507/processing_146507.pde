
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/145897*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup()
{
background(255);
size(500,500);
smooth();
frameRate(25);
colorMode(HSB);
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
stroke(random(255), 100, 255, 70);
rect(0,0,random(250),random(2));
stroke(random(255), 255, 100, 70);
line(0,0,random(100),random(20));
popMatrix();
}
}


