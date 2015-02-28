
int count = 0;
int period = 100;
int vel = 10;
int rMax;

void setup()
{
  size(600, 600);
  rMax = (int)sqrt(width*width + height*height)/2;

  colorMode(HSB, rMax);
  //strokeWeight(4);
  noFill();
}

void draw()
{
  int r;
  double d;
  
  background(1, 1, 0);

  pushMatrix();
  translate(width/2, height/2);
  
  r=rMax;
  d=count;  
  while(r>0)
  {
    if(r>0 &&r<rMax)
      stroke(r,rMax,r);
    
    r = (int)(rMax*5*(  1.0/((d/rMax)+1) -0.2 ));
    
    ellipse(0, 0, r*2, r*2);
    
    d+=period;
  }
  
  r=rMax;
  d-=2*count;
  while(d>0)
  {
    d-=period;
    
    if(rMax-r>0 && rMax-r<rMax)
      stroke(rMax-r,rMax,r);
    //stroke(0,rMax,r);
    rect(-r, -r, r*2, r*2);
    
    r = (int)(rMax*5*(  1.0/((d/rMax)+1) -0.2 ));
  }
  
  popMatrix();

  count += vel;
  count %= period;
}
