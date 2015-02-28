
void setup()
{
  size(600, 600);
  background(25, 85, 100);
  smooth();
  frameRate(30);
  strokeWeight(5);
}
void draw()
{
  fill(random(255), random(255), random(255), 55);
  //line(width/2,height/2,random(width),random(height));
  noStroke();
  ellipse(pmouseX, pmouseY, mouseX/2, mouseY/2); 
  fill(25, 85, 100, 50);
  rect(0, 0, width, height);
}

 void keyPressed()
 {
  fill(random(255),random(255),random(255), 35);
  rect(0, 0, width, height);
}

