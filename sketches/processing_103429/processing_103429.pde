
float rGlobale = 250;
float rMax = rGlobale/2;
float rMin = 5;
boolean spazio = true;
ArrayList occhi;

void setup()
{
  size(600, 600);
  background(0);
  
  smooth();
  
  //strokeWeight(4);
  occhi = new ArrayList();
  //occhi.add(new Occhio(100,100,5));
}

void draw()
{
  background(0);
  stroke(#888a85);
  fill(#eeeeec);
  ellipse(width/2,height/2,rGlobale*2+2,rGlobale*2+2);
  
  float x,y,r;
  
  if(spazio)
  {
    spazio = false;
    for(int i=0; i<500; i++)
    {
      x = random(width);
      y = random(height);
      
      r = nelBordo(x,y, dPuntoOcchio(x,y));
      
      if(r>rMax)
        r = rMax;
      
      if(r>=rMin)
      {
        occhi.add(new Occhio(x,y,r-1));
        spazio = true;
      }
    }
  }
  
  for(int i=0; i<occhi.size(); i++)
  {
    Occhio o = (Occhio)occhi.get(i);
    o.aggiorna();
  }
}

class Occhio
{
  float x,y;
  float eye_rad;
  color iris_color;
  
  Occhio(float _x, float _y, float _r)
  {
    x = _x;
    y = _y;
    eye_rad = _r;
    
    colorMode(HSB, 360, 100, 100);
    iris_color = color(random(360),70,100);
  }
  
  void aggiorna()
  {
    stroke(#888a85);
    fill(#ffffff);
    
    ellipse(x,y,eye_rad*2,eye_rad*2);
    
    pushMatrix();
    translate(x, y);
    
    float mouse_ang = atan2(mouseY - y, mouseX - x);
    rotate(mouse_ang);
    
    
    float mouse_rad = dPunti(x,y, mouseX,mouseY);
    
    float iris_rad = eye_rad*0.5;
    
    float pupil_rad = iris_rad*0.4;
    if(mouse_rad < eye_rad)
      pupil_rad *= 1.5;
        
    float iris_arc = asin(iris_rad/eye_rad);
    float iris_r = eye_rad*cos(iris_arc);
    
    float eye_ang = atan(mouse_rad/iris_r);
    
    if(eye_ang > radians(90)-iris_arc)
      eye_ang = radians(90)-iris_arc;
    
    fill(iris_color);
    ellipse(iris_r*sin(eye_ang), 0,
            iris_rad*2*cos(eye_ang), iris_rad*2);
    
    fill(0);
    ellipse(eye_rad*sin(eye_ang), 0,
            pupil_rad*2*cos(eye_ang), pupil_rad*2);
    
    popMatrix();
  }
}

float dPunti(float x0,float y0, float x1,float y1)
{
  return sqrt((x1-x0)*(x1-x0) + (y1-y0)*(y1-y0));
}

float dPuntoOcchio(float x, float y)
{
  float dMin = width*height;
  float d;
  
  for(int i=0; i<occhi.size(); i++)
  {
    Occhio o = (Occhio)occhi.get(i);
    d = dPunti(x,y, o.x,o.y)-o.eye_rad;
    if(d<dMin)
      dMin = d;
  }
  return dMin;
}

float nelBordo(float x, float y, float r)
{
  float dCentro = dPunti(x,y, width/2, height/2);
  if(dCentro+r > rGlobale)
    r = rGlobale-dCentro;
  
  /*
  if(r>rMax)   r = rMax;
  if(x-r<0)    r = x;
  if(y-r<0)    r = y;
  if(x+r>width)  r = width-x;
  if(y+r>height) r = height-y;
  */
  
  return r;
}
