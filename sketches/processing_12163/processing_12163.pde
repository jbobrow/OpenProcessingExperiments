
// 'Aurora'
//Work By Kenny Li


void setup ()
{noStroke();
smooth();
background(255);
  size (800, 800);
}
void draw ()
{
 fill(0,1  );
 rect(0,0,width,height);
if (mousePressed == true) {
fill ( mouseY, 50,mouseX); }
else { fill(mouseX,mouseY,50);
}
ellipse(mouseX, mouseY, 50,25);
triangle(mouseX, mouseY, mouseX-10, mouseY+20, mouseX+10, mouseX+20);

}


