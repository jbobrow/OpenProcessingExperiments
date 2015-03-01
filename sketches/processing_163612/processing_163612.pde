
int shapeWidth = 500;
int shapeHeight = 350;
color shapeColour = color(225,24,55);

void setup()
{
 size(800,800);
}
void draw()
{
 shapeWidth = 500+((mouseX-pmouseX)*20);
 background(#01796F);
 fill(shapeColour);
 ellipse(mouseX,mouseY,shapeWidth, shapeHeight);

 if(mousePressed == true){
 ellipse(mouseX,mouseY,50,50) 
 }
}
void mousePressed() {
 shapeColour = color(0,0,0);
}
void mouseReleased() {
 shapeColour = #E11837
}
