
/**Made by Nathan Nifong edited by ellen khansefid
 * 400 particles are initialized with random positions and velocities.<br>
 * around each particle there is a repulsive zone between 30 and 50 pixels from it.<br>
 * other particles within that repulsive zone are pushed away in proprtion to the inverse of thier distance from that particle.<br>
 * a global compressive force pushes all particles toward the center in proportion to thier distance from the center.
 */
 
int num=250; //number of points
float rf = 0.5; //strength of repulsive force
float inner = 30; //inner boundary of repulsive zone in pixels
float outer = 80; //outer boundary of repulsive zone in pixels
float gpf = 0.001; //strength of global compressive force
float fr = 0.7; //friction factor: multiplied by velocity each frame
Part[] p = new Part[num];
 
void setup()
{
  size(400, 400);
  smooth();
  for(int i=0; i<num; i++)
  {
    p[i] = new Part(random(600,300),random(600,300),random(-0.0001,0.0001),random(-0.01,0.01));
  }
}
  
void draw()
{
  if (frameCount==100)
    background(0,0,200);
  fill(0,0,0,7);
  rect(0,0,width,height);
  noFill();
  stroke(255);
  for(int i=0; i<num; i++)
  {
    p[i].calcvel();
    p[i].move();
    p[i].render();
  }
}
 
class Part
{
  public float px,py,vx,vy;
   
  Part(float PXA, float PYA, float VXA, float VYA)
  {
    px = PXA;
    py = PYA;
    vx = VXA;
    vy = VYA;
  }
   
  void calcvel()
  {
    float dx=0,dy=0,dis,rad,ax,ay;
    for(int i=0; i<num; i++)
    {
      if (p[i].px != px)
      {
         
        dx = p[i].px-px;
        dy = p[i].py-py;
        dis = sqrt(sq(dx)+sq(dy));
         
        if (dis<outer && dis>inner)
        {
          rad = atan(dy/dx);
          ax = (1/dis)*cos(rad);
          ay = (1/dis)*sin(rad);
           
          if (dx > 0)
            ax *= -1;
             
          vx += rf*ax;
          vy += rf*ay;
        }
      }
    }
     
    vx += gpf*(200-px);
    vy += gpf*(200-py);
     
    vx *= fr;
    vy *= fr;
     
    if (abs(px-mouseX)<25 && abs(py-mouseY)<25 && mousePressed)
    {
      vx += random(-1,1);
      vy += random(-1,1);
    }
  }
   
  void move()
  {
    px += vx;
    py += vy;
  }
   
  void render()
  {
    point(px,py);
  }
}


