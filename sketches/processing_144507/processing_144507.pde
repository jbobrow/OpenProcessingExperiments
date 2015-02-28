
void setup()
{
background(255);
size(500,500);
smooth();
frameRate(25);
//noLoop();
}
void draw()
{
//background(255);

translate(width/2, height/2); // In die Mitte springen

for (int i=0; i<360; i+=170) 
{ 
pushMatrix();
//rotate(radians(i) ); // Um i rotieren
rotate(millis()/3000.0);
//translate(0, mouseX);
translate(0,-cos(millis()/1000.0)*100);
//ellipse(0, 0, 10, 10);
//fill(100,20,i,50); //farbverlauf
//fill(100,20,255,i);
noFill();
stroke(0,random(20));
rect(0,0,20,20);
popMatrix();
}
}
