
void setup()
{
 size(400, 600);
 background(13,192,255);
 smooth();
 stroke(255,255,0);
}

void draw()
{ 
 line(0, 0, mouseX, mouseY);
fill(255,255,0);
 ellipse(0,0,(width/2),(height/2));
 } 

void mousePressed()
{
 stroke(255,138,15);

}
