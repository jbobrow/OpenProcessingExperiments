
float index = 0.0;

void setup() {
  size (500, 500);
  background (0);
  smooth();
}


void draw () {
  
  translate (width/2, height/2);
  noStroke();
  
  //Ellipse
  if (second() >= 0 && second() < 30) {
  
    if (mousePressed == true)
    {
      background (0);
    }
    else if (mousePressed == false)
    {
      float h = map (sin(index), -1, 1, 80, 115);
      fill (h, mouseX/2, mouseY,2);
      ellipse (0, 0, mouseX+15/5, mouseX+15/5);
    }
 
}

    //Rechteck
    else if (second() >= 15 && second() < 60)
    {
      
      if (mousePressed == true) 
    {
      background (0);
    }
    else if (mousePressed == false)
    {
      fill (mouseX, 60);
      rotate (second());
      rectMode(CENTER);
      rect (0, 0, mouseX/2, mouseX/2);
    }
      
    }
    
  
}
