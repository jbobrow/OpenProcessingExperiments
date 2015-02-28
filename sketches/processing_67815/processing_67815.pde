
void setup ()
{
size(1000,1000);
smooth();
strokeWeight(15);
noFill();
}

void draw()
{
background(255);  
stroke(0,0,255); ellipse(150,250,300,300);
stroke(0,0,0);
ellipse(500,250,300,300);
stroke(255,0,0);
ellipse(mouseX,mouseY,300,300);
stroke(255,255,0);
ellipse(320,400,300,300);
stroke(0,255,0);
ellipse(670,400,300,300);
}




