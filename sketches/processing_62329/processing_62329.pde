
int counter;

voint value = 0;
void setup()
{ 
  size(400, 600); 
  background(0, 0, 0);
  smooth(); 
  frameRate(5);
} 
void draw()
{ 
  if (key == 'f')
  {
    value+=10; 
    background(0, value, value);
  }
  if (key == 'r') 
  { 
    value-=10; 
    background(0, value, value);
  }
  fill(random(255), random(255), random(255));
  strokeWeight(random(8, 15));
  ellipse(width/2, height/2, 200, 200);
  stroke(random(255), random(255), random(255)); 
  strokeWeight(20);
  point(240, 270);
  point(160, 270);
  noFill();
  strokeWeight(8);
  fill(random(255), random(255), random(255)); 
  triangle(100, 200, 300, 200, width/2, 0);

  noFill(); 

  if (mouseButton == LEFT) 
  { 
    arc(width/2, 350, 100, 70, PI, TWO_PI);
  }
  else 
  { 
    arc(width/2, 325, 100, 70, 0, PI);
  }
}
