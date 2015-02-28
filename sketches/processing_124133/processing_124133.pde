
void setup()
{
  size(600,600);
  background(183,17,2);
  frameRate(10);
strokeWeight(3);


fill(24,77,16);
rect(275,0, 50,600);
rect(0,275,600,50);

triangle(width/2, height/2, 118,200, 118,400);
triangle(width/2, height/2, 482, 200, 482,400);
ellipse(width/2, height/2, 100,100);
}

void draw()
{ noStroke();
fill(25,237,19,50);
  ellipse(random(0,600), random(0,600), 35,35);
  fill(250,23,3,50);
  ellipse(random(0,600), random(0,600), 35,35);
  fill(255,255,255,65);

  
  
}
