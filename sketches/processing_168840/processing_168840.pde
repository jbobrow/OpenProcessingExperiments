
int myDiameter = 20;
float posX = 200;
float posY = 150;
float a = 1;
float b = 1;
float c = 200;
float d = 250;
float e = 250;
float f = 200;


void setup () {
    size(500,500);
    background(210);

}
void draw ()
{
  smooth();
  noStroke();
  fill(80,30);
  ellipse(c, e,b*a, b*a);

 
  noStroke();
  fill(245,30);
  b = b + 0.2;
  ellipse(d, f,b*a,b*a);
   if(b > 300){
    a = a + 0.2;
  }
}



