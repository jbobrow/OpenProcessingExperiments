
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  //frameRate(15);
}  
void draw()
{
  
  fill(255,255,255,50);
  rect(0,0,width,height);
  fill(random(255),random(255),random(255),50);
  ellipse(mouseX+20, mouseY, 60, 40);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY-5,30,30);
  fill(0,0,0);
  ellipse(mouseX-5,mouseY+2,14,11);
  strokeWeight(3);
  line(mouseX+20,mouseY-6,mouseX+70,mouseY-35);
  line(mouseX-15,mouseY-6,mouseX-60,mouseY-25);
  point(mouseX-1,mouseY-10);
  point(mouseX-10,mouseY-10);
  
}
void keyPressed()
{
  save("snapshot.jpg");
}


