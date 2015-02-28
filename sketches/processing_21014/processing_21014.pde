
PImage b;
boolean[] keys;

ArrayList balls,removeThese;

float diff = 1;

float[][] xs;
PFont arial;
boolean lost,drawAvg;

void setup()
{
  size(800,600);
  smooth ();
b = loadImage("Balls4.jpg");

 
  keys = new boolean[4];
  

  balls = new ArrayList();
  removeThese = new ArrayList();
  xs = new float[width/1][2];


}
 
void draw()
{
 
  diff+=.001;
  
  background(b);
  
  if((int)random(100)<diff)
    balls.add(new Ball());
  render();  

  if(drawAvg)
    for(int i=1;i<xs.length;i++)
      if(xs[i][1]>0)
        line((i-1)*1,xs[i-1][0]/xs[i-1][1],i*1,xs[i][0]/xs[i][1]);
  fill(0);
  
} 
void render()
{
  
  for(int i=0;i<balls.size();i++)
  {
    Ball temp = (Ball) balls.get(i);

    temp.update(xs);
    
   
  }
  for(int i=0;i<removeThese.size();i++)
  {
    Integer index = (Integer) removeThese.get(i);
    balls.remove(index.intValue());
  }
  removeThese.clear();
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  noStroke();

 fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  stroke(0);
}
 
void handleBounds()
{
}
class Ball
{
  PVector pos,vel,acc;
  float radius;
  float gravity = .02;
  float h;
  Ball()
  {
    radius = random(10,35);
    pos = new PVector(-radius,-radius);
    vel = new PVector(random(.5,1),0);
    acc = new PVector(0,gravity);

  }
  void update(float[][] inxs)
  {
    pos.add(vel);
    vel.add(acc);
    checkBounce();
    render();
    if((int)pos.x%1==0 && (int)pos.x>0 && (int)pos.x<width)
    {
      inxs[(int)pos.x/1][0] +=pos.y;
      inxs[(int)pos.x/1][1] ++;
    }
  }
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(0,0,radius,radius);
    colorMode(RGB, 255);
    popMatrix();
  }
  void checkBounce()
  {
    if(pos.y>height-radius/2)
    {
      pos.y = height-radius/2;
      vel.y*=-map(radius,10,40,.9,.6);
    }
  }
}

