
void setup()
{
size(2500,1500);
float clr1 = random(0, 255);
    float clr2 = random(0, 255);
    float clr3 = random(0, 255);
background(127,116,92);
}

void draw()
{
  noStroke(); 
{
  if(mousePressed) {
    float size = random(2,300);
    float clr1 = random(100, 255);
    float clr2 = random(100, 255);
    float clr3 = random(100, 255);
    float a = random(200);
  
    fill(clr1, clr2, clr3,a);
    triangle(mouseX-20,mouseY+70,mouseX,mouseY,mouseX+20,mouseY+70);
  }
}
}
