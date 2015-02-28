

//second

void setup()
{
 size (600, 600);
background (255, 253, 200);

point(400, 300);


}

void draw()
{
  if(mousePressed){
  fill(228, 255, 215);
} else {
  fill (208, 229, 255);
}
line(600, 600, mouseX, mouseY);
  smooth();
int y = 10;
int d = 10;
ellipse(mouseX, mouseY, y, d);   // Left
}

