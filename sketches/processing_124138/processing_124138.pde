
void setup()
{
size(600,600);
background(0,0,0);
}

void draw()
{
  
  ellipse(300,200,300,300);
  fill(random(255),random(255),random(256),255);
  noStroke();
  {
    
    ellipse(200,375,300,300);
    fill(random(255),random(256),random(255),255);
    noStroke();
    {
      
      ellipse(400,375,300,300);
      fill(random(256),random(255),random(255),255);
      noStroke();
    }
  }
}

