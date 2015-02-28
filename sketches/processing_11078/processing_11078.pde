
int num=200; //number of points
float rf = -0.09; //strength of attractive force
float gpf = 0.9; //strength of global compressive force
float fr = 0.999; //friction factor: multiplied by velocity each frame
Part[] p = new Part[num];
float avgx = 0;
float avgy = 0;

void setup()
{
  size(screen.width, screen.height);
  smooth();
  noCursor();
  stroke(255);
  strokeWeight(4);
  for(int i=0; i<num; i++)
  {
    p[i] = new Part(random(-100,100),random(-100,100));
  }
  
}
 
void draw()
{
  fill(255,200,0,30);
  rect(0,0,width,height);
  stroke(0);
  avgx = 0;
  avgy = 0;
  for(int i=0; i<num; i++){
    p[i].calcvel();
    p[i].move();
    
    avgx += p[i].px;
    avgy += p[i].py;
  }
  avgx /= num;
  avgy /= num;
  
  translate(width/2-avgx, height/2-avgy);
  for(int i=0; i<num; i++){
    p[i].render();
  }
  
  /*
  camera(avgx, avgy, 400, // eyeX, eyeY, eyeZ
         avgx, avgy, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  */
}

class Part
{
  public float px,py,vx,vy;
  private float dx=0,dy=0,dis,rad,ax,ay;
  
  Part(float PXA, float PYA)
  {
    px = PXA;
    py = PYA;
    
    vx += random(-1,1);
    vy += random(-1,1);
  }
  
  void calcvel()
  {
    
    for(int i=0; i<num; i++)
    {
      if (p[i] != this)
      {
        dx = px-p[i].px;
        dy = py-p[i].py;
        dis = sqrt(sq(dx)+sq(dy));
        //if (dis<outer){
          rad = atan(dy/dx);
          if(dx<0) rad+=PI;
          ax =(10/dis)*cos(rad);
          ay = (10/dis)*sin(rad);
                
          vx += rf*ax;
          vy += rf*ay;
        //}
      }
    }
    
    
    //global compressive force
    px -= width/2;
    py -= height/2;
    px *= gpf;
    py *= gpf;
    px += width/2;
    py += height/2;
    
    //random
    vx += random(-0.6, 0.6);
    vy += random(-0.6, 0.6);

    //friction
    vx *= fr;
    vy *= fr;

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
 

