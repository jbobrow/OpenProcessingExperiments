
void setup()
{  //setup function called initially, only once
  size(600, 400);
  background(0,255,0);  //set background white
  smooth();
}
void draw()
{
stroke(0,0,0);
strokeWeight(1);
fill(255,255,255);
ellipse(300,75,70,70);
ellipse(300,160,100,100);
ellipse(300,285,150,150);

fill(0,0,0);
ellipse(290,65,5,5);
ellipse(310,65,5,5);

line(275,175,225,90);
line(325,175,375,90);

 fill(255,0,0);
textSize(50);
text("Merry Christmas Everyone!", 5,50);

stroke(255,255,255);
strokeWeight(5);
point(random(width), random(height));
}
