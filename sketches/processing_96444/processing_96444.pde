
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
 
 translate(width/2, height);
  branch(0);
  
}
void branch(int len)
{
  stroke(0);
  if (len == 12) {
    float leaveSize = random(30,150);
    noStroke();
    fill(random(10),random(50,255),random(15),200);
    ellipse(0, 0, leaveSize, leaveSize);
  }
  if (len < 12) {
     strokeWeight(len/4);
  
  strokeJoin(ROUND);
  strokeCap(ROUND);
 
  organicLine( 0, 0, 0, -len, len/3, random(100));
 
 
  translate(0, -len);
 

  
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

void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(ROUND);
  strokeWeight(strokeW);
  stroke(255);
  float numSections = 5;
  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y
 
  float nx1 = x1 *random(50); // first x
  float ny1 = y1 *random(50); // first y
 
  for (int i = 1; i <= numSections; i++) {
    float nx2 = x1 + i/numSections * cx+ random(-5, 5);
    float ny2 = y1 + i/numSections * cy+ random(-5, 5);
 
    line(nx1, ny1, nx2, ny2);
    nx1 = nx2;
    ny1 = ny2;
  }
}




