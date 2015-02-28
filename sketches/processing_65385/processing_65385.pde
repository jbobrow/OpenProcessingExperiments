
class Streak 
{
  PVector pos, prev, vel;  
  int age, maxAge;
  color col;
  
  Streak(float x, float y, int maxAge) 
  {
    this.maxAge = maxAge;
    age = 0;  
    pos = new PVector(x, y);
    prev = new PVector();
    vel = new PVector();
    
    // set hue, saturation, brightness, and alpha of streak
    float h = hueSet[ floor(random(4)) ];
    float s = random(100, 255);
    float b = random(100, 255);
    float a = random(5, 50);
    col = color(h, s, b, a);
  }
  
  void update() 
  {
    prev = pos;
    vel = force[(int)pos.x][(int)pos.y];
    pos.add(vel.x, vel.y, 0);
    age++;
    if (pos.x < 0 || pos.x > width || pos.y <= 0 || pos.y >= height-1) 
      age = maxAge;
  }
  
  void draw() 
  {
    pushStyle();
    stroke(col);
    strokeWeight( map( abs(1 - 2*(float)age/maxAge), 0, 1, maxStrokeWeight, 0));
    line(prev.x, prev.y, pos.x, pos.y);
    popStyle();
  }
}

