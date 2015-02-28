

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  fill(25,105,25);
  triangle(100,550,20,550,60,200);
  triangle(380,550,300,550,340,200);
  
  fill(255,255,255);
  ellipse(200,500,150,150);
  ellipse(200,390,110,110);
  ellipse(200,300,90,90);
  
  fill(255,255,255);
  rect(0,570,width,height);
  
  fill(152,84,52);
  rect(50,550,20,40);
  rect(330,550,20,40);
  
  fill(0, 0, 0,10);
  rect(0, 0, 400, 600);

  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 100, 50);

  stroke(.5);
  fill(255, 255, 255);
  ellipse(random(400), random(600), 5, 5);
}  


