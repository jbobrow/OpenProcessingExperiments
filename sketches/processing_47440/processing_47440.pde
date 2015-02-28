
boolean button = false;

void setup() 
{ size(800,800);
background(255); 
smooth();
}


void draw()
{
int a = abs(pmouseX-mouseX);
float s = second();
strokeWeight(a);
stroke(s*2,s*2,s*2);
strokeCap(SQUARE);
    
  if (!(pmouseX == 0 && pmouseY == 0 )){
    line(pmouseX, pmouseY, mouseX, mouseY);
    line(pmouseY,pmouseX,mouseY,mouseX);
    line(800-pmouseY,pmouseX,800-mouseY,mouseX);
    line(800-pmouseX,pmouseY,800-mouseX,mouseY);
    line(pmouseX,800-pmouseY,mouseX,800-mouseY);
    line(pmouseY,800-pmouseX,mouseY,800-mouseX);
    line(pmouseY+800-2*pmouseY,pmouseX+800-2*pmouseX,mouseY+800-2*mouseY,mouseX+800-2*mouseX);
    line(pmouseX+800-2*pmouseX,pmouseY+800-2*pmouseY,mouseX+800-2*mouseX,mouseY+800-2*mouseY);
  }  
}
 
void mousePressed()
 {
if (!(mouseX == 0 && mouseY == 0 )){
  button = !button;} 
  {if (button) {
background(0);
} else {
background(255);}}
}

