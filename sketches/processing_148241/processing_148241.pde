
void setup()
{
  size(600,600);
  background(50,50,100);  
}
void draw()
{
  fill(255,255,255, 20);
  rect(0,0,600,400);
  fill(25,100,255);
  rect(0,400, 600,200);
  noStroke();
 triangle(0,400, mouseX, mouseY, 100,400);
if(mouseX>100)
  fill(255,255,255);
  triangle(0,400,mouseX, mouseY, 100,400);
if(mouseX>100)
  fill(25,100,255);
  triangle(100, 400, mouseX, mouseY, 200,400);
  if(mouseX>200)
  fill(255,255,255);
  triangle(100,400,mouseX, mouseY, 200,400);
if(mouseX>200)
  fill(25,100,255);
  triangle(200, 400, mouseX, mouseY, 300,400);
   if(mouseX>300)
  fill(255,255,255);
  triangle(200,400,mouseX, mouseY, 300,400);
if(mouseX>300)
  fill(25,100,255);
  triangle(300, 400, mouseX, mouseY, 400,400);
if(mouseX>400)
  fill(255,255,255);
  triangle(300,400,mouseX, mouseY, 400,400);
if(mouseX>400)
  fill(25,100,255);
  triangle(400, 400, mouseX, mouseY, 500,400);
 if(mouseX>500)
  fill(255,255,255);
  triangle(400,400,mouseX, mouseY, 500,400);
if(mouseX>500)
  fill(25,100,255);
  triangle(500, 400, mouseX, mouseY, 600,400);
   fill(random(255),random(255),random(255), 30);
  ellipse(50,50,75,75);
  ellipse(75,50,75,75);
  ellipse(100,50,75,75);
  ellipse(125,50,75,75);
  ellipse(150,50,75,75);
  ellipse(175,50,75,75);
  ellipse(200,50,75,75);
  ellipse(80,65,75,75);
  ellipse(155,65, 75,75);
  ellipse(117,80,75,75);
}

