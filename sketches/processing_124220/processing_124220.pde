
void setup()
{
  size(500, 500);
  background(0, 0, 0);
}

void draw()
{
  {
    noStroke();
    fill(255,255,255);
    ellipse(250, 425, 200, 200);
    ellipse(250, 280, 150, 150);
    ellipse(250, 170, 110, 110);
    
  }
  {
    stroke(0,0,0);
    strokeWeight(10);
    stroke(random(255),random(255),random(255)); 
    point(250, 250);
    stroke(random(255),random(255),random(255)); 
    point(250, 280);
    stroke(random(255),random(255),random(255)); 
    point(250, 310);
    stroke(0,0,0);
    point(230,160); 
    stroke(0,0,0);
    point(265,160);
    noStroke();
     fill(242,113,7); 
     triangle(250,180,250,190,200,185);
    
}
}
