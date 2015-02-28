
void setup(){
size(250, 250);
smooth();
}

void draw() 
{
  background(81, 95, 89);
  stroke(193, 255, 229);
  line(mouseX, 100, pmouseX, 200);
  stroke(155, 180, 97);
  line(mouseX, 90, pmouseX, 100);
  stroke(84, 203, 0);
  line(mouseX, 10, pmouseX, 100);
  stroke(0, 137, 203);
  line(mouseX, 150, pmouseX, 250);
  stroke(255, 157, 206);
  line(mouseX, 150, pmouseX, 200);
}


