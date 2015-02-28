
void setup()
{
  size (500,500);
background (204,255,255);
}

void draw()
{
ellipse(100,100,50,50);
ellipse(150,150,50,50);
ellipse(200,200,50,50);
ellipse(250,250,50,50);
ellipse(300,300,50,50);
ellipse(350,350,50,50);
ellipse(400,400,50,50);
ellipse(450,450,50,50);

translate(mouseX,0);
ellipse(0,0,50,50);

ellipse(125,125,50,50);
ellipse(mouseX,175,50,50);
ellipse(225,225,50,50);
ellipse(mouseX,275,50,50);
ellipse(325,325,50,50);
ellipse(mouseX,375,50,50);
ellipse(425,425,50,50);
ellipse(mouseX,475,50,50);

}
