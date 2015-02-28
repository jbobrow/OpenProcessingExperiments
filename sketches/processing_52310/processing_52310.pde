
//kathryn thomas
//homework 5
// copyright 2012

float dia;


void setup ()
{
  size (400, 400);
  background ( 0,0,0);
  frameRate(30);
  fill (220, 57, 20);
  dia=100;
}

void draw ()
{
smooth();
background(10);  
fill(255,255,255);
ellipse(mouseX,mouseY,dia,dia);

}

void mousePressed() {
    noFill();
    stroke(225,0,0);
    strokeWeight(10);
    ellipse(mouseX,mouseY,dia+20,dia+20);  
}

void mouseDragged() {
    stroke (255,0,0);
    noFill();
    ellipse (mouseX, mouseY, dia+50,dia+50);
}

void keyPressed(){
if (keyCode == UP)
{
stroke(255,255,255);
strokeWeight(10);
dia=dia+10;

}

if (keyCode == DOWN) 

  dia=dia-10;
  
if (key == ' ')  
{
background(0,0,0);
}
}




