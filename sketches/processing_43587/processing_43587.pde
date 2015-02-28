
PImage s;

float m;
float easedR = 0;
float easing = 0.03;
 
void setup()
{
  size(600, 600);
  smooth();
  noFill();
  rectMode(CENTER);
  
  s = loadImage("final_logo.png");
}
 
void draw()
{
  background(255,100,0);
  noFill();
  target(mouseX);
}
 
 
void target(float mx)
{
 
  m = map(mx, 0, width/2, 0, 50);
  easedR += (m - easedR) * easing;
 
  translate(width/2, height/2);
  for (int i=0; i<=360; i+=10)
  {
    pushMatrix();
    //float x = easedR * cos(radians(i));
    //float y = easedR * sin(radians(i));
 
    rotate( radians(easedR*i/20.0));
    scale (5);
    image(s,  0,0, 50,50);
    popMatrix();
  }
}

