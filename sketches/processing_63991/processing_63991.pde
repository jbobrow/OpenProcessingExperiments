
void setup()
{
  ellipseMode(CENTER);
size(1100,800);
strokeWeight(10);
background(#030101);
}
void draw()
{
stroke(#FCFCFC);
fill(#FCFCFC);
ellipse(random(1100),random(900),10,10);

stroke(#ED1313);
fill(#ED1313);
ellipse(random(1100),random(900),30,30);

stroke(#030101);
fill(#030101);
rect(random(1100),random(900),70,70);

fill(#FCFCFC);
float radius=(random(500));
ellipse(550,400,radius,radius);
}

