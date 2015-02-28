
float x = random(350);
float y = random(350);
float color_a = random (255);
float color_b = random (255);
float color_c = random (255);
float count = random(200-350);
 
void setup(){  
  size(500,500);  
  background(255);
  noStroke();
  smooth();
  fill (color_a,color_b,color_c);
}

void draw()
{
  if (mousePressed== true) {
   
  }
}

void mousePressed()
{
  float count = random(200-300);
  float color_a = random (255);
  float color_b = random (255);
  float color_c = random (255);  
   fill (color_a,color_b,color_c);
   ellipse(x, y, count, count); 
    x = random(350);
    y = random(350);
    fill (color_a,color_b,color_c);
}

