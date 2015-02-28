
void setup() {

  size(500, 500);
}


void draw() {
 
  
  background(255);
  for (float x1 = 0; x1<=width; x1 = x1+20)
  {
    float x2 = x1 + random(x1);
    {
      for (float y1 = 0; y1<= height*random(2); y1 = y1+10)
      {
        float y2 = y1 +random(x1);
        float x3 = x1 +random(5);
        float y3 = y1 +random(5); 
        triangle(x2, x1, y3, mouseY, x3, mouseX);
      }
    }
  }
}



