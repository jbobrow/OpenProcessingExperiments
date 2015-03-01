
class lne
{
   float p, an, spd;
   int r,g,b;
   public lne(float ian, float ispd)
  {
    reset();
  }

  void reset()
  {
    p=0; 
     spd = 1+random(10);
     an = random(TWO_PI);
     r = 100+random(155);
     g = 100+random(155);
     b = 100+random(155);
  }

  void tick(float offs)
  {
    float ospeed = spd + offs;
     float strtx = width/2;
     float strty = height/2;
     float dx = sin(an);
     float dy = cos(an);
     
     strtx +=  dx * p;
     strty +=  dy * p;
     float endx = strtx +( dx * ospeed);
     float endy = strty +( dy * ospeed);
     
     stroke(r,g,b);
     line(strtx, strty, endx, endy);
     p+=max(0,ospeed);
     spd *= 1.02;
    if(p > 280)
    {
        reset();
    }
  }
}


var lns = Array();

float offsetspd=0;
float time=0;
void setup()
{
   
  // setup() runs once
  size(400,400);
  smooth();
  background(0, 0, 255);
  for(int i=0; i < 85; i++)
  {
    lns.push(
       new lne(
         random(TWO_PI),
         1+random(10)
       )
    );
  }
}
void draw()
{
  // draw() loops forever, until stopped
  background(0);
  pushMatrix();
  if(offsetspd > 3)
  {
   float overspd = (offsetspd -3)*5;
    translate(0-overspd/2+random(overspd), 0-overspd/2+random(overspd));
  }
  translate(width/2, height/2);
  rotate(tan(time)*2);
translate(0-width/2, 0-height/2);
 for(var lo : lns)
 {
   lo.tick(offsetspd);
 }
 
 popMatrix();
 time+=0.005;
 offsetspd = sin(time)*6;
  
}
