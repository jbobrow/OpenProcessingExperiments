
float x = 0; 
float y = 50; 
float angle = 0; 
float speed = .8; 

void setup()
{
  size(400, 400);
  background(0);
  randomSeed(10); 
}

void draw() 


{
  stroke(random(100,255 ), random(0, 185), random(0, 255),60);
  strokeWeight(4);
  angle += random(-0.3, 0.3);
  x += cos(angle) * speed; 
  y += sin(angle) * speed; 
  translate(x, y);
  rotate(angle);
  line(0, -10, 0, 40);
}
