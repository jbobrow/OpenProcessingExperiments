
void setup() {
  size (250,250);
  background(25);
  
}

void draw() {
  for (int a=5;a<120;a+=10) 
{

  
  stroke(100, 255, 155);
  line(125,a,a+130,125);         // top right corner
  
  stroke(50, 155, 255);
  line(125,a,-a+120,125);        // top left corner
  
  stroke(100, 255, 155);
  line(a,125,125,a+130);         // bottom left corner
  
  stroke(0, 155, 255);
  line(125,250-a,130+a,125);     // bottom right corner
}

}

