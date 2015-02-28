

void setup()
{
  size(700,700);
  background(0);
  colorMode(HSB,255);
}

void draw()
{
  frameRate(2);
  background(0);
  float delta = 1/32.;
  strokeWeight(1);
  stroke(255);
  float x = 0;
  while (x < 10)
  {
    float xpos = map(x,0,10,0,width);
    float ypos = map(10-x,0,10,0,height);
    stroke(map(xpos,0,width,0,255),map(ypos,0,height,100,255),map(xpos*ypos,0,width*height,100,255),random(100)+100);
    line(xpos,0,0,ypos);
    line(xpos,0,width,height-ypos);
    line(xpos,height,0,height-ypos);
    line(xpos,height,width,ypos);
    x += delta;
  }
  //fill(0,255,0);
  //ellipse(width,height,2*width,2*height);
}
    
  
