
int sqsize = 38;
int cols = 12, rows = 20;

void setup() {
  size(540,844);
  noLoop();
}

void draw() 
{
  for (float i = 1.0 ; i <= rows; i++)
  {
    for (float j = 1.0 ; j <= cols; j++) 
    {
      noFill();
      stroke(0);
      float angle = radians((i/rows)*random(-45, 45));
      
      pushMatrix();
        translate(j*sqsize, i*sqsize);
        rotate(angle);
        rect(0,0,sqsize,sqsize);
      popMatrix(); 
    }
  }
}


