
float x1 = 0;
float y1 = random(350);

float x2 = 0;
float y2 = random(350);

float r = random(255);
float g = random(255);
float b = random(255);

float point = random(300);
float point2 = random(300);
void setup() {  //setup function called initially, only once
  size(950, 950);
  background(55);  //set background white
}

void draw() {  //draw function loops 

  if (mousePressed || x1 >950 && x2 > 950)
  {
    background(55);
    x1 = 0;
    y1 = random(350);
    x2 = 0;
    y2 = random(350);

    point = random(800);
    point = random(800);

  }
  else
  {
     fill(r, g, b, 137);
     strokeWeight(3);
     stroke(r, g, b);
      if (y1 <= point)
      {
        x1 = x1 + 1;
       y1 = y1 + 2;
      }
  
      if (y2 <= point2)
      {
        x2 = x2 + 1;
        y2 = y2 + 2;
      }
  
      else
      { 
          y1 = y1 - 2;
          x1 = x1 + 1;
  
          y2 = y2 - 2;
          x2 = x2 + 1;
      }
  
      if (x1 % 30 == 0)
      {
        fill(r, g, b, 137);
        strokeWeight(3);
        stroke(r, g, b);
        ellipse(x1, y1, 18, 18);
      }
  
     if (x2 % 30 == 0)
     {
       fill(r, g, b, 137);
       strokeWeight(3);
       stroke(r, g, b);
       ellipse(x2, y2, 18, 18);
     }
 
     r = random(255);
     g = random(255);
    b = random(255);
    }
 
 

  

}
