
void setup ()
{
  size (500, 500);
  background (255);
  noStroke();
}

void draw ()
{
  //allgemein
  background (255);
  float s = map(second(), 0, 59, 0, 360);
  float m = map(minute(), 0, 59, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);
  //allgemein END

  //Sekunden
  fill(200, 20, 180);
  triangle(0, s, 100, 2, 20, 2);
  //Sekunden END
 
  
  //Stunden
  fill(95,25,130);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, h/2, h);
  //Stunden END
  
   
  //Minuten
  fill(140,85,185);
  rect(width/2, height/2, m, m);
  rectMode(CENTER);
  //Minuten END
}

