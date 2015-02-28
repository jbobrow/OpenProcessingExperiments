
void setup()
{
background(152,245,255);
size(200,400);
stroke(0);
ellipse(100,100,150,170);
ellipse(150,50,5,5);
ellipse(75,50,5,5);
ellipse(75,50,25,25);
ellipse(150,50,25,25);
ellipse(150,125,75,10);
ellipse(150,130,75,10);
}
void draw(){
  background(152,245,255);
  ellipse(mouseX,mouseY,150,170);
ellipse(150,50,5,5);
ellipse(75,50,5,5);
ellipse(75,50,25,25);
ellipse(150,50,25,25);
ellipse(150,125,75,10);
ellipse(150,130,75,10);
ellipse(150,50,mouseX,mouseY);
ellipse(75,50,mouseX,mouseY);
triangle(325,50,mouseX,115,325,mouseY);
  {if(mousePressed==true)
  {fill(0,50,255,200);}
triangle(325,50,350,115,325,115);
ellipse(150,50,5,5);
ellipse(75,50,5,5);
triangle(125,50,150,115,125,115);
line(85,60,50,80);
line(140,60,160,70);
  }

ellipse(150,50,5,5);
ellipse(75,50,5,5);
triangle(125,50,150,115,125,115);
line(85,60,50,80);
line(140,60,160,70);
}
