
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  
  noLoop();
}

void draw()
{
  stroke(0, 255, 0);
  strokeWeight(3);
  line(width/2, height/2, width/2, height);
  
  noStroke();

  fill(255, 0, 0);
  ellipse(width/2, height/2, 20, 100);
  ellipse(width/2, height/2, 100, 20);

  pushMatrix();
    translate(width/2, height/2);
    rotate(PI/4);
    ellipse(0, 0, 100, 20);
  popMatrix();  

  pushMatrix();
    translate(width/2, height/2);
    rotate(-PI/4);
    fill(255, 0, 0);
    ellipse(0, 0, 100, 20);
  popMatrix();
  
  fill(255, 255, 0);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0, 255, 0);
  pushMatrix();
    translate(width/2, height);
    rotate(PI/4);
    ellipse(0, 0, 100, 20);
  popMatrix();  

  pushMatrix();
    translate(width/2, height);
    rotate(-PI/4);
    ellipse(0, 0, 100, 20);
  popMatrix();  
  
  

  
}
