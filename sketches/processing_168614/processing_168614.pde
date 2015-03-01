
void setup()
{
size(500,500);
background(0);
noFill();
stroke(255);
smooth();
}

void draw()
{
pushMatrix();
translate(width/2,height/2);
rotate(radians(millis()*50));
ellipse(0,0,50,230);
rect(0,0,25,100);
popMatrix();

}
