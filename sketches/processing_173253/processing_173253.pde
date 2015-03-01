
float counter=0;

void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{ translate (height/2, width/2);
  noStroke();
  fill(255);
  ellipse(0, 0, 400, 400);
  smooth();

  pushMatrix();
  stroke(0);
  smooth();
  fill(255);
  ellipse(-80, -80, 70, 70);

  stroke(0);
  smooth();
  fill(255);
  ellipse(80, -80, 70, 70);

  ellipse(0, 80, -150, 80);
  popMatrix();

  pushMatrix();
  float herz = map(sin(counter), -1, 1, 0, 100);
  float mouse_X = map(sin(mouseX), 0, width/2, 0.1, 0.5);
  noStroke();
  smooth();
  fill(255, 0, 0);
  
  { 
    if (mouseX>=157 && mouseX<= 182 && mouseY>=162 && mouseY<=187)
    {  
      background(0);
    }
    {
      if (mouseX>=317 && mouseX<=342 && mouseY>=162 && mouseY<=187)
      { 
        background(180, 15, 60);
      }
    }
  }

  ellipse (85, -80, 16.5, 16.5);
  ellipse(-85, -80, 16.5, 16.5);
  ellipse (75, -80, 16.5, 16.5);
  ellipse(-75, -80, 16.5, 16.5);

  triangle(92, -75, 68, -75, 80, -60);
  triangle(-92, -75, -68, -75, -80, -60);

  popMatrix();
}

