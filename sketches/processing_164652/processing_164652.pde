
void setup()
{size(444,444);
smooth();
frameRate (30);
}

void draw () 
{
background (255);

ellipseMode (CENTER);
rectMode (CENTER);

stroke (0);
fill (200,0,0);
//body
rect (mouseX, mouseY, 44, 66);
//draw head
fill (155,211,175);
ellipse(mouseX, mouseY-40,60,60);
fill(mouseX,0,mouseY);
ellipse(mouseX-19,mouseY-39, 16,32);
ellipse(mouseX+19, mouseY-39, 16,32);

//legs
stroke (0);
line (mouseX-10, mouseY+30, pmouseX-10,pmouseY+60);
line (mouseX+10, mouseY+30, pmouseX+10,pmouseY+60);

}

void mousePressed()
{
  println ("hello world!");
}


