
void setup() 
{ 
  size(800, 800);
  background(255); 
  smooth();
}


void draw()
{
  if (mousePressed==true) {

    int a = abs(pmouseX-mouseX);
    float s = second();
    strokeWeight(20);
    strokeCap(POINT);

    if (!(pmouseX == 0 && pmouseY == 0 )) {
      line(pmouseX, pmouseY, mouseX, mouseY);
      line(800-pmouseX, pmouseY, 800-mouseX, mouseY);
    }
  }else{background(255);}
}


