
PVector pos, vel, center, mouseDown;

float rad, angle, r;

void setup()
{
  size(400,400);
  rad = 20;
  center = new PVector(width/2, height/2);
  pos = new PVector(width*.75, height*.75);
  vel = new PVector();
  r = dist(center.x, center.y, pos.x, pos.y);
  
  
}

void draw()
{
  //background(150);
  
  update();
  fill(60,10);
  rect(0, 0, width, height);
  fill(255);
  ellipse(pos.x, pos.y, rad, rad);
  
}

//

void update()
{
 
 angle = atan2(center.x-pos.x, center.y-pos.y); 
 vel.x = r*cos(angle);
 vel.y = -r*sin(angle);
 vel.mult(.01);
 pos.add(vel);
 
 //sub velocity for reverse direction
  
  
}

void mousePressed()
{
  mouseDown = new PVector(mouseX, mouseY);
  pos = mouseDown;
}


