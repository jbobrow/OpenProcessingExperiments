
void setup ()
{
size (1000,900);
background (#000000);
}
void draw ()


  {
  background(#000000);
  fill(#0000ff);
  stroke(#000000);
  arc(mouseX+20,mouseY+20,40,10,0,3.14);
  noStroke();
  rect(mouseX,mouseY,40,20);
  fill(#ff0000);
  stroke(#000000);
  arc(mouseX+20,mouseY,80,10,0,3.14);
  noStroke();
  rect(mouseX-20,mouseY-150,80,150);
  stroke(#000000);
  arc(mouseX+20,mouseY-150,80,10,0,3.14);
  noStroke();
  triangle(mouseX-20,mouseY-150,mouseX+60,mouseY-150,mouseX+20,mouseY-220);
  fill(#0000ff);
  triangle(mouseX-20,mouseY-130,mouseX-20,mouseY-20,mouseX-40,mouseY-20);
  triangle(mouseX+20,mouseY-130,mouseX+20,mouseY-20,mouseX+10,mouseY-20);
  triangle(mouseX+60,mouseY-130,mouseX+60,mouseY-20,mouseX+80,mouseY-20);
  fill(#ffffff);
  ellipse(500,800,300,300);
  }
 void mousePressed ()
 {
  stroke(#ff6600);
  line(mouseX,mouseY+30,mouseX-20,mouseY+80);
  line(mouseX+20,mouseY+30,mouseX+20,mouseY+80);
  line(mouseX+40,mouseY+30,mouseX+60,mouseY+80);
  noStroke();
  fill(#ffffff);
 
  }
