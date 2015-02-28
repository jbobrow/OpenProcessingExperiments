
void setup(){
  size(480,320);
  smooth();
    background(178, 187, 245);
}

void draw()
{
  noFill();
 
stroke(113,113,155,30);
 
   if(mousePressed == true)
  { 
    float c1 = (255);
    float c2 = (243);
    float c3 = (196);
    float c4 = (50);
    stroke(c1, c2, c3, c4);
  }
  
bezier(0,mouseX,-mouseY,mouseY,mouseX,mouseY,width,mouseX);


}
