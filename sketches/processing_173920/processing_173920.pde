
void setup()
{
  size(500, 500);
  smooth();
}


void draw()
{

  if (mousePressed==true)
  {
    background(14, 5, 124);
    
    for (int i=0; i<width; i+=150)
    {
      float ver = sin(millis()/100.0+i)*30;

      pushMatrix();

//Drache
      translate(90, 90);
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rotate(radians(45));
      rect(i+ver, 2*ver, 100, 100);

//Mund
      stroke(0);
      fill(255);
      ellipse((i+ver)+20,(2*ver)+20,30,30);
      
      
      //Augen
      stroke(0);
      fill(255);
      ellipse((i+ver)-30, (2*ver), 30, 30);
      ellipse((i+ver), (2*ver)-30, 30, 30);

      fill(0);
      ellipse((i+ver)-30, (2*ver), 20, 20);
      ellipse((i+ver), (2*ver)-30, 20, 20);
      
      popMatrix();
    }
  } else
  {
    background(66, 208, 242);
    
    for (int i=0; i<width; i+=150)
    {
      float ver = sin(millis()/500.0+i)*5;

      pushMatrix();
      
//Drache
      translate(90, 90);
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rotate(radians(45));
      rect(i+ver, 2*ver, 100, 100);

//Mund
      stroke(0);
      fill(255);
      ellipse((i+ver)+10,(2*ver)+10,60,60);
      
      noStroke();
      fill(255,0,0);
      ellipse((i+ver),(2*ver),60,60);
      
      //Augen
      stroke(0);
      fill(255);
      ellipse((i+ver)-30, (2*ver), 30, 30);
      ellipse((i+ver), (2*ver)-30, 30, 30);

      fill(0);
      ellipse((i+ver)-25, (2*ver), 15, 15);
      ellipse((i+ver), (2*ver)-25, 15, 15);
      
      popMatrix();
    }
  }
}

