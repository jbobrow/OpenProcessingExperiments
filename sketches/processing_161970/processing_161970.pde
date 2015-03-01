
//variables
float radius = 10.0;
float angle = 0.0;
float speed = 1;
float offset = 5.0;
float scale = 1.0;
float stage2 = 4000;


//setup
void setup()
{
  size(800,800);
  smooth();
  ellipseMode(RADIUS);
  background(255,0,0);
  
}

//drawing
void draw()
{
  
  float x = offset + cos(angle) * scale;
  float y = offset + sin(angle) * scale;
  fill(0,0,0);
  ellipse(x + 400, y + 400, radius, radius);
  scale += speed;
  angle += speed;
  fill(255,255,255);
  ellipse(x + 400, y + 400, radius/2, radius/2);
  scale += speed/2;
  angle += speed/2;
  
  int time = millis();
  if(time > stage2)
    { 
      scale -= speed;
      angle -= speed;
      ellipse(x + 400, y + 400, radius, radius);
      ellipse(x + 400, y + 400, radius/4, radius/4);
    }
  
}
