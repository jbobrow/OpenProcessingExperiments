
void setup()
{
 size(400,400); 
int r,g,b;
}
void draw()
{

 if((mouseX >= width/2 +10 || mouseX <= width/2 -10) && (mouseY <= width/2 -10 ||mouseY >= width/2 +10 ))
  {fill(0,255,255);
  background(0);
    rect(mouseX, mouseY, 50, 50);
    fill(255,0,255);
  triangle(mouseX , mouseY+50, mouseX + 50, mouseY+50, mouseX + 25, mouseY +75);
triangle(mouseX , mouseY, mouseX + 50, mouseY, mouseX + 25, mouseY - 25);
triangle(mouseX , mouseY+50, mouseX + 50, mouseY+50, mouseX + 25, mouseY +75);
triangle(mouseX , mouseY+50, mouseX + 50, mouseY+50, mouseX + 25, mouseY +75);
 if((mouseX <= width/2 +10 || mouseX >= width/2 -10) && (mouseY >= width/2 -10 ||mouseY <= width/2 +10 ))
noLoop();
print("nothing");  
}
}
