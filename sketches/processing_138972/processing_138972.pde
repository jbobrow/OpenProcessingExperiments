
void setup()
{
size(600,600);
background(153,204,50);
fill(0);
noStroke();
}

void draw()
{
stroke(0,255,0);
fill(255);
ellipse(width/2,height/2,300,300);

stroke(255);
fill(147,209,112);
ellipse(width/2,height/2,100,100);

noStroke();
fill(0);
ellipse(width/2,height/2,50,50);

noStroke();
fill(255);
if (mousePressed)
 ellipse(mouseX, mouseY, 50, 50);
  

}
