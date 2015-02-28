
final int MAX_NB_CIRCLES = 50;
final float AVERAGE_DIST = 10;

final float MIN_ELLIPSE = 1;
final float MAX_ELLIPSE = 55;

final float FRICTION = .4;

PVector[] radius;

void setup()
{
  size(500, 500);
  noFill();
  strokeWeight(2);
  stroke(255);
  radius = new PVector[MAX_NB_CIRCLES];
  for (int i = 1; i < MAX_NB_CIRCLES; i++)
  {
      radius[i] =  new PVector(2*i*MIN_ELLIPSE, 2*i*MIN_ELLIPSE);
  }
}

void draw()
{
  background(0); 

  radius[0] =  new PVector(MIN_ELLIPSE+mouseX*(MAX_ELLIPSE-MIN_ELLIPSE)/width, MIN_ELLIPSE+mouseY*(MAX_ELLIPSE-MIN_ELLIPSE)/height);
  ellipse(width/2, height/2, radius[0].x, radius[0].y);
  
  for (int i = 1; i < MAX_NB_CIRCLES; i++)
  {
    float deltaX = radius[i-1].x - radius[i].x + AVERAGE_DIST;
    float deltaY = radius[i-1].y - radius[i].y + AVERAGE_DIST;
    
    radius[i].x += deltaX * FRICTION;
    radius[i].y += deltaY * FRICTION;
    
    ellipse(width/2, height/2, radius[i].x, radius[i].y);
  }
}


