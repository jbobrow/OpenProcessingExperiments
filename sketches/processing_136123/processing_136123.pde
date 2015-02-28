
class particle
{
  float x,y;
  float v_x, v_y;

  
  particle(float initx, float inity, float initv_x, float initv_y)
  {
    x = initx; y = inity;
    v_x = initv_x; v_y = initv_y;
  }
  
 void draw()
 {
  strokeWeight(5);
  stroke(180,0,255);
   ellipse(x,y,5,5);
 }

 void move()
 {
  x += v_x; y += v_y;
  v_y += g;
  
  if( y>height ) {y=height; v_y *= -1; }
  if( y<0      ) {y=0;      v_y *= -1; }
  if( x>width  ) {x=width;  v_x *= -1; }
  if( x<0      ) {x=0;      v_x *= -1; }
 }
   
}
particle p[] = new particle[500];
float g= 0;

void setup()
{
  //frameRate(15);
  size(600,600);
  for(int i =0 ; i<p.length ; i++)
    p[i] = new particle(
                        width/2+random(-8,8),
                        height/2+random(-8,8),
                        random(-8,8), 
                        random(-8,-8));
}

void draw()
{
  //background(0);
  fill(0,10);
  rect(-1,-1, width+2,height+2);
  for(particle n : p)
  {
    n.move();
    n.draw();
  }
}


