
void setup()
{
  size(600, 600);
  smooth();
  colorMode(RGB, 255);
  background(255);
  noLoop();
}

void draw()
{
 
background(0);
  strokeWeight(20);
  translate(width/2, height);
  branch(0);
  
}
void branch(int len)
{
  stroke(0);
  if (len == 12) {
    float leaveSize = random(30,150);
    noStroke();
    fill(random(255),random(255),random(255),200);
    ellipse(0, 0, leaveSize, leaveSize);
  }
  if (len < 12) {
    stroke(random(30,60), 0, random(30,100),200);
    line(0, 0, 0, -height/4);
  
    pushMatrix();
    {
      translate(0, -height/4);
      rotate(random(-PI/4, PI/4));
      scale(.8);
      branch(len + 1);
    }

    popMatrix();
     
    pushMatrix();
    {
    
      translate(0, -height/6);
      rotate(random(-PI/4, PI/4));
      scale(0.7);
      branch(len+1);
    }
    popMatrix();
  }
}
void mouseClicked()
{
  redraw();
}




