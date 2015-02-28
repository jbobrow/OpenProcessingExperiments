
void setup()
{
  size(400,400);
  background(0,0,255);
  smooth();
  frameRate(60);
}
void draw()
{
fill(255,0,0);
ellipse(200,200,200,200);

fill(255); //eyes
ellipse(175,175,50,50);
fill(255);
ellipse(225,175,50,50);
fill(0);
ellipse(185,175,30,30);
fill(0);
ellipse(215,175,30,30);

triangle(215,250,185,250,200,200);

fill(255);
ellipse(200,275,40,40);


}
