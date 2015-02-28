

void setup()
{
size(500,500);
background(0,0,0);
 textSize(20);
  text("we wish you a merry christmas",150,350);
}
void draw()
{
  image(loadImage("snow.jpeg"),0,0);
  rect(390,100,20,100);
  noStroke();
  fill(255,0,0);
  ellipse(400,75,20,50);
  noStroke();
  fill(random(50,200),random(100,150));
  ellipse(400,86,15,30);
  fill(36,77,14);
  
  rect(360,130,20,100);
  noStroke();
  fill(255,0,0);
  ellipse(370,105,20,50);
  noStroke();
  fill(random(50,200),random(100,150));
  ellipse(370,115,15,30);
  fill(36,77,14);
  
  
 
  
}



