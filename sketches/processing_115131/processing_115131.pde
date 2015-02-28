
void setup()
{
  size(1200,700);
  background(0,0,0);
  frameRate(100);
  rectMode(CORNERS);
  frameRate(60);
}

void draw()
{
 
  stroke(255);
  strokeWeight(1);
  fill(mouseY/7,mouseX/12,0,50);
  ellipse(600,350,abs(mouseX-600),abs(mouseX-600));
  stroke((mouseX/12)+50,0,(mouseY/7)+50);
  strokeWeight(4);
  fill(mouseX/7,mouseY/7,0,100);
  rect(mouseX-50, mouseY-100, mouseX + 50, mouseY + 100);
  strokeWeight(0.1);
  stroke(25,50,50);
  line(mouseX,0,mouseX,700);
  line(0,mouseY,1200,mouseY);

  
}


