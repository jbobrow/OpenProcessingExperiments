
void setup()
{
 
size(500, 500);
 
 
}
 
 
void draw()
{
background(227, 228, 232);
fill(0);
pushMatrix();
float kreis= map( mouseY, 500,0,0,250);
fill(127, 234,107);
ellipse(50, 50, 60, 60);
ellipse(50, 100+kreis, 60, 60);
ellipse(100+kreis, 50, 60, 60);
popMatrix();
resetMatrix();
 
 
pushMatrix();
float ellipse = map( mouseX, 500,0 ,0 , 250);
fill(92, 93, 93);
rect(400, 400, 80, 80);
rect(400-ellipse, 300, 80, 80);
rect(300, 400-ellipse, 80, 80);
rect(300-ellipse, 300, 80, 80);
popMatrix();
resetMatrix();
}
