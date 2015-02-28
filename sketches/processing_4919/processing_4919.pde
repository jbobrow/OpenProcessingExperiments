
class Orbiter
{
  float speed;
  float radius;
  float distance;
  float orbit; //degress
  color col;
  int id;
  float wave;

  
  Pointer pOld; //Previous X/Y/Z
  Pointer pNew; //Current X/Y/Z
  
  Orbiter(int init_id, float inSpeed, float inRadius, float inDistance, color inColor)
  {
    id = init_id;
    speed = inSpeed;
    radius = round(inRadius);
    distance = inDistance;
    col = inColor;
    init();
  }
  
  void init()
  {
    orbit = random(360);
    
    pNew = new Pointer(cos(radians(orbit)) * (distance + wave), sin(radians(orbit)) * (distance + wave));
  }
  
  void draw()
  {
    pushMatrix();
    fill(col);
    stroke(0,0);
    noStroke();
    ellipse(pNew.x, pNew.y, radius, radius);
    popMatrix();
  }
  
  void update()
  {
    pOld = pNew;
    orbit += speed;
    if (orbit < 0) orbit+=360;
    orbit %= 360;
    float waveOffset = orbit * 20;
    wave = sin(radians(waveOffset)) * distance/10; 
    pNew.up2D(cos(radians(orbit)) * (distance + wave), sin(radians(orbit)) * (distance + wave));
  }
}

