
float row;
float column;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(7);

//  strokeWeight(5);
}

void draw()
{
  noStroke();
  
  fill(255,255,255,5);
  rect(0,0,width,height);

  fill(255, 0, 0);
  ellipse(100, 300, 40, 40);

  fill(26, 160, 47);
  ellipse(115, 300, 25, 10);
  ellipse(95, 300, 25, 10);
  
  fill(255, 0, 0);
  ellipse(200, 400, 40, 40);

  fill(26, 160, 47);
  ellipse(215, 400, 25, 10);
  ellipse(195, 400, 25, 10);
  
  fill(255, 0, 0);
  ellipse(150, 250, 40, 40);

  fill(26, 160, 47);
  ellipse(165, 250, 25, 10);
  ellipse(145, 250, 25, 10);
  
  fill(118, 62, 29);
  rect(300, 500, 30, 40);
  
   fill(118, 62, 29);
  rect(100, 100, 45, 40);

  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 15, 10);
  ellipse(mouseX-10, mouseY, 15, 10);
  ellipse(mouseX+10, mouseY, 15, 10);

  stroke(0,0,0);
  line(mouseX,mouseY, mouseX, mouseY+10);
  line(mouseX,mouseY, mouseX, mouseY-10);
  line(mouseX-10, mouseY, mouseX-15,mouseY+10);
  line(mouseX-10, mouseY, mouseX-15,mouseY-10);
  line(mouseX+10, mouseY, mouseX+15,mouseY+10);
  line(mouseX+10, mouseY, mouseX+15,mouseY-10);
  
  noStroke();
  fill(72,153,237);
  ellipse(355,100, 80,40);
  
  fill(72,153,237);
  ellipse(355,120, 55,50);
  
  fill(72,153,237);
  ellipse(300,120, 69,50);
 
  fill(72,153,237);
  ellipse(335,150, 65,50); 
}
