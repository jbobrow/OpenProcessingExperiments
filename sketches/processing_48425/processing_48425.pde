
void setup()
{
  size (400, 600);
  background(0, 0, 0);
  smooth();
  fill(5, 95, 16);
  triangle(200, 100, 50, 500, 350, 500);
  fill(255, 255, 255);
  rect(0, 526, 400, 75);
  fill(113, 63, 33);
  rect(175, 500, 50, 60);
  fill(255, 255, 0);
  noStroke();
  triangle(180,100,200,80,220,100);
  triangle(200,110,180,85,220,85);
  stroke(.5);
  fill(255,255,255);
  
}

void draw()
{
  fill(255);
  ellipse(random(400),random(600),5,5);
}


void mousePressed()
{
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 20, 20);
  
  
}

void keyPressed()
{
 save ("snapshot.jpg"); 
}



